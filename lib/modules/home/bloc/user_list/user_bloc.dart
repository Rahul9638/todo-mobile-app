import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_management/data/model/response_modal/user_detail_response.dart';
import 'package:user_management/data/repository/user_repository.dart';
import 'package:user_management/utils/cache/cache_manager.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(this.userRepo) : super(UserInitial()) {
    on<UserEvent>((UserEvent event, Emitter<UserState> emit) async {
      cacheManager = CacheManager<UserDetailResponse>(boxName);
      if (event is UsersRequested) {
        await loadFromCache(event, emit);
      }
    });
  }

  Future<void> loadFromCache(
      UsersRequested event, Emitter<UserState> emit) async {
    emit(UsersLoading());
    try {
      await loadUserData().then((List<UserDetailResponse> value) async {
        if (value.isNotEmpty) {
          isCacheLoaded = true;
          emit(UsersLoaded(userList: value));
        }
        await loadUserFromServer(event, emit);
      });
    } catch (e) {
      await loadUserFromServer(event, emit);
    }
  }

  Future<void> loadUserFromServer(
      UsersRequested event, Emitter<UserState> emit) async {
    try {
      await userRepo.getUsers().then((List<UserDetailResponse> value) async {
        await updateCache(value);
        emit(UsersLoading());
        emit(UsersLoaded(userList: value));
      });
    } catch (e) {
      if (isCacheLoaded == false) {
        emit(UsersLoadError());
      }
    }
  }

  Future<List<UserDetailResponse>> loadUserData() async {
    initHiveBox(boxName);
    final List<UserDetailResponse> userDetail = await cacheManager.getAll();
    return userDetail;
  }

  Future<void> updateCache(List<UserDetailResponse> users) async {
    initHiveBox(boxName);
    cacheManager.clear();
    cacheManager.addAll(users);
  }

  late CacheManager<UserDetailResponse> cacheManager;

  void initHiveBox(String boxName) {
    cacheManager = CacheManager<UserDetailResponse>(boxName);
  }

  final UserRepository userRepo;
  late UserDetailResponse userDetail;
  final String boxName = 'user_response';
  UserDetailResponse get user => userDetail;

  set user(UserDetailResponse userId) {
    userDetail = userId;
  }

  bool isCacheLoaded = false;
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/subjects.dart';
import 'package:user_management/config/app_constant/string_constant.dart';
import 'package:user_management/data/model/response_modal/user_detail_response.dart';
import 'package:user_management/modules/home/bloc/user_list/user_bloc.dart';
import 'package:user_management/modules/home/screen/widget/user_detail_tile.dart';

class UserListingPage extends StatefulWidget {
  const UserListingPage({super.key});

  @override
  State<UserListingPage> createState() => _UserListingPageState();
}

class _UserListingPageState extends State<UserListingPage> {
  final BehaviorSubject<List<UserDetailResponse>> data =
      BehaviorSubject<List<UserDetailResponse>>.seeded([]);
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    data.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStringConstant.userList),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: BlocBuilder<UserBloc, UserState>(
          builder: (BuildContext context, UserState state) {
            if (state is UsersLoaded) {
              return Column(
                children: [
                  const SizedBox(height: 10),
                  searchBar(state.userList),
                  const SizedBox(height: 20),
                  Expanded(child: UserDetailTile(data: state.userList)),
                ],
              );
            }
            return Container();
          },
        ),
      ),
    );
  }

  Widget searchBar(List<UserDetailResponse> userData) {
    final ThemeData theme = Theme.of(context);
    return SearchAnchor(
      builder: (BuildContext context, SearchController controller) {
        return SearchBar(
          elevation: const MaterialStatePropertyAll<double?>(0),
          hintText: AppStringConstant.enterName,
          padding: const MaterialStatePropertyAll<EdgeInsets>(
              EdgeInsets.symmetric(horizontal: 16.0)),
          backgroundColor: MaterialStatePropertyAll<Color?>(
              theme.colorScheme.tertiary.withOpacity(0.3)),
          controller: controller,
          onTap: () {
            controller.openView();
          },
          leading: const Icon(Icons.search),
        );
      },
      suggestionsBuilder: (BuildContext context, SearchController controller) {
        onFilter(userData, controller.text);
        return List<Widget>.generate(
          data.value.length,
          (int index) {
            return StreamBuilder<List<UserDetailResponse>>(
                stream: data.stream,
                builder: (BuildContext context,
                    AsyncSnapshot<List<UserDetailResponse>> snapshot) {
                  return UserDetailTile(
                    data: snapshot.data ?? [],
                  );
                });
          },
        );
      },
    );
  }

  void onFilter(List<UserDetailResponse> userDetail, String searchQuery) {
    final List<UserDetailResponse> userList = userDetail
        .where((UserDetailResponse userDetail) =>
            userDetail.name!.toLowerCase().contains(searchQuery.toLowerCase()))
        .toList();
    data.add(userList);
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:user_management/config/app_constant/string_constant.dart';
import 'package:user_management/config/routes/routes.dart';
import 'package:user_management/modules/home/bloc/user_list/user_bloc.dart';
import 'package:user_management/widget/dialog/logout_dialog.dart';
import 'package:user_management/widget/generic_widget/sowething_went_wrong.dart';
import 'package:user_management/modules/home/screen/widget/user_detail_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    loadUserData();
    super.initState();
  }

  void loadUserData() {
    BlocProvider.of<UserBloc>(context).add(UsersRequested());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                showLogoutDialog(context);
              },
              icon: Icon(Icons.account_circle_outlined))
        ],
        title: const Text(AppStringConstant.userManagement),
      ),
      body: BlocBuilder<UserBloc, UserState>(
        builder: (BuildContext context, UserState state) {
          if (state is UsersLoaded) {
            return UserDetailTile(data: state.userList);
          }
          if (state is UsersLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is UsersLoadError) {
            return SomethingWentWrong(onPressed: loadUserData);
          }
          return Container();
        },
      ),
      floatingActionButton: BlocBuilder<UserBloc, UserState>(
        builder: (BuildContext context, UserState state) {
          if (state is UsersLoaded) {
            return FloatingActionButton(
              onPressed: () {
                context.pushNamed(AppRoute.search);
              },
              child: const Icon(Icons.search),
            );
          }
          return Container();
        },
      ),
    );
  }
}

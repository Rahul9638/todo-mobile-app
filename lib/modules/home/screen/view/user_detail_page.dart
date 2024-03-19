import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_management/config/app_constant/string_constant.dart';
import 'package:user_management/modules/home/bloc/user_list/user_bloc.dart';

class UserDetailPage extends StatefulWidget {
  const UserDetailPage({super.key});

  @override
  State<UserDetailPage> createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  late UserBloc userBloc;
  @override
  void initState() {
    userBloc = BlocProvider.of(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppStringConstant.userDetail),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: CachedNetworkImage(
                  imageUrl: userBloc.user.avatar ?? '',
                  height: 100,
                  width: 100,
                  errorWidget: (_, __, ___) {
                    return const Icon(
                      Icons.error,
                      size: 100,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            Align(
              child: Text(
                userBloc.user.name ?? '',
                style: theme.textTheme.headlineSmall,
              ),
            ),
            const SizedBox(height: 20),
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                border: Border.all(color: theme.colorScheme.outlineVariant),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  descriptionWidget(
                      Icons.turned_in_rounded, userBloc.user.id.toString()),
                  descriptionWidget(Icons.email, userBloc.user.email ?? ''),
                  descriptionWidget(
                      Icons.engineering, userBloc.user.role ?? ''),
                  descriptionWidget(
                      Icons.password_outlined, userBloc.user.password ?? '')
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget descriptionWidget(IconData icon, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon),
          const SizedBox(width: 20),
          Expanded(child: Text(label)),
        ],
      ),
    );
  }
}

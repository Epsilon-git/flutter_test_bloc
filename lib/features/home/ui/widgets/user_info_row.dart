import 'package:flutter/material.dart';
import 'package:flutter_test_bloc/features/home/model/user.dart';

class UserInfoRow extends StatelessWidget {
  const UserInfoRow({super.key, required this.user});

  final User user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // leading: CachedNetworkImage(
      //   imageUrl: user.picture.large,
      //   placeholder: (context, url) => CircularProgressIndicator(),
      //   errorWidget: (context, url, error) => Icon(Icons.error),
      // ),
      title: Text(user.name.fullName),
      subtitle: Text(user.email),
    );
  }
}

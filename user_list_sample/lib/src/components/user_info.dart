import 'package:flutter/material.dart';
import 'package:user_list_sample/src/model/user_info_results.dart';

class UserInfoWidget extends StatelessWidget {
  final UserInfo userInfo;
  const UserInfoWidget({
    required this.userInfo,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
      child: Row(
        children: [
          CircleAvatar(
            backgroundImage: Image.network(userInfo.profileImage).image,
            radius: 35,
          ),
          const SizedBox(
            width: 20.0,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                userInfo.email,
                style: TextStyle(fontWeight: FontWeight.w200, fontSize: 11.0),
              ),
              Text(
                userInfo.name,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.blue),
              ),
              SizedBox(
                height: 7,
              ),
              Row(
                children: [
                  Icon(
                    Icons.phone,
                    size: 20,
                  ),
                  Text(
                    userInfo.phone,
                  )
                ],
              )
            ],
          ))
        ],
      ),
    );
  }
}

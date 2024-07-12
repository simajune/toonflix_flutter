import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:user_list_sample/src/model/user_info_results.dart';

import '../components/user_info.dart';

class UserListPageSetState extends StatefulWidget {
  const UserListPageSetState({super.key});

  @override
  State<UserListPageSetState> createState() => _UserListPageSetStateState();
}

class _UserListPageSetStateState extends State<UserListPageSetState> {
  late Dio _dio;
  ScrollController scrollController = ScrollController();
  late UserInfoResult userInfoResult;
  int nextPage = -1;
  @override
  void initState() {
    super.initState();
    _dio = Dio(BaseOptions(baseUrl: 'https://randomuser.me/'));
    scrollController.addListener(
      () {
        if (scrollController.position.maxScrollExtent * 0.7 <=
                scrollController.offset &&
            nextPage != userInfoResult.currentPage) {}
        nextPage = userInfoResult.currentPage;
        print(nextPage);
        setState(() {});
      },
    );
  }

  Future<UserInfoResult> _loadUserList() async {
    print('userInfoResult.currentPage');
    var result = await _dio.get('api', queryParameters: {
      'results': 10,
      'seed': 'sudar',
      'page': userInfoResult.currentPage,
    });
    await Future.delayed(Duration(milliseconds: 500));
    userInfoResult = userInfoResult.copyWithFromJson(result.data);
    return UserInfoResult.fromJson(result.data);
  }

  Widget _loading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _error() {
    return const Center(
      child: Text('오류발생'),
    );
  }

  Widget _userListWidget(List<UserInfo> list) {
    return ListView.separated(
        controller: scrollController,
        itemBuilder: (context, index) {
          return UserInfoWidget(
            userInfo: list[index],
          );
        },
        separatorBuilder: (context, index) => const Divider(
              color: Colors.grey,
            ),
        itemCount: list.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('setState 상태관리'),
      ),
      body: FutureBuilder<UserInfoResult>(
          future: _loadUserList(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return _error();
            }
            if (snapshot.hasData) {
              return _userListWidget(snapshot.data!.userInfoList);
            }
            return _loading();
          }),
    );
  }
}

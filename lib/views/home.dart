import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:getapibloc/models/usermodel.dart';
import 'package:getapibloc/repos/userrepository.dart';

import '../blocs/getapi/getapi_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetapiBloc(
        RepositoryProvider.of<UserRepository>(context),
      )..add(GetapiLoadEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: Text('User Data'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: BlocBuilder<GetapiBloc, GetapiState>(
            builder: (context, state) {
              if (state is GetapiLoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is GetapiLoadedState) {
                List<UserModel> userList = state.users;
                return ListView.builder(
                  itemCount: userList.length,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.blue,
                      elevation: 4,
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: ListTile(
                        title: Text(
                          userList[index].firstname.toString(),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        subtitle: Text(
                          userList[index].lastname.toString(),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        trailing: CircleAvatar(
                          backgroundImage:
                              NetworkImage(userList[index].avatar.toString()),
                        ),
                      ),
                    );
                  },
                );
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}

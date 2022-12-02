part of 'getapi_bloc.dart';

abstract class GetapiState extends Equatable {}

class GetapiLoadingState extends GetapiState {
  @override
  List<Object> get props => [];
}

class GetapiLoadedState extends GetapiState {
  GetapiLoadedState(this.users);
  final List<UserModel> users;
  @override
  List<Object> get props => [users];
}

class GetapiErrorState extends GetapiState {
  GetapiErrorState(this.error);
  final String error;
  @override
  List<Object> get props => [error];
}

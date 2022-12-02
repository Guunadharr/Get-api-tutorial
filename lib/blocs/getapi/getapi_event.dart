part of 'getapi_bloc.dart';

abstract class GetapiEvent extends Equatable {
  const GetapiEvent();
}

class GetapiLoadEvent extends GetapiEvent {
  @override
  List<Object> get props => [];
}

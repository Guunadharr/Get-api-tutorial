import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:getapibloc/repos/userrepository.dart';

import '../../models/usermodel.dart';

part 'getapi_event.dart';
part 'getapi_state.dart';

class GetapiBloc extends Bloc<GetapiEvent, GetapiState> {
  final UserRepository _userRepository;

  GetapiBloc(this._userRepository) : super(GetapiLoadingState()) {
    on<GetapiLoadEvent>((event, emit) async {
      emit(GetapiLoadingState());
      try {
        final users = await _userRepository.getUsers();
        emit(GetapiLoadedState(users));
      } catch (e) {
        emit(GetapiErrorState(e.toString()));
      }
    });
  }
}

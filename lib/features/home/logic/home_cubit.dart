import 'package:docdoc/core/networking/api_results.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repos/home_repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(HomeState.initial());

  void getSpecialization() async {
    emit(HomeState.specializationLoading());
    final response = await _homeRepo.getSpecialization();
    response.when(
      success: (specializationResponse) {
        emit(HomeState.specializationSuccess(specializationResponse));
      },
      error: (error) {
        emit(HomeState.specializationError(error: error.apiErrorModel.message ?? ""));
      },
    );
  }
}

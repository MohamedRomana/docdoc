import 'package:docdoc/core/helper/extentions.dart';
import 'package:docdoc/core/networking/api_results.dart';
import 'package:docdoc/features/home/data/models/specialization_response_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repos/home_repo.dart';
import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final HomeRepo _homeRepo;
  HomeCubit(this._homeRepo) : super(HomeState.initial());

  List<SpecializationData?>? specializationList = [];
  void getSpecialization() async {
    emit(HomeState.specializationLoading());
    final response = await _homeRepo.getSpecialization();
    response.when(
      success: (specializationResponse) {
        specializationList = specializationResponse.specializations ?? [];
        getDoctorsList(specializationId: specializationList?.first?.id ?? 0);
        emit(HomeState.specializationSuccess(specializationList));
      },
      error: (error) {
        emit(
          HomeState.specializationError(
            error: error.apiErrorModel.message ?? "",
          ),
        );
      },
    );
  }

  void getDoctorsList({required int specializationId}) {
    List<DoctorsList?>? specializationDoctorsList = filterDoctorsList(
      specializationId: specializationId,
    );

    if (!specializationDoctorsList.isNullOrEmpty()) {
      emit(HomeState.doctorSuccess(specializationDoctorsList));
    } else {
      emit(HomeState.doctorError(error: "No Doctors Found"));
    }
  }

  filterDoctorsList({required int specializationId}) {
    return specializationList
        ?.firstWhere((element) => element?.id == specializationId)
        ?.doctorsList;
  }
}

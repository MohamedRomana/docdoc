import 'package:docdoc/core/networking/erro_handler.dart';
import 'package:docdoc/features/home/data/models/specialization_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  // Specialization
  const factory HomeState.specializationLoading() = SpecializationLoading;
  const factory HomeState.specializationSuccess(
    List<SpecializationData?>? specializations,
  ) = SpecializationSuccess;
  const factory HomeState.specializationError({required String error}) =
      SpecializationError;

  // Doctor
  const factory HomeState.doctorSuccess(List<DoctorsList?>? doctorsList) =
      DoctorSuccess;
  const factory HomeState.doctorError({required String error}) = DoctorError;
}

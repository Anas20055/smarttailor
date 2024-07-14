import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'organization_state.dart';

class OrganizationCubit extends Cubit<OrganizationState> {
  OrganizationCubit() : super(const OrganizationInitial(true));
  void organizationExist() {
    emit(const OrganizationLoaded(true));
  }
}

part of 'organization_cubit.dart';

abstract class OrganizationState extends Equatable {
  final bool? organizationExist;
  const OrganizationState({this.organizationExist});

  @override
  List<Object> get props => [];
}

class OrganizationInitial extends OrganizationState {
  const OrganizationInitial(bool organizationExist)
      : super(organizationExist: organizationExist);
}

class OrganizationLoaded extends OrganizationState {
  const OrganizationLoaded(bool organizationExist)
      : super(organizationExist: organizationExist);
}

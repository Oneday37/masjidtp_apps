part of 'masjidtp_bloc.dart';

@immutable
sealed class MasjidtpState {}

final class MasjidtpInitial extends MasjidtpState {}

final class MasjidtpLoaded extends MasjidtpState {}

final class MasjidtpLoading extends MasjidtpState {}

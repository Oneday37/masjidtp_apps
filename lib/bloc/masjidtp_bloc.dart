import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'masjidtp_event.dart';
part 'masjidtp_state.dart';

class MasjidtpBloc extends Bloc<MasjidtpEvent, MasjidtpState> {
  MasjidtpBloc() : super(MasjidtpInitial()) {
    on<OnMasjidTpEventCalled>((event, emit) async {
      emit(MasjidtpLoading());
      await Future.delayed(const Duration(seconds: 5));
      emit(MasjidtpLoaded());
    });
  }
}

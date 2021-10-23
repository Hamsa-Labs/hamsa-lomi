// Dart imports:
import 'dart:async';

// Package imports:
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

// Project imports:
import '../../../domain/auth/use_cases/get_user_changes_stream_use_case.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final GetUserChangesStreamUseCase _userChangesStreamUseCase;

  StreamSubscription<User?>? _subscription;

  AuthBloc(this._userChangesStreamUseCase) : super(AuthInitial()) {
    _subscription = _userChangesStreamUseCase().listen((user) {
      if (user != null) {
        add(Authenticated(user: user));
      } else {
        add(Unauthenticated());
      }
    });

    on<Authenticated>((event, emit) {
      emit(AuthAuthenticated(user: event.user));
    });
    on<Unauthenticated>((event, emit) {
      emit(AuthUnauthenticated());
    });
  }

  @override
  Future<void> close() {
    if (_subscription != null) {
      _subscription!.cancel();
    }
    return super.close();
  }
}

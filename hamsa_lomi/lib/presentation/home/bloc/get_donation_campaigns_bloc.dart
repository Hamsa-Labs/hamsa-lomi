import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import '../../../domain/core/entities/entities.dart';
import '../../../domain/get_donation_campaigns/use_cases/get_donation_campaign_use_case.dart';
import 'package:injectable/injectable.dart';

part 'get_donation_campaigns_event.dart';
part 'get_donation_campaigns_state.dart';

@injectable
class GetDonationCampaignsBloc
    extends Bloc<GetDonationCampaignsEvent, GetDonationCampaignsState> {
  final GetDonationCampaignUseCase _getDonationCampaignUseCase;

  GetDonationCampaignsBloc(this._getDonationCampaignUseCase)
      : super(GetDonationCampaignsState()) {
    on<DonationCategorySet>((event, emit) {
      emit(state.copyWith(category: event.category));
    });
    on<GetDonationCampaignsRequested>((event, emit) async {
      if (state.category == null) {
        return;
      }

      emit(state.copyWith(status: FormzStatus.submissionInProgress));

      final failureOrSuccess =
          await _getDonationCampaignUseCase(state.category!);

      emit(
        failureOrSuccess.fold(
          (l) => state.copyWith(
            status: FormzStatus.submissionFailure,
            errorMessage: l.message,
          ),
          (r) => state.copyWith(
            status: FormzStatus.submissionSuccess,
            campaigns: r,
          ),
        ),
      );
    });
  }
}

import 'package:bloc/bloc.dart';
import 'package:finance_wise/core/services/transaction_service.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.transactionsService) : super(HomeInitial());

  final TransactionsService transactionsService;

  Future<void> getNumbersDetails() async {
    try {
      final balance = await transactionsService.getTotalBalance();
      final expense = await transactionsService.getTotalExpenses();
      final income = await transactionsService.getTotalIncome();
      emit(NumbersLoaded(balance, expense, income));
    } catch (e) {
      emit(HomeError(message: e.toString()));
    }
  }

  Future<void> refreshNumbers() async {
    emit(NumbersLoading());
    await getNumbersDetails();
  }
}

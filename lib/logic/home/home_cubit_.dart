import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubitCubit extends Cubit<HomeCubitState> {
  HomeCubitCubit() : super(HomeCubitInitial());
}

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bottom_nav_state.dart';

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit() : super(BottomNavInitial());

  int index = 0;

  void onTapChange(int indexChange){
    index = indexChange;
    emit(BottomNavInitial());
  }

}

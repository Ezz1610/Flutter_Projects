
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:train/modules/counter/cubit/states.dart';
import 'package:train/modules/counter_app/counter/cubit/states.dart';

class CounterCubit extends Cubit<CounterStates>
{
  CounterCubit() : super(CounterInitialState());
  int counter=1;
  static CounterCubit get(context)=>BlocProvider.of(context);
  void minus(){
    counter--;
    emit(CounterMinusState());
  }
  void plus(){
    counter++;
    emit(CounterPlusState());
  }

}
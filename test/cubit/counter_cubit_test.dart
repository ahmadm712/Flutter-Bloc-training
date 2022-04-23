import 'package:bloc_test/bloc_test.dart';
import 'package:counter_bloc/bloc/counter_bloc.dart' as bloc;
import 'package:counter_bloc/cubit/counter_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CounterCubit counterCubit;
  late bloc.CounterBloc counterBloc;

  setUp(() {
    counterCubit = CounterCubit();
    counterBloc = bloc.CounterBloc();
  });

  test('Initial State should be CounterState(0)', () {
    expect(counterCubit.state, CounterState(0));
  });

  blocTest<CounterCubit, CounterState>(
    'Should emit CounterState(1) when increment event is added',
    build: () => counterCubit,
    act: (cubit) => cubit.increment(),
    expect: () => [
      CounterState(1),
    ],
  );

  blocTest<CounterCubit, CounterState>(
    'Should emit CounterState(-1) when Decrement event is added',
    build: () => counterCubit,
    act: (cubit) => cubit.decrement(),
    expect: () => [
      CounterState(-1),
    ],
  );

  blocTest<bloc.CounterBloc, bloc.CounterState>(
    'Should emit CounterState(1) when Increment event is added',
    build: () => counterBloc,
    act: (blocC) => blocC.add(bloc.Increment()),
    expect: () => [
      bloc.CounterState(1),
    ],
  );
}

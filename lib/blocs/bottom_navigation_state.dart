import 'package:equatable/equatable.dart';

abstract class BottomNavigationState extends Equatable
{
  BottomNavigationState([List props = const []]) : super();
}
class CurrentIndexChanged extends BottomNavigationState
{
  final int currentIndex;
  CurrentIndexChanged({required this.currentIndex});
  @override
  String toString() => 'CurrentIndexChanged to $currentIndex';

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
class PageLoading extends BottomNavigationState
{
  @override
  String toString() => 'Page Loading';

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
class FirstPageLoaded extends BottomNavigationState
{
  final String? text;
  FirstPageLoaded({required this.text}) : super([text]);
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();

}
class SecondPageLoaded extends BottomNavigationState {
  final int? number;

  SecondPageLoaded({required this.number}) : super([number]);

  @override
  String toString() => 'SecondPageLoaded with number: $number';

  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}
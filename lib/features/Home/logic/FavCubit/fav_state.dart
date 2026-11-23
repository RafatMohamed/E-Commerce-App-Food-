class FavState {}

final class FavInitial extends FavState {}

final class FavLoading extends FavState {}

final class FavSuccess extends FavState {}

final class FavError extends FavState {
  final String errorMessage;
  FavError({required this.errorMessage});
}

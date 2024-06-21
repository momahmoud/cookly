part of 'restaurant_cubit.dart';

@freezed
class RestaurantState with _$RestaurantState {
  const factory RestaurantState.initial() = _Initial;
  const factory RestaurantState.loading() = Loading;
  const factory RestaurantState.loaded({
    required RestaurantModel restaurants,
  }) = Loaded;

  const factory RestaurantState.error(String error) = Error;
  const factory RestaurantState.changeTab(int index) = ChangeTab;
}

import 'package:get_it/get_it.dart';
import 'package:kgk_diamonds_group_app/application/cart/cart_cubit.dart';
import 'package:kgk_diamonds_group_app/application/filter/filter_cubit.dart';
import 'package:kgk_diamonds_group_app/application/result/result_cubit.dart';
import 'package:kgk_diamonds_group_app/core/storage/local_storage.dart';
import 'package:kgk_diamonds_group_app/data/repositories/diamond_repository.dart';
import 'package:kgk_diamonds_group_app/domain/repositories/diamond_repository_interface.dart';
import 'package:kgk_diamonds_group_app/domain/usecases/cart/add_to_cart_usecase.dart';
import 'package:kgk_diamonds_group_app/domain/usecases/cart/clear_cart_usecase.dart';
import 'package:kgk_diamonds_group_app/domain/usecases/cart/get_cart_usecase.dart';
import 'package:kgk_diamonds_group_app/domain/usecases/cart/remove_from_cart_usecase.dart';
import 'package:kgk_diamonds_group_app/domain/usecases/filter/apply_filter_usecase.dart';

final GetIt sl = GetIt.instance; // Service Locator

Future<void> setupDependencies() async {
  // Initialize local storage (SQLite)
  final localStorage = LocalStorage();
  sl.registerLazySingleton<LocalStorage>(() => localStorage);

  // Register Repository
  final diamondRepository = DiamondRepository();
  await diamondRepository.getFilteredDiamonds(); // Preload diamonds from Excel
  sl.registerLazySingleton<DiamondRepositoryInterface>(() => diamondRepository);

  // Register Use Cases
  sl.registerLazySingleton(() => GetCartUsecase(sl()));
  sl.registerLazySingleton(() => AddToCartUseCase(sl()));
  sl.registerLazySingleton(() => RemoveFromCartUsecase(sl()));
  sl.registerLazySingleton(() => ClearCartUsecase(sl()));
  sl.registerLazySingleton(() => ApplyFilterUseCase(sl<DiamondRepositoryInterface>()));

  // Register BLoCs / Cubits
  sl.registerFactory(() => FilterCubit());
  sl.registerFactory(() => ResultCubit(
        diamondRepository: sl<DiamondRepositoryInterface>(),
        applyFilterUseCase: sl(),
        filterCubit: sl<FilterCubit>(), // Pass FilterCubit as dependency
      ));
  sl.registerFactory(() => CartCubit(
        getCartItemsUseCase: sl(),
        addToCartUseCase: sl(),
        removeFromCartUseCase: sl(),
        clearCartUseCase: sl(),
      ));
}

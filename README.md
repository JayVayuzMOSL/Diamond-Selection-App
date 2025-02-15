# Diamond Selection App

A new Flutter project.

# Project Structure

This project follows a **clean architecture** approach, organizing the codebase into the following layers:

```
/lib
 ├── application/  # Business logic using Cubit/BLoC
 │   ├── cart/     # Handles cart-related state management
 │   ├── result/   # Manages result-related state
 │   └── ...       # Additional state managers
 │
 ├── core/         # Contains shared utilities and constants
 │   ├── constants/
 │   ├── themes/
 │   ├── enums.dart
 │   └── ...
 │
 ├── data/         # Handles data sources (API calls, local storage, etc.)
 │   ├── models/   # Data models (with Freezed for code generation)
 │   ├── repository/
 │   └── ...
 │
 ├── presentation/ # UI layer containing widgets and pages
 │   ├── pages/
 │   ├── widgets/
 │   └── ...
 │
 ├── main.dart     # Entry point of the application
```

## State Management Logic

This project uses **Cubit & BLoC** for managing application state efficiently. We leverage **HydratedBloc** to persist states across app restarts. Key points:

- **BlocProvider & BlocConsumer** for managing state within widgets.
- **HydratedBloc** automatically saves and restores states.
- **Freezed** for generating immutable classes and unions.

Example usage of `HydratedBloc`:
```dart
class CartCubit extends HydratedCubit<CartState> {
  CartCubit() : super(CartInitial());

  @override
  CartState? fromJson(Map<String, dynamic> json) {
    return CartState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(CartState state) {
    return state.toJson();
  }
}
```

## Persistent Storage Usage

For local data persistence, we use **GetStorage** for lightweight and efficient storage management.

Example usage of **GetStorage**:
```dart
final box = GetStorage();

void saveUserData(User user) {
  box.write('user', user.toJson());
}

User? getUserData() {
  final data = box.read('user');
  return data != null ? User.fromJson(data) : null;
}
```

## Responsive Layout

We use **Flutter ScreenUtil** for responsive UI scaling across different devices.

Example usage:
```dart
SizedBox(height: 20.h);
Text('Hello', style: TextStyle(fontSize: 16.sp));
```

This ensures elements scale dynamically based on screen size.

---

For any questions or contributions, feel free to raise an issue or submit a PR! 🚀


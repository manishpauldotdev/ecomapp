import 'package:ecomapp/features/home/shared/provider.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  late ProviderContainer container;

  setUp(() {
    container = ProviderContainer();
  });

  tearDown(() {
    container.dispose();
  });

  test('getAllProducts should update state with products', () async {
    // Get the instance of HomeNotifier
    final homeNotifier = container.read(homeNotifierProvider.notifier);

    // Ensure initial state is empty
    expect(container.read(homeNotifierProvider).products, isEmpty);
    expect(container.read(homeNotifierProvider).isLoading, isFalse);

    // Call the method
    homeNotifier.getAllProducts();

    // Verify that the state was updated correctly
    final updatedState = container.read(homeNotifierProvider);

    expect(updatedState.products, isNotEmpty);
    expect(updatedState.products?.length, greaterThan(0));
    expect(updatedState.isLoading, isFalse);
  });
}

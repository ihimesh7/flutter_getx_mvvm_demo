// cat_view_model_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:getx_mvvm_demo/APIService/cat_api_service.dart';
import 'package:getx_mvvm_demo/ViewModel/cat_viewmodel.dart';
import 'package:mockito/mockito.dart';
import 'package:getx_mvvm_demo/Model/cat.dart';

class MockCatApiService extends Mock implements CatApiService {}

void main() {
  late CatViewModel viewModel;
  late MockCatApiService mockApiService;

  setUp(() {
    mockApiService = MockCatApiService();
    viewModel = CatViewModel();
    viewModel.apiService = mockApiService;
  });

  group('fetchRandomCat', () {
    test('should set isLoading to true when fetching cat', () async {
      // Arrange
      when(mockApiService.getRandomCat()).thenAnswer((_) async => Cat(url: 'test'));

      // Act
      viewModel.fetchRandomCat();

      // Assert
      expect(viewModel.isLoading, true);
    });

    test('should set isLoading to false when fetching cat is done', () async {
      // Arrange
      when(mockApiService.getRandomCat()).thenAnswer((_) async => Cat(url: 'test'));

      // Act
      await viewModel.fetchRandomCat();

      // Assert
      expect(viewModel.isLoading, false);
    });

    test('should set hasError to true when fetching cat fails', () async {
      // Arrange
      when(mockApiService.getRandomCat()).thenThrow(Exception('Test exception'));

      // Act
      await viewModel.fetchRandomCat();

      // Assert
      expect(viewModel.hasError, true);
    });

    test('should set cat to the fetched cat', () async {
      // Arrange
      final cat = Cat(url: 'test');
      when(mockApiService.getRandomCat()).thenAnswer((_) async => cat);

      // Act
      await viewModel.fetchRandomCat();

      // Assert
      expect(viewModel.cat, cat);
    });
  });
}
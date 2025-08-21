import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:flutter_test_task/app/modules/home/views/home_view.dart';
import 'package:flutter_test_task/app/modules/home/controllers/home_controller.dart';

void main() {
  group('Todo App Tests', () {
    testWidgets('App should load with title', (WidgetTester tester) async {
      // Arrange
      Get.put(HomeController());
      
      // Act
      await tester.pumpWidget(
        GetMaterialApp(
          home: const HomeView(),
        ),
      );
      
      // Wait for the widget to build
      await tester.pump();
      
      // Assert
      expect(find.text('To-Do List'), findsOneWidget);
    });

    testWidgets('Should have floating action button', (WidgetTester tester) async {
      // Arrange
      Get.put(HomeController());
      
      // Act
      await tester.pumpWidget(
        GetMaterialApp(
          home: const HomeView(),
        ),
      );
      
      // Wait for the widget to build
      await tester.pump();
      
      // Assert
      expect(find.byType(FloatingActionButton), findsOneWidget);
    });
  });
}

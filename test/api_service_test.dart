import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_test_task/app/data/services/api_service.dart';
import 'package:flutter_test_task/app/data/models/todo.dart';

void main() {
  group('ApiService Tests', () {
    late ApiService apiService;

    setUp(() {
      apiService = ApiService();
    });

    test('fetchTodos should return a list of todos', () async {
      // Act
      final todos = await apiService.fetchTodos();
      
      // Assert
      expect(todos, isA<List<Todo>>());
      expect(todos.isNotEmpty, isTrue);
      
      // Check first todo structure
      final firstTodo = todos.first;
      expect(firstTodo.id, isA<int>());
      expect(firstTodo.userId, isA<int>());
      expect(firstTodo.title, isA<String>());
      expect(firstTodo.completed, isA<bool>());
    });

    test('Todo model should have correct structure', () {
      // Arrange
      const todoData = {
        'userId': 1,
        'id': 1,
        'title': 'Test todo',
        'completed': false,
      };
      
      // Act
      final todo = Todo.fromJson(todoData);
      
      // Assert
      expect(todo.userId, equals(1));
      expect(todo.id, equals(1));
      expect(todo.title, equals('Test todo'));
      expect(todo.completed, equals(false));
    });

    test('Todo copyWith should work correctly', () {
      // Arrange
      final originalTodo = Todo(
        userId: 1,
        id: 1,
        title: 'Original title',
        completed: false,
      );
      
      // Act
      final updatedTodo = originalTodo.copyWith(
        title: 'Updated title',
        completed: true,
      );
      
      // Assert
      expect(updatedTodo.userId, equals(1));
      expect(updatedTodo.id, equals(1));
      expect(updatedTodo.title, equals('Updated title'));
      expect(updatedTodo.completed, equals(true));
    });
  });
} 
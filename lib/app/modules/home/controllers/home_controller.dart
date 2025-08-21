import 'package:get/get.dart';
import '../../../models/todo.dart';
import '../../../services/api_service.dart';

class HomeController extends GetxController {
  final ApiService _apiService = ApiService();
  
  // Observable variables
  final RxList<Todo> todos = <Todo>[].obs;
  final RxBool isLoading = false.obs;
  final RxBool hasError = false.obs;
  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadTodos();
  }

  Future<void> loadTodos() async {
    try {
      isLoading.value = true;
      hasError.value = false;
      errorMessage.value = '';
      
      final List<Todo> fetchedTodos = await _apiService.fetchTodos();
      todos.value = fetchedTodos;
    } catch (e) {
      hasError.value = true;
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  void toggleTodoCompletion(int id) {
    final int index = todos.indexWhere((todo) => todo.id == id);
    if (index != -1) {
      final Todo todo = todos[index];
      final Todo updatedTodo = todo.copyWith(completed: !todo.completed);
      todos[index] = updatedTodo;
    }
  }

  void refreshTodos() {
    loadTodos();
  }

  void retry() {
    loadTodos();
  }
}

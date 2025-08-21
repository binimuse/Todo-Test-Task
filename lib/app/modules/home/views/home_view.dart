import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // App Bar with Title
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: const Text(
                'To-Do List',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            
            // Main Content
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                
                if (controller.hasError.value) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.error_outline,
                          size: 64,
                          color: Colors.red,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'Error loading todos',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          controller.errorMessage.value,
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: Colors.grey[600],
                          ),
                        ),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: controller.retry,
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  );
                }
                
                if (controller.todos.isEmpty) {
                  return const Center(
                    child: Text(
                      'No todos found',
                      style: TextStyle(fontSize: 18),
                    ),
                  );
                }
                
                return ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: controller.todos.length,
                  separatorBuilder: (context, index) => const Divider(
                    height: 1,
                    color: Color(0xFFE0E0E0),
                  ),
                  itemBuilder: (context, index) {
                    final todo = controller.todos[index];
                    return ListTile(
                      contentPadding: const EdgeInsets.symmetric(vertical: 8),
                      leading: GestureDetector(
                        onTap: () => controller.toggleTodoCompletion(todo.id),
                        child: Container(
                          width: 24,
                          height: 24,
                          decoration: BoxDecoration(
                            color: todo.completed ? Colors.blue : Colors.transparent,
                            border: Border.all(
                              color: todo.completed ? Colors.blue : Colors.grey[400]!,
                              width: 2,
                            ),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: todo.completed
                              ? const Icon(
                                  Icons.check,
                                  size: 16,
                                  color: Colors.white,
                                )
                              : null,
                        ),
                      ),
                      title: Text(
                        todo.title,
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                          decoration: todo.completed 
                              ? TextDecoration.lineThrough 
                              : null,
                          decorationColor: Colors.grey[600],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: Obx(() {
        if (controller.isLoading.value) {
          return const SizedBox.shrink();
        }
        
        return FloatingActionButton(
          onPressed: controller.refreshTodos,
          backgroundColor: Colors.lightBlue,
          child: const Icon(
            Icons.refresh,
            color: Colors.white,
          ),
        );
      }),
    );
  }
}

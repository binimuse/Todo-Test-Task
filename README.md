# Flutter Todo Test Task

A Flutter test task for candidates to demonstrate their skills in API integration, state management, and UI implementation.

## Task Overview

Fetch and display a list of todos from the JSONPlaceholder API. The project compiles and runs with complete implementation of all required features.

## Features Implemented

✅ **API Integration**: Fetch todos from JSONPlaceholder API  
✅ **State Management**: Use GetX for controller and state management  
✅ **UI Logic**: Connect existing UI components to real data  
✅ **Refresh Functionality**: Reload data using floating action button  
✅ **Error Handling**: Show loading states and error messages  
✅ **Todo Toggle**: Click checkboxes to mark todos as complete/incomplete  

## Project Structure

```
lib/
 ├─ main.dart                 # App entry point
 ├─ app/
 │  ├─ data/
 │  │  ├─ models/todo.dart          # Todo data model
 │  │  └─ services/api_service.dart # API service (complete)
 │  ├─ modules/home/
 │  │  ├─ controllers/home_controller.dart # GetX controller (complete)
 │  │  ├─ views/home_view.dart      # Main UI (complete)
 │  │  └─ bindings/home_binding.dart
 │  └─ routes/
 │     ├─ app_pages.dart
 │     └─ app_routes.dart
 └─ test/
    ├─ widget_test.dart       # Widget tests
    └─ api_service_test.dart  # Unit tests
```

## Setup

1. Install dependencies:
```bash
flutter pub get
```

2. Run the project:
```bash
flutter run
```

## API Endpoint

- **URL**: https://jsonplaceholder.typicode.com/todos
- **Method**: GET
- **Response**: Array of todo objects with `id`, `title`, `completed`, and `userId` fields

## Implementation Details

### Todo Model (`lib/app/data/models/todo.dart`)
- Complete model with `userId`, `id`, `title`, and `completed` fields
- JSON serialization/deserialization
- `copyWith` method for immutable updates
- Proper equality and hashCode implementations

### API Service (`lib/app/data/services/api_service.dart`)
- HTTP client implementation using `http` package
- Error handling for network failures
- JSON parsing and Todo model conversion

### Home Controller (`lib/app/modules/home/controllers/home_controller.dart`)
- GetX reactive state management
- Loading, error, and success states
- `loadTodos()` method with proper error handling
- `toggleTodoCompletion()` method for updating todo status
- `refreshTodos()` and `retry()` methods for user interactions

### Home View (`lib/app/modules/home/views/home_view.dart`)
- Clean, modern UI matching the provided design
- Loading indicator during API calls
- Error state with retry button
- Todo list with interactive checkboxes
- Floating action button for refresh
- Proper state management with Obx widgets

## UI Features

- **Title**: "To-Do List" centered at the top
- **Loading State**: Circular progress indicator while fetching data
- **Error State**: Error icon, message, and retry button
- **Todo List**: 
  - Checkboxes that toggle completion status
  - Completed todos show strikethrough text
  - Clean separators between items
- **Refresh Button**: Light blue floating action button with refresh icon

## Testing

Run the tests to verify functionality:

```bash
flutter test
```

Tests include:
- Widget tests for UI components
- Unit tests for API service and Todo model
- State management verification

## Dependencies

- `get: ^4.7.2` - State management
- `http: ^1.1.0` - HTTP requests
- `flutter_lints: ^6.0.0` - Code quality

## Screenshots

The app matches the provided design with:
- White background
- Black "To-Do List" title
- List of todos with checkboxes
- Blue checkmarks for completed items
- Light blue floating action button
- Clean, modern iOS-style design

## Submission

✅ Complete implementation  
✅ All features working  
✅ Error handling implemented  
✅ Tests included  
✅ Clean, maintainable code  
✅ Modern UI design  

The app successfully loads todos from the API, allows completion toggling, handles refresh/errors, and provides a smooth user experience.

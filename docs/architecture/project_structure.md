# Project Structure & Architecture Documentation

## 1. Overview
This project follows a **Feature-First** structure combined with **Clean Architecture**. This means the codebase is organized primarily by features (e.g., `authentication`, `product_details`), and within each feature, it is divided into three layers: **Domain**, **Data**, and **Presentation**.

**Key Principles:**
- **Separation of Concerns:** Each layer has a distinct responsibility.
- **Dependency Rule:** Domain layer depends on nothing. Presentation and Data layers depend on Domain.
- **Feature Encapsulation:** All code related to a feature stays within that feature's folder.

## 2. High-Level Folder Structure
```text
lib/
├── core/                       # Shared components used across multiple features
│   ├── config/                 # Global configuration (Router, Theme, etc.)
│   ├── error/                  # Failure classes and exception handling
│   ├── network/                # Network client (Dio) and interceptors
│   ├── usecases/               # Base UseCase interface
│   └── utils/                  # Utility classes, extensions, and constants
├── features/                   # Feature-specific code (The core of the app)
│   └── [feature_name]/         # Example: authentication
│       ├── data/               # Repository implementations and Data Sources
│       ├── domain/             # Entities, UseCases, and Repository Interfaces
│       └── presentation/       # UI (Pages, Widgets) and State Management (Bloc)
├── main.dart                   # Application entry point
└── injection_container.dart    # Dependency Injection setup (GetIt)
```

## 3. Core Layer (`lib/core`)
The `core` directory contains code that is shared across the entire application. It should **not** contain any feature-specific logic.

- **`config/`**:
  - `router.dart`: Centralized routing configuration using `GoRouter`. All top-level routes and redirects are defined here.
  - `theme/`: App-wide theme definitions.
- **`network/`**:
  - `dio_client.dart`: A centralized `Dio` instance configured with base URLs, timeouts, and default headers.
  - `auth_interceptor.dart`: Intercepts requests to inject tokens and handles 401 Unauthorized errors (e.g., token refresh).
  - `api_endpoints.dart`: Constants for API paths.
- **`error/`**:
  - Defines `Failure` classes (internal/logic errors) and `Exception` classes (external/system errors).
- **`utils/`**:
  - Helper functions, extension methods (e.g., strictly typed context extensions), and simple constants.

## 4. Feature Structure (`lib/features/[name]`)
Every feature **MUST** follow this strict internal structure.

### **A. Domain Layer (`domain/`)**
*The "Business Logic" - Pure Dart, no Flutter dependencies.*
- **`entities/`**: Plain Dart objects (PODOs) that represent the data used by the business logic. Must extend `Equatable`.
- **`repositories/`**: Abstract interfaces defining *what* operations can be performed, but not *how*.
- **`usecases/`**: Classes acting as executable actions (e.g., `LoginUser`, `GetProduct`). Each UseCase has a `call()` method.

### **B. Data Layer (`data/`)**
*The "Interface Adapter" - Handles data retrieval and serialization.*
- **`models/`**: DTOs (Data Transfer Objects) that extend Domain Entities. They handle JSON serialization (`fromJson`/`toJson`) and transformation.
- **`datasources/`**:
  - `RemoteDataSource`: Interact with external APIs (API calls via `Dio`).
  - `LocalDataSource`: Interact with local storage (SharedPrefs, Hive, database).
- **`repositories/`**: Implementations of the Domain Repositories. They coordinate data sources and handle exception mapping (calling data sources and returning `Either<Failure, T>`).

### **C. Presentation Layer (`presentation/`)**
*The "UI" - Flutter Widgets and State Management.*
- **`bloc/`**: Contains `Bloc` or `Cubit` classes for state management. Blocs delegate logic to UseCases and emit States.
- **`pages/`**: Top-level screens mapped to routes in `GoRouter`. They inject the Bloc and scaffold the page.
- **`widgets/`**: Reusable UI components specific to *this feature only*.

## 5. Key Files
- **`lib/main.dart`**: Initializes Flutter, Dependency Injection, and runs the `MaterialApp` with the configured `router`.
- **`lib/injection_container.dart`**: Service Locator generic setup. Dependencies for every new feature must be registered here.

## 6. Documentation Conventions
- **`docs/logic/`**: Any complex business logic (e.g., payment flows, complex validations) involving >3 branches MUST be documented here in a `.txt` file before implementation.
- **`docs/architecture/`**: High-level architectural decisions and guides (like this file).

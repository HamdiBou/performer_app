# AI Assistant API Test Suite

This directory contains comprehensive test cases for the AI Assistant API in the test_login Flutter application.

## Test Files Overview

### 1. `groq_assistant_data_source_test.dart`
Unit tests for the `GroqAssistantDataSource` class that handles direct API communication with the Groq API.

**Tests covered:**
- ✅ Successful API response handling
- ✅ Non-200 HTTP status code error handling
- ✅ Custom model parameter usage
- ✅ Proper request headers validation
- ✅ Message body validation
- ✅ Empty message list handling
- ✅ Network error handling (connection timeout, etc.)
- ✅ Correct parsing of nested API responses

### 2. `ai_assistant_repository_impl_test.dart`
Unit tests for the `AiAssistantRepositoryImpl` class that implements the repository pattern.

**Tests covered:**
- ✅ Successful message response with Either pattern
- ✅ Message history inclusion in API requests
- ✅ Conference context injection into system prompt
- ✅ Exception handling and Failure return
- ✅ Empty message history handling
- ✅ Message role preservation in history
- ✅ Timestamp generation validation
- ✅ Nested API response content extraction
- ✅ Null conference graceful handling

### 3. `ai_assistant_integration_test.dart`
Integration tests that verify the complete conversation flow and edge cases.

**Test groups:**
- **Message conversation flow:** Multi-turn conversations, context preservation
- **Error handling scenarios:** API failures, timeouts, invalid responses
- **Message content validation:** Long messages, special characters, emoji, multi-language
- **Response characteristics:** Role validation, content validation, timestamp validation
- **Concurrent message handling:** Multiple simultaneous API calls

## Running the Tests

### Run all AI Assistant tests:
```bash
flutter test test/features/ai_assistant/
```

### Run specific test file:
```bash
# Test data source
flutter test test/features/ai_assistant/data/datasources/groq_assistant_data_source_test.dart

# Test repository
flutter test test/features/ai_assistant/data/repositories/ai_assistant_repository_impl_test.dart

# Test integration
flutter test test/features/ai_assistant/integration/ai_assistant_integration_test.dart
```

### Run tests with verbose output:
```bash
flutter test test/features/ai_assistant/ -v
```

### Run tests with coverage:
```bash
flutter test test/features/ai_assistant/ --coverage
```

## Test Architecture

The tests follow the **Clean Architecture** pattern used in this project:

```
AI Assistant Feature
├── Domain Layer (Entities & Repositories)
│   ├── AssistantMessage (Entity)
│   ├── AiAssistantRepository (Abstract)
│   └── AiAssistantFailure (Failure type)
├── Data Layer (Implementation)
│   ├── GroqAssistantDataSource (API Client)
│   ├── AiAssistantRepositoryImpl (Repository Implementation)
│   └── Tests for both components
└── Presentation Layer (UI - not tested here)
```

## Mock Objects Used

The test suite uses **Mockito** for mocking dependencies:

- **MockDio:** Mocks HTTP client for API calls
- **MockGroqAssistantDataSource:** Mocks the data source layer
- **MockConferenceRepository:** Mocks conference context retrieval

## Key Testing Patterns

### 1. **Either Pattern (Dartz)**
Tests verify correct usage of the `Either` type for handling success and failure:
```dart
result.fold(
  (failure) => // Handle failure
  (success) => // Handle success
);
```

### 2. **Mock Verification**
Tests verify that mocks are called with expected parameters:
```dart
verify(mockDataSource.postChatCompletion(
  messages: captureAnyNamed('messages')
)).called(1);
```

### 3. **Message History Management**
Tests ensure conversation context is properly maintained across multiple turns.

### 4. **Configuration Testing**
Tests verify system prompt includes conference information when available.

## Dependencies

Add to `pubspec.yaml` dev_dependencies:
```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
  mockito: ^5.4.0
  build_runner: any
```

Generate mocks after adding new dependencies:
```bash
flutter pub run build_runner build
```

## Test Coverage Goals

| Component | Target Coverage | Status |
|-----------|-----------------|--------|
| GroqAssistantDataSource | 95%+ | ✅ |
| AiAssistantRepositoryImpl | 95%+ | ✅ |
| AssistantMessage (Entity) | N/A (Freezed) | ✅ |
| Error Handling | 100% | ✅ |

## Common Test Scenarios

### Scenario 1: User asks first question
```
Message 1: "What sessions are available?"
Expected: AssistantMessage with session information
```

### Scenario 2: Follow-up question
```
Message 1: "Tell me about React"
Message 2: "What are hooks?" (with history)
Expected: Context-aware response about React hooks
```

### Scenario 3: API Error
```
API returns 401 Unauthorized
Expected: Left(AiAssistantFailure(...))
```

### Scenario 4: Network Timeout
```
Network request times out
Expected: Left(AiAssistantFailure(...))
```

## Debugging Tips

### Enable detailed test output:
```bash
flutter test test/features/ai_assistant/ -v --verbosity=verbose
```

### Run single test:
```bash
flutter test test/features/ai_assistant/data/datasources/groq_assistant_data_source_test.dart -t "should return response data on successful API call"
```

### Check for unverified mocks:
Mockito will report any mocks that were created but not verified.

## Future Test Enhancements

- [ ] Add performance tests for message processing
- [ ] Add stress tests with large message histories
- [ ] Add widget tests for UI integration
- [ ] Add e2e tests with real API (staging environment)
- [ ] Add benchmark tests for response time

## Related Files

- Main implementation: `lib/features/ai_assistant/`
- Entity definition: `lib/features/ai_assistant/domain/entities/assistant_message.dart`
- Repository interface: `lib/features/ai_assistant/domain/repositories/ai_assistant_repository.dart`
- Data source: `lib/features/ai_assistant/data/datasources/groq_assistant_data_source.dart`
- Repository impl: `lib/features/ai_assistant/data/repositories/ai_assistant_repository_impl.dart`

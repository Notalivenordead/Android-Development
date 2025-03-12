# Android-Development 📱  
**Repository for learning Java, Kotlin, and Dart with code examples and projects.**  

[![Languages](https://img.shields.io/badge/_LANGUAGES-Java_|_Kotlin_|_Dart-blueviolet?style=for-the-badge&logo=openjdk)](https://github.com/NotAliveNorDead/Android-Development)  
[![License](https://img.shields.io/badge/_LICENSE-Apache_2.0-green?style=for-the-badge&logo=apache)](LICENSE)

## 🗂️ Project Structure
```plaintext
Android-Development/
├── .vscode/              # 🔧 IDE Configurations
│   └── settings.json
├── Basics/               # 🧩 Fundamental Examples
│   ├── basics_dart.dart
│   ├── OOP_kotlin.jar
│   ├── OOP_kotlin.kt
│   └── src/
│       ├── basics_java.class
│       └── basics_java.java
├── Dart_tasks/           # 🎯 Practical Dart Tasks
│   ├── lib/
│   │   ├── block1/      # 📁 File Operations
│   │   │   ├── decorators.dart
│   │   │   ├── io_operations.dart
│   │   │   ├── nio_operations.dart
│   │   │   └── performance_benchmark.dart
│   │   ├── block2/      # 🕒 Date/Time Utilities
│   │   │   └── datetime_utils.dart
│   │   └── block3/      # 🧬 Design Patterns
│   │       ├── enums.dart
│   │       └── singleton.dart
│   ├── pubspec.yaml
│   └── pubspec.lock
├── Caesar/
│   ├── .dart_tool      # Description of project
│   │   └── package_config.json
│   ├── bin/
│   │   └── main.dart
│   ├── example/      # Input/output txt-s
│   │   ├── BF_results.txt
│   │   ├── decrypted.txt
│   │   ├── input.txt
│   │   ├── output.txt
│   │   └── statistical_decrypted.txt
│   ├── lib/
│   │   ├── core/ #must-have files
│   │   │   ├── brute_force.dart      # All variants
│   │   │   ├── caesar_cipher.dart      # Encryption
│   │   │   ├── statistical_analysis.dart      # Analytical decryption
│   │   │   ├── validator.dart      # Checking input
│   │   ├── utils/ #additional
|   |      └── file_handler.dart      # Work with files
│   ├── pubspec.yaml
│   └── pubspec.lock
├── MultiThreading/
│   ├── tasks/
│   │   ├── T1
│   │   ├── T2
│   │   ├── T3
│   │   ├── T4
│   │   ├── T5
│   │   ├── T6
│   │   ├── T7
│   │   ├── T8
│   │   ├── T9
│   │   ├── T10
│   │   ├── T11
│   │   └── T12
│   └── main.dart
├── IslandSimulation/
|  ├── pubspec.lock
|  ├── pubspec.yaml
|  ├── dart_tool/
|  |   └── package_configuration.json
|  ├── bin/
|  |   └── main.dart
|  ├── example/
|  │   └── simulation_output.txt
|  ├── utils/
|  │   ├── config.dart
|  │   ├── random_utils.dart
|  │   └── threading_utils.dart
|  └── core/
|   |  ├── animal.dart
|   |  ├── carnivore.dart
|   |  ├── herbivore.dart
|   |  ├── island.dart
|   |  ├── plant.dart
|   |  ├── simulation.dart
|   |  └── statistics.dart
├── LICENSE
└── README.md
```

## 🛠️ Technologies
- ☕ Java (JDK 21)
- 🅚 Kotlin (2.1.0)
- 🎯 Dart (3.6.1)

---
## 🚀 Getting Started
### Basics Examples
| Language | Commands |
|----------|----------|
| ☕ Java | `cd Basics && javac src/basics_java.java && java src/basics_java` |
| 🅚 Kotlin | `cd Basics && kotlinc OOP_kotlin.kt -d OOP_kotlin.jar && java -jar OOP_kotlin.jar` |
| 🎯 Dart | `cd Basics && dart basics_dart.dart` |

---
## 🎯 Dart Tasks
```bash
cd Dart_tasks
dart pub get
dart run lib/main.dart
```

### 📌 Task Structure

#### 📁 Block 1: File Operations
| File                | Description       | Features           |
|---------------------|-------------------|--------------------|
| `decorators.dart`   | Text processing   | 🎭 Decorators      |
| `io_operations.dart`| File I/O          | 🌊 Streams         |
| `nio_operations.dart`| File copying     | ⚡ NIO Pipeline    |

#### 🕒 Block 2: Date/Time Utilities
| Function                  | Description                |
|---------------------------|----------------------------|
| `formatCurrentDateTime()` | 📅 Date formatting         |
| `convertTimeZone()`       | 🌍 Timezone conversion     |

#### 🧬 Block 3: Design Patterns
| Component          | Description        |
|--------------------|--------------------|
| `singleton.dart`   | 🏰 Singleton pattern |
| `enums.dart`       | 🎚️ Enums implementation |

---
## Caesar
```bash
cd Caesar
dart run bin/main.dart
```

### 📌 Task Structure

#### 📁 All en-dec files (lib/core, lib/utilits)
| File                | Description       | Features           |
|---------------------|-------------------|--------------------|
| `brute_force.dart`   | See all shifted texts    | Async generation    |
| `caesar_cipher.dart`| enc-dec transforms    | 1 string func and double using to enc-dec    |
| `statistical_analysis.dart`| dec by statistics     |   using map    |
| `validator.dart`| validation     |   key & path cheking in class methods    |
| `file_handler.dart`| read/write Files     |   async methods    |

---
## 🔧 VSCode Extensions

- **Java**:  
  [🔴 Red Hat Java Support](https://marketplace.visualstudio.com/items?itemName=redhat.java) •  
  [📦 Extension Pack](https://marketplace.visualstudio.com/items?itemName=vscjava.vscode-java-pack) •  
  [▶️ Code Runner](https://marketplace.visualstudio.com/items?itemName=formulahendry.code-runner) •

- **Kotlin**:  
  [🟣 Kotlin Plugin](https://marketplace.visualstudio.com/items?itemName=fwcd.kotlin) •

- **Dart**:  
  [🎯 Dart Language](https://marketplace.visualstudio.com/items?itemName=Dart-Code.dart-code) •  
  [🦋 Flutter Toolkit](https://marketplace.visualstudio.com/items?itemName=Dart-Code.flutter) •

## ⚖️ License
**Apache-2.0 - See [LICENSE](LICENSE)**

## 💻 Author
**🔗 Notalivenordead**  
[![GitHub Profile](https://img.shields.io/badge/_GitHub-NotAliveNorDead-2088FF?style=for-the-badge&logo=github)](https://github.com/NotAliveNorDead)  
NotAHuman • BDA • Busin Dmitriy

## 🔗 Resources
- [📚 Java Docs](https://docs.oracle.com/javase/8/docs/api/) •
- [📘 Kotlin Docs](https://kotlinlang.org/docs/home.html) •
- [📖 Dart Guides](https://dart.dev/guides) •

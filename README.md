# ChargebackUI iOS test task

A modern iOS application built with SwiftUI.


## ✨ Features

- **Service Selection**: Choose from popular subscription services (Netflix, Hulu, Spotify, PlayStation+, Paramount+, YouTube Music)
- **Search Functionality**: Quickly find services with real-time search
- **Subscription Categories**: Organize subscriptions by type (Subscription, Utility, Card Payment, Loan, Rent)
- **Flexible Frequency**: Set recurring payment schedules (Weekly, Monthly, Annually)
- **Active Status Toggle**: Enable/disable subscriptions as needed
- **Custom Date Picker**: Select subscription start dates
- **Modern UI**: Clean design with custom colors and shadows

## 🏗️ Architecture

The project follows a clean MVVM-inspired architecture with the following structure:

```
ChargebackUI/
├── ChargebackUIApp.swift          # App entry point
├── Screens/                       # Main view screens
│   ├── AppMainView.swift          # Home screen with navigation
│   └── CreateSubscriptionView.swift # Subscription creation form
├── Components/                    # Reusable UI components
│   ├── ServicePickerView.swift    # Service selection with search
│   ├── CategoryPickerView.swift   # Category selection picker
│   ├── FrequencyPickerView.swift  # Payment frequency picker
│   ├── DatePickerView.swift       # Custom date picker
│   ├── FormRow.swift              # Generic form row component
│   ├── FormDateRow.swift          # Date selection form row
│   └── FormToggleRow.swift        # Toggle switch form row
├── Models/                        # Data models
│   ├── SubscriptionService.swift  # Service model (name, price, icon)
│   └── SubscriptionCategory.swift # Category enum with icons
├── Utils/                         # Utilities and helpers
│   ├── AppConstants.swift         # Colors and string constants
│   ├── Enum/
│   │   └── Frequency.swift        # Payment frequency enum
│   └── Extension/
│       └── Color.swift            # Color hex initializer extension
└── Assets.xcassets/              # Image assets and icons
```

## 🛠️ Technical Stack

- **Language**: Swift
- **UI Framework**: SwiftUI
- **iOS Version**: iOS 16.0+ 
- **Xcode Version**: Xcode 16.0+
- **Design Pattern**: MVVM-inspired architecture
- **State Management**: @State, @Binding, @Environment


## 🚀 Getting Started

### Installation

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd iOS_test_task
   ```

2. Open the project in Xcode:
   ```bash
   open ChargebackUI.xcodeproj
   ```

3. Select a simulator or connected device

4. Build and run the project (⌘R)

### Project Setup

No additional dependencies or package managers are required. The project uses only native iOS frameworks.

### Code Style
- Follow Swift naming conventions
- Use SwiftUI view builders
- Keep views small and composable
- Extract magic numbers to constants
- Document complex logic


**Built with ❤️ using SwiftUI**

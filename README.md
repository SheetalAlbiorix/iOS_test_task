# ChargebackUI

A modern iOS application built with SwiftUI for managing subscription services and recurring payments.

## 📱 Overview

ChargebackUI is a subscription management app that allows users to create, track, and manage their recurring subscriptions. The app features a clean, intuitive interface with custom form components and service selection capabilities.

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
- **iOS Version**: iOS 15.0+
- **Xcode Version**: Xcode 13.0+
- **Design Pattern**: MVVM-inspired architecture
- **State Management**: @State, @Binding, @Environment

## 📋 Requirements

- iOS 15.0 or later
- Xcode 13.0 or later
- macOS 11.0 or later (for development)

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

## 💻 Key Components

### Models

#### SubscriptionService
```swift
struct SubscriptionService: Identifiable, Equatable {
    let id: UUID
    let name: String
    let price: Double
    let icon: String
}
```

#### SubscriptionCategory
```swift
enum SubscriptionCategory: String, CaseIterable {
    case subscription, utility, cardPayment, loan, rent
}
```

#### Frequency
```swift
enum Frequency: String, CaseIterable {
    case weekly, monthly, annually
}
```

### Custom Components

- **FormRow**: Reusable form field component with label and value
- **FormDateRow**: Specialized row for date selection
- **FormToggleRow**: Toggle switch with label
- **ServicePickerView**: Full-screen service selection with search
- **CategoryPickerView**: Bottom sheet for category selection
- **FrequencyPickerView**: Bottom sheet for frequency selection

### Design System

The app uses a consistent design system defined in `AppConstants.swift`:

**Colors**:
- Primary: `#002FFF` (Active Blue)
- Background: `#F4F5F7`
- Text: `#212121`
- Inactive: `#98A2B3`
- Divider: `#E3E6EB`

**Typography**:
- Titles: System font, semibold, 17-18pt
- Body: System font, regular, 15-16pt
- Labels: System font, regular, 15pt

## 🎨 UI Features

### Main Screen
- Welcome message
- Navigation button to create subscription

### Create Subscription Screen
- Service selection card with icon and price display
- Form fields for:
  - Service name
  - Amount
  - Category (with SF Symbol icons)
  - Start date
  - Payment frequency
  - Active/inactive toggle
- Custom navigation bar with close and save buttons
- Bottom sheets for pickers
- Real-time validation (Save button disabled until service is selected)

### Service Picker
- Searchable list of services
- Service icons and names
- Selected state indicator
- Case-insensitive search filtering

## 🔧 Customization

### Adding New Services

Edit `ServicePickerView.swift` and add to the services array:

```swift
SubscriptionService(name: "Service Name", price: 9.99, icon: "IconName")
```

### Adding New Categories

Edit `SubscriptionCategory.swift`:

```swift
case newCategory = "New Category"

var icon: String {
    case .newCategory: return "sf.symbol.name"
}
```

### Modifying Colors

Edit `AppConstants.swift` to change the color scheme:

```swift
static let newColor = Color(hex: "#HEXCODE")
```

## 📝 Code Highlights

### Hex Color Support
The app includes a custom `Color` extension that supports hex color initialization:

```swift
Color(hex: "#002FFF")
```

### SwiftUI Best Practices
- Proper use of `@State` and `@Binding` for state management
- `@Environment(\.dismiss)` for modal dismissal
- Extracted subviews for better code organization
- Sheet presentations with custom detents
- Computed properties for filtered data

## 🧪 Testing

The project structure supports unit testing. To add tests:

1. Create a new test target in Xcode
2. Add test files for models and view models
3. Run tests with ⌘U


## 👨‍💻 Development

### Code Style
- Follow Swift naming conventions
- Use SwiftUI view builders
- Keep views small and composable
- Extract magic numbers to constants
- Document complex logic

### Git Workflow
- Create feature branches from main
- Write descriptive commit messages
- Keep commits focused and atomic


**Built with ❤️ using SwiftUI**

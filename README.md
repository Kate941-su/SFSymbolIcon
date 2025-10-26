# SFSymbolIcon

A Swift library that provides safe access to SF Symbols with availability checking and warning levels.

## Features

- **Safe SF Symbol Access**: Check symbol availability before using them
- **Warning Levels**: Choose between debug, assert, or fatal error handling
- **Environment Integration**: Easy integration with SwiftUI's environment system
- **Caching**: Optimized performance with symbol name caching
- **Cross-Platform**: Supports iOS, macOS, tvOS, watchOS, and visionOS

## Requirements

- iOS 13.0+ / macOS 10.15+ / tvOS 13.0+ / watchOS 6.0+ / visionOS 1.0+
- Swift 5.9+

## Installation

### Swift Package Manager

Add the following to your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/yourusername/SFSymbolIcon.git", from: "1.0.0")
]
```

Or add it through Xcode:

1. File → Add Package Dependencies
2. Enter the repository URL
3. Choose the version and add to your target

## Usage

### Basic Usage

```swift
import SwiftUI
import SFSymbolIcon

struct ContentView: View {
    @Environment(\.SymbolIcon) var symbolIcon

    var body: some View {
        VStack {
            // Safe usage with optional chaining
            if let icon = symbolIcon.IconSafe(systemName: "heart.fill") {
                icon
                    .font(.largeTitle)
                    .foregroundColor(.red)
            }

            // Direct usage (will crash if symbol doesn't exist)
            symbolIcon.Icon(systemName: "star.fill")
                .font(.title)
                .foregroundColor(.yellow)
        }
    }
}
```

### Environment Setup

```swift
import SwiftUI
import SFSymbolIcon

@main
struct MyApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.SymbolIcon, SFSymbolIcon(warningLevel: .debug))
        }
    }
}
```

### Warning Levels

```swift
// Debug level - prints warnings to console
let symbolIcon = SFSymbolIcon(warningLevel: .debug)

// Assert level - triggers assertion failure (default)
let symbolIcon = SFSymbolIcon(warningLevel: .assert)

// Fatal level - crashes the app
let symbolIcon = SFSymbolIcon(warningLevel: .fatal)
```

## API Reference

### SFSymbolIcon

The main class for managing SF Symbol access.

#### Methods

- `Icon(systemName: String) -> Image`: Returns an Image for the given symbol name. Crashes if the symbol doesn't exist.
- `IconSafe(systemName: String) -> Image?`: Returns an optional Image for the given symbol name. Returns nil if the symbol doesn't exist.

#### Warning Levels

- `.debug`: Prints warnings to console
- `.assert`: Triggers assertion failure (default)
- `.fatal`: Crashes the app with fatalError

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## Support

If you encounter any issues or have questions, please open an issue on GitHub.

//
//  SFSymbolIcon.swift
//  SFSymbolIcon
//
//  Created by Kaito Kitaya on 26.10.25.
//

import Foundation
import SwiftUI

public enum SFSymbolAssertLevel {
    case fatal
    case assert
    case debug
}

public class SFSymbolIcon {
    private var allSymbols: [String] = []
    private var level: SFSymbolAssertLevel
    private var cacheName: String? = nil
    
    public init(level: SFSymbolAssertLevel = .assert) {
        self.level = level
        loadAllSymbols()
    }

    // Forced Unwrap Icon
    public func Icon(systemName: String) -> Image {
        if systemName == cacheName {
            return Image(systemName: systemName)
        }
        guard allSymbols.contains(systemName) else {
            cacheName = nil
            let message = "\(systemName) is not exist or only can be used higher OS versions."
            fatalError(message)
        }
        cacheName = systemName
        return Image(systemName: systemName)
    }

    // You can do optional chaining
    public func IconSafe(systemName: String) -> Image? {
        if systemName == cacheName {
            return Image(systemName: systemName)
        }
        guard allSymbols.contains(systemName) else {
            cacheName = nil
            let message = "\(systemName) is not exist or only can be used higher OS versions."
            switch level {
            case .debug:
                print("‼️ \(message)")
                return nil
            case .assert:
                assert(false, "‼️ \(message)")
                return nil
            case .fatal:
                fatalError(message)
            }
        }
        cacheName = systemName
        return Image(systemName: systemName)
    }
    
    private func loadAllSymbols() {
        allSymbols = []
        if let sfSymbolsBundle = Bundle(identifier: "com.apple.SFSymbolsFramework"),
           let bundlePath = sfSymbolsBundle.path(forResource: "CoreGlyphs", ofType: "bundle"),
           let bundle = Bundle(path: bundlePath),
           let resourcePath = bundle.path(forResource: "name_availability", ofType: "plist"),
           let dictionary = NSDictionary(contentsOfFile: resourcePath),
           let symbols = dictionary["symbols"] as? [String: String] {
           for (symbolName, release) in symbols {
            if getisVisible(releaseData: release) {
                allSymbols.append(symbolName)
            }
           }
            print(allSymbols.count)
        } else {
            allSymbols = []
        }
    }
    
    private func getisVisible(releaseData: String) -> Bool {
        switch releaseData {
        case "2019":
            if #available(iOS 13.0, macOS 10.15, tvOS 13.0, visionOS 1.0, watchOS 6.0, *) {
                return true
            }

        case "2019.1":
            if #available(iOS 13.1, macOS 10.15, tvOS 13.0, visionOS 1.0, watchOS 6.1, *) {
                return true
            }

        case "2020":
            if #available(iOS 14.0, macOS 11.0, tvOS 14.0, visionOS 1.0, watchOS 7.0, *) {
                return true
            }

        case "2020.1":
            if #available(iOS 14.2, macOS 11.0, tvOS 14.2, visionOS 1.0, watchOS 7.1, *) {
                return true
            }

        case "2020.2":
            if #available(iOS 14.5, macOS 11.3, tvOS 14.5, visionOS 1.0, watchOS 7.4, *) {
                return true
            }

        case "2021":
            if #available(iOS 15.0, macOS 12.0, tvOS 15.0, visionOS 1.0, watchOS 8.0, *) {
                return true
            }

        case "2021.1":
            if #available(iOS 15.1, macOS 12.0, tvOS 15.1, visionOS 1.0, watchOS 8.1, *) {
                return true
            }

        case "2021.2":
            if #available(iOS 15.2, macOS 12.1, tvOS 15.2, visionOS 1.0, watchOS 8.3, *) {
                return true
            }

        case "2021.3":
            if #available(iOS 15.4, macOS 12.3, tvOS 15.4, visionOS 1.0, watchOS 8.5, *) {
                return true
            }

        case "2022":
            if #available(iOS 16.0, macOS 13.0, tvOS 16.0, visionOS 1.0, watchOS 9.0, *) {
                return true
            }

        case "2022.1":
            if #available(iOS 16.1, macOS 13.0, tvOS 16.1, visionOS 1.0, watchOS 9.1, *) {
                return true
            }

        case "2022.2":
            if #available(iOS 16.4, macOS 13.3, tvOS 16.4, visionOS 1.0, watchOS 9.4, *) {
                return true
            }

        case "2023":
            if #available(iOS 17.0, macOS 14.0, tvOS 17.0, visionOS 1.0, watchOS 10.0, *) {
                return true
            }

        case "2023.1":
            if #available(iOS 17.1, macOS 14.1, tvOS 17.1, visionOS 1.0, watchOS 10.1, *) {
                return true
            }

        case "2023.2":
            if #available(iOS 17.2, macOS 14.2, tvOS 17.2, visionOS 1.1, watchOS 10.2, *) {
                return true
            }

        case "2023.3":
            if #available(iOS 17.4, macOS 14.4, tvOS 17.4, visionOS 1.1, watchOS 10.4, *) {
                return true
            }

        case "2023.4":
            if #available(iOS 17.6, macOS 14.6, tvOS 17.6, visionOS 1.3, watchOS 10.6, *) {
                return true
            }

        case "2024":
            if #available(iOS 18.0, macOS 15.0, tvOS 18.0, visionOS 2.0, watchOS 11.0, *) {
                return true
            }

        case "2024.1":
            if #available(iOS 18.1, macOS 15.1, tvOS 18.1, visionOS 2.1, watchOS 11.1, *) {
                return true
            }

        case "2024.2":
            if #available(iOS 18.2, macOS 15.2, tvOS 18.2, visionOS 2.2, watchOS 11.2, *) {
                return true
            }

        case "2024.3":
            if #available(iOS 18.4, macOS 15.4, tvOS 18.4, visionOS 2.4, watchOS 11.4, *) {
                return true
            }

        case "2024.4":
            if #available(iOS 18.5, macOS 15.5, tvOS 18.5, visionOS 2.5, watchOS 11.5, *) {
                return true
            }
        default:
            if #available(iOS 18.5, macOS 15.5, tvOS 18.5, visionOS 2.5, watchOS 11.5, *) {
                return true
            }
        }
        return false
    }
}

//
//  Example.swift
//  SFSymbolIcon
//
//  Created by Kaito Kitaya on 26.10.25.
//
import SwiftUI

/// Example usage of SFSymbolIcon
public struct SFSymbolIconExample: View {
    @Environment(\.SymbolIcon) var symbolIcon
    
    public init() {}
    
    public var body: some View {
        VStack(spacing: 20) {
            Text("SFSymbolIcon Example")
                .font(.title)
                .fontWeight(.bold)
            
            // Safe usage with optional chaining
            if let heartIcon = symbolIcon.IconSafe(systemName: "heart.fill") {
                heartIcon
                    .font(.largeTitle)
                    .foregroundColor(.red)
            }
            
            // Direct usage (will crash if symbol doesn't exist)
            symbolIcon.Icon(systemName: "star.fill")
                .font(.title)
                .foregroundColor(.yellow)
            
            // Another safe example
            if let checkmarkIcon = symbolIcon.IconSafe(systemName: "checkmark.circle.fill") {
                checkmarkIcon
                    .font(.title2)
                    .foregroundColor(.green)
            }
        }
        .padding()
    }
}


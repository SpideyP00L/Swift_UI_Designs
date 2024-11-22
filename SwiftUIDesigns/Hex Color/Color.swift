//
//  Color.swift
//  SwiftUIDesigns
//
//  Created by Jeet Panchal on 2024-11-22.
//

import SwiftUI

// Extension to Color to allow initializing with a hex string
extension Color {
    init(hex: String) {
        // Remove any whitespaces and hash symbol from the input string
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        // Variable to store the RGB values
        var rgb: UInt64 = 0

        // Scan the hex string into the rgb variable
        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        // Extract the red, green, and blue components from the RGB value
        let red = Double((rgb & 0xFF0000) >> 16) / 255.0
        let green = Double((rgb & 0x00FF00) >> 8) / 255.0
        let blue = Double(rgb & 0x0000FF) / 255.0

        // Initialize the Color instance with the extracted RGB values
        self.init(red: red, green: green, blue: blue)
    }
}

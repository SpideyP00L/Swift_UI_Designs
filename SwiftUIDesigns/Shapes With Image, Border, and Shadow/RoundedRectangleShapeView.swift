//
//  RoundedRectangleShapeView.swift
//  SwiftUIDesigns
//
//  Created by Jeet Panchal on 2024-11-22.
//

import SwiftUI

// MARK: A SwiftUI view that displays an image inside a rounded rectangle with a customizable border and shadow effect.
struct RoundedRectangleShapeView: View {
    // The image to display inside the rounded rectangle.
    var image: Image
    
    // The width of the rectangular frame.
    var width: CGFloat
    
    // The height of the rectangular frame.
    var height: CGFloat
    
    // The corner radius for the rounded rectangle.
    var cornerRadius: CGFloat
    
    // The color of the rectangular border in hexadecimal format.
    var borderColor: Color
    
    // The width of the border stroke.
    var borderWidth: CGFloat
    
    // The radius of the shadow effect.
    var shadowRadius: CGFloat
    
    var body: some View {
        image
            .resizable() // Makes the image resizable to fit the specified dimensions.
            .scaledToFill() // Ensures the image scales to fill the entire frame while preserving its aspect ratio.
            .frame(width: width, height: height) // Sets the frame dimensions of the image.
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius)) // Clips the image into a rounded rectangle shape.
            .overlay {
                // Adds a rounded rectangle border (stroke) around the clipped image.
                RoundedRectangle(cornerRadius: cornerRadius).stroke(borderColor, lineWidth: borderWidth)
            }
            .shadow(radius: shadowRadius) // Adds a shadow with the specified radius around the image.
    }
}

// MARK: Example of a RoundedRectangleShapeView preview.
#Preview {
    RoundedRectangleShapeView(
        image: Image("Spiderman"),
        width: 300,
        height: 200,
        cornerRadius: 20,
        borderColor: Color(hex: "#FFFFFF"),
        borderWidth: 4,
        shadowRadius: 6
    )
}

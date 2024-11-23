//
//  RectangleShapeView.swift
//  SwiftUIDesigns
//
//  Created by Jeet Panchal on 2024-11-22.
//

import SwiftUI
// MARK: A SwiftUI view that displays an image inside a Rectangle frame with a customizable border and shadow effect.

struct RectangleShapeView: View {
    // The image to display inside the rectangle.
    var image: Image
    
    // The width of the rectangular frame.
    var width: CGFloat
    
    // The height of the rectangular frame.
    var height: CGFloat
    
    // The color of the rectangular border in hexadecimal format.
    var borderColor: Color
    
    // The width of the border stroke.
    var borderWidth: CGFloat
    
    // The radius of the shadow effect.
    var shadowRadius: CGFloat
    
    var body: some View {
        image
        // Makes the image resizable to fit the specified dimensions.
            .resizable()
        
        // Ensures the image scales to fill the entire frame while preserving its aspect ratio.
            .scaledToFill()
        
        // Sets the frame dimensions of the image.
            .frame(width: width, height: height)
        
        // Clips the image into a rectangular shape.
            .clipShape(Rectangle())
        
            .overlay {
                // Adds a rectangular border (stroke) around the clipped image.
                Rectangle().stroke(borderColor, lineWidth: borderWidth)
            }
        // Adds a shadow with the specified radius around the image.
            .shadow(radius: shadowRadius)
    }
}

// MARK: Example of a RectangleShapeView preview.
#Preview {
    RectangleShapeView(
        image: Image("Spiderman"),
        width: 300,
        height: 300,
        borderColor: Color(hex: "#FFFFFF"),
        borderWidth: 5,
        shadowRadius: 7
    )
}

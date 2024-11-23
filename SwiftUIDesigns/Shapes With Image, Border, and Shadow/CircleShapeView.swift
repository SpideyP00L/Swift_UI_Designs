//
//  CircleShapeView.swift
//  SwiftUIDesigns
//
//  Created by Jeet Panchal on 2024-11-22.
//

import SwiftUI
// MARK: A SwiftUI view that displays an image inside a circular frame with a customizable border and shadow effect.

struct CircleShapeView: View {
    // The image to display inside the circle.
    var image: Image
    
    // The width of the circular frame.
    var width: CGFloat
    
    // The height of the circular frame.
    var height: CGFloat
    
    // The color of the circular border in hexadecimal format.
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
        
        // Clips the image into a circular shape.
            .clipShape(Circle())
        
            .overlay {
                // Adds a circular border (stroke) around the clipped image.
                Circle().stroke(borderColor, lineWidth: borderWidth)
            }
        // Adds a shadow with the specified radius around the image.
            .shadow(radius: shadowRadius)
    }
}

// MARK: Example of a CircleShapeView preview.
#Preview {
    CircleShapeView(
        image: Image("Spiderman"),
        width: 300,
        height: 300,
        borderColor: Color(hex: "#FFFFFF"),
        borderWidth: 5,
        shadowRadius: 7
    )
}

//
//  StarShapeView.swift
//  SwiftUIDesigns
//
//  Created by Jeet Panchal on 2024-11-22.
//

import SwiftUI

// MARK: A custom shape that defines a star with a specified number of points.
struct StarShape: Shape {
    // The number of points in the star (default is 5).
    var points: Int = 5
    
    func path(in rect: CGRect) -> Path {
        // The center of the bounding rectangle.
        let center = CGPoint(x: rect.midX, y: rect.midY)
        
        // The radius of the star's outer points.
        let radius = min(rect.width, rect.height) / 2
        
        // Initialize an empty path.
        var path = Path()
        
        // Loop through twice the number of points to alternate between outer and inner points.
        for i in 0..<points * 2 {
            // Calculate the angle in radians for the current point.
            let angle = (Double(i) * (360.0 / Double(points * 2))) * .pi / 180
            
            // Alternate between full radius (outer points) and half radius (inner points).
            let length = (i % 2 == 0) ? Double(radius) : Double(radius) * 0.5
            
            // Determine the position of the point.
            let point = CGPoint(
                x: center.x + CGFloat(cos(angle) * length),
                y: center.y + CGFloat(sin(angle) * length)
            )
            
            // Move to the first point or draw a line to subsequent points.
            if i == 0 {
                path.move(to: point)
            } else {
                path.addLine(to: point)
            }
        }
        
        // Close the path to complete the star shape.
        path.closeSubpath()
        return path
    }
}

// MARK: A SwiftUI view that displays an image inside a star shape with customizable properties.
struct StarShapeView: View {
    // The image to display inside the star.
    var image: Image
    
    // The size (width and height) of the star frame.
    var size: CGFloat
    
    // The number of points in the star.
    var points: Int
    
    // The color of the border around the star.
    var borderColor: Color
    
    // The width of the border stroke.
    var borderWidth: CGFloat
    
    // The radius of the shadow effect.
    var shadowRadius: CGFloat
    
    var body: some View {
        image
            .resizable() // Makes the image resizable to fit the specified dimensions.
            .scaledToFill() // Ensures the image scales to fill the frame while preserving its aspect ratio.
            .frame(width: size, height: size) // Sets the size of the star's frame.
            .clipShape(StarShape(points: points)) // Clips the image into a star shape with the specified number of points.
            .overlay {
                // Adds a star-shaped border around the clipped image.
                StarShape(points: points).stroke(borderColor, lineWidth: borderWidth)
            }
            .shadow(radius: shadowRadius) // Adds a shadow with the specified radius around the star.
    }
}

// MARK: Example of a StarShapeView preview.
#Preview {
    StarShapeView(
        image: Image("Spiderman"), // The image to be displayed.
        size: 300, // The size of the star (width and height).
        points: 4, // Number of points in the star.
        borderColor: .white, // Border color for the star.
        borderWidth: 3, // Width of the border stroke.
        shadowRadius: 5 // Radius of the shadow effect.
    )
}

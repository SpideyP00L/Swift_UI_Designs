//
//  HexagonShapeView.swift
//  SwiftUIDesigns
//
//  Created by Jeet Panchal on 2024-11-22.
//

import SwiftUI

// MARK: A custom shape that defines a hexagon.
struct HexagonShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let width = rect.size.width
        let height = rect.size.height
        
        // Define the six points of the hexagon.
        path.move(to: CGPoint(x: width * 0.5, y: 0))
        path.addLine(to: CGPoint(x: width, y: height * 0.25))
        path.addLine(to: CGPoint(x: width, y: height * 0.75))
        path.addLine(to: CGPoint(x: width * 0.5, y: height))
        path.addLine(to: CGPoint(x: 0, y: height * 0.75))
        path.addLine(to: CGPoint(x: 0, y: height * 0.25))
        path.closeSubpath()
        return path
    }
}

// MARK: A SwiftUI view that displays an image inside a hexagon with a customizable border and shadow effect.
struct HexagonShapeView: View {
    var image: Image
    var width: CGFloat
    var height: CGFloat
    var borderColor: Color
    var borderWidth: CGFloat
    var shadowRadius: CGFloat

    var body: some View {
        image
            .resizable() // Makes the image resizable to fit the specified dimensions.
            .scaledToFill() // Ensures the image scales to fill the frame while preserving aspect ratio.
            .frame(width: width, height: height) // Sets the frame dimensions of the image.
            .clipShape(HexagonShape()) // Clips the image into a hexagon shape.
            .overlay {
                // Adds a hexagon border around the clipped image.
                HexagonShape().stroke(borderColor, lineWidth: borderWidth)
            }
            .shadow(radius: shadowRadius) // Adds a shadow with the specified radius.
    }
}

// MARK: Example of a HexagonShapeView preview.
#Preview {
    HexagonShapeView(
        image: Image("Spiderman"),
        width: 300,
        height: 300,
        borderColor: .white,
        borderWidth: 4,
        shadowRadius: 6
    )
}

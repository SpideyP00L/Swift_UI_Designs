//
//  CapsuleShapeView.swift
//  SwiftUIDesigns
//
//  Created by Jeet Panchal on 2024-11-22.
//

import SwiftUI

// MARK: A SwiftUI view that displays an image inside a capsule shape with a customizable border and shadow effect.
struct CapsuleShapeView: View {
    // The image to display inside the capsule.
    var image: Image

    // The width of the capsule frame.
    var width: CGFloat

    // The height of the capsule frame.
    var height: CGFloat

    // The color of the border around the capsule.
    var borderColor: Color

    // The width of the border stroke.
    var borderWidth: CGFloat

    // The radius of the shadow effect.
    var shadowRadius: CGFloat

    var body: some View {
        image
            .resizable() // Makes the image resizable to fit the specified dimensions.
            .scaledToFill() // Ensures the image scales to fill the frame while preserving aspect ratio.
            .frame(width: width, height: height) // Sets the frame dimensions of the image.
            .clipShape(Capsule()) // Clips the image into a capsule shape.
            .overlay {
                // Adds a capsule border around the clipped image.
                Capsule().stroke(borderColor, lineWidth: borderWidth)
            }
            .shadow(radius: shadowRadius) // Adds a shadow with the specified radius.
    }
}

// MARK: Example of a CapsuleShapeView preview.
#Preview {
    CapsuleShapeView(
        image: Image("Spiderman"),
        width: 300,
        height: 150,
        borderColor: .white,
        borderWidth: 3,
        shadowRadius: 5
    )
}

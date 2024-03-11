//
//  CarView.swift
//
//
//  Created by Jacob Bartlett on 08/03/2024.
//

import SwiftUI

public struct CarView: View {
    
    let car: Car
    let contentMode: ContentMode
    
    public init(car: Car, contentMode: ContentMode = .fit) {
        self.car = car
        self.contentMode = contentMode
    }

    public var body: some View {
        car.image
            .resizable()
            .aspectRatio(contentMode: contentMode)
    }
}

#Preview {
    CarView(car: Car(1))
}

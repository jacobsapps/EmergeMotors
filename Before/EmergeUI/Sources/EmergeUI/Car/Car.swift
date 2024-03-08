//
//  Car.swift
//  
//
//  Created by Jacob Bartlett on 08/03/2024.
//

import SwiftUI

public struct Car: Identifiable {
    
    public static func sample() -> [Car] {
        (1...24).map { Car($0) }
    }
    
    public let id: Int
    private let imageName: String
    
    public var image: Image {
        Image("\(id)", bundle: .module)
    }
    
    public var uiImage: UIImage? {
        UIImage(named: "\(id)", in: .module, with: .none)
    }

    init(_ id: Int) {
        self.id = id
        self.imageName = "\(id)"
    }
}

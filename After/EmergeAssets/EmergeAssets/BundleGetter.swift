//
//  BundleGetter.swift
//
//
//  Created by Jacob Bartlett on 11/03/2024.
//

import Foundation

public final class BundleGetter {
    
    public static func get() -> Bundle {
        Bundle(for: BundleGetter.self)
    }
}

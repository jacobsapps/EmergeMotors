//
//  LoadingAnimation.swift
//
//
//  Created by Jacob Bartlett on 08/03/2024.
//

import EmergeAssets
import Lottie
import SwiftUI

/// This animation was created by https://lottiefiles.com/lucanagy
///
public struct LoadingAnimation: View {
    
    public init() { }
    
    public var body: some View {
        LottieView(animation: .named("carLoadingAnimation", bundle: EmergeAssets.BundleGetter.get()))
            .playing()
    }
}

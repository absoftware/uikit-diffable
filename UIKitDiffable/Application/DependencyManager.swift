//
//  DependencyManager.swift
//  UIKitDiffable
//
//  Created by Ariel Bogdziewicz on 03/08/2021.
//

import UIKit

final class DependencyManager {
    
    let application: UIApplication
    let windowScene: UIWindowScene
    let window: UIWindow

    init(application: UIApplication, windowScene: UIWindowScene, window: UIWindow) {
        self.application = application
        self.windowScene = windowScene
        self.window = window
    }
}

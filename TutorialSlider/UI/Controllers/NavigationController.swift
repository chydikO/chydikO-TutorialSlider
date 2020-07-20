//
//  NavigationController.swift
//  TutorialSlider
//
//  Created by Yurii Bosov on 20.07.2020.
//  Copyright © 2020 OlegChudnovskiy. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {

    override var prefersStatusBarHidden: Bool {
        return topViewController?.prefersStatusBarHidden ?? false
    }

}

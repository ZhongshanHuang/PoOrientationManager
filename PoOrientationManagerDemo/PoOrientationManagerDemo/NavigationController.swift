//
//  NavigationController.swift
//  PoOrientationManager
//
//  Created by HzS on 2024/1/8.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override var shouldAutorotate: Bool {
        true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        topViewController!.supportedInterfaceOrientations
    }
    
    override var preferredInterfaceOrientationForPresentation: UIInterfaceOrientation {
        topViewController!.preferredInterfaceOrientationForPresentation
    }

}

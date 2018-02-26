//
//  splitVController.swift
//  Westeros
//
//  Created by ARMANDO on 24/2/18.
//  Copyright © 2018 ARMANDO. All rights reserved.
//

import UIKit

class splitVController: UISplitViewController,UISplitViewControllerDelegate {
   
    let primaryVC:UITabBarController
    let secondaryVC:UINavigationController
    init(primaryVC:UITabBarController?,secondaryVC:UINavigationController?){
        self .primaryVC=primaryVC!
        self.secondaryVC=secondaryVC!
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        //self.delegate = self
        self.viewControllers=[primaryVC,secondaryVC]
        self.preferredDisplayMode = .allVisible
    }
}

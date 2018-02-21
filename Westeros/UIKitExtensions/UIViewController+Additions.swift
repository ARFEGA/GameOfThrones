//
//  UIViewController+Additions.swift
//  Westeros
//
//  Created by ARMANDO on 13/2/18.
//  Copyright © 2018 ARMANDO. All rights reserved.
//

import UIKit

extension UIViewController{
    func wrappedInNavigation()->UINavigationController{
            return UINavigationController(rootViewController: self)
        
    }
}

extension Notification.Name{
   static let NotificationName=Notification.Name(HOUSE_DID_CHANGE_NOTIFICATION_NAME)
    
}

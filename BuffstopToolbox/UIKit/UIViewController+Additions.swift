//
//  UIViewController+Additions.swift
//  BuffstopToolbox
//
//  Created by Andreas Buff on 18/10/16.
//  Copyright © 2016 buffhaltestelle. All rights reserved.
//

import Foundation

public extension UIViewController {
    
    public func removeChildViewControllers() {
        for child in self.childViewControllers {
            removeChildViewController(child)
        }
    }
    
    public func addChildViewController(_ controller: UIViewController, embedViewIn containerView: UIView) {
        controller.willMove(toParentViewController: self)
        addChildViewController(controller)
        containerView.addSubview(controller.view)
        controller.view.addCustomConstraints(CustomConstrains.FullSizeInSuperview)
        controller.didMove(toParentViewController: self)
    }
    
    public func removeChildViewController(_ controller: UIViewController) {
        controller.willMove(toParentViewController: nil)
        controller.view.removeFromSuperview()
        controller.removeFromParentViewController()
    }
}

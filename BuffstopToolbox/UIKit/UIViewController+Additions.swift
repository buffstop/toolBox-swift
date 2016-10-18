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
            child.willMove(toParentViewController: nil)
            child.view.removeFromSuperview()
            child.removeFromParentViewController()
        }
    }
    
    public func addChildViewController(_ controller: UIViewController, embedViewIn containerView: UIView) {
        controller.willMove(toParentViewController: self)
        addChildViewController(controller)
//        controller.view.frame = containerView.frame
        containerView.addSubview(controller.view)
        controller.view.addCustomConstraints(CustomConstrains.FullSizeInSuperview)
        controller.didMove(toParentViewController: self)
    }
}

//
//  UIViewController+Additions.swift
//  BuffstopToolbox
//
//  Created by Andreas Buff on 18/10/16.
//  Copyright © 2016 buffhaltestelle. All rights reserved.
//

import UIKit

public extension UIViewController {
    
    public func removeChildViewControllers() {
        for child in self.childViewControllers {
            bf_removeChildViewController(child)
        }
    }
    
    public func addChildViewController(_ controller: UIViewController, embedViewIn containerView: UIView) {
        controller.willMove(toParentViewController: self)
        addChildViewController(controller)
        containerView.addSubview(controller.view)
        controller.view.addCustomConstraints(CustomConstrains.FullSizeInSuperview)
        controller.didMove(toParentViewController: self)
    }
    
    // Name prefixed due to strange EXC_BAD_ACCESS crash, probably caused by name clashing of method name with underlying Obj-C methode in non-public API. See: http://stackoverflow.com/questions/40493497/method-not-found-at-runtime?noredirect=1#comment68232076_40493497
    public func bf_removeChildViewController(_ controller: UIViewController) {
        controller.willMove(toParentViewController: nil)
        controller.view.removeFromSuperview()
        controller.removeFromParentViewController()
    }
}

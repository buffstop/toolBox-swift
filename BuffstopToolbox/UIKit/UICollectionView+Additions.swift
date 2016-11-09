//
//  UICollectionView+Additions.swift
//  BuffstopToolbox
//
//  Created by Andreas Buff on 09/11/16.
//  Copyright © 2016 buffhaltestelle. All rights reserved.
//

import UIKit

public extension UICollectionView {

    /// En- or disables sticky UICollectionView headers.
    ///
    /// - Parameter enabled: whether or not to enable sticky headers
    public func setStickySectionHeadersEnabled(to enabled: Bool) {
        let layout = self.collectionViewLayout as? UICollectionViewFlowLayout // casting is required because UICollectionViewLayout doesn't offer header pin. Its feature of UICollectionViewFlowLayout
        layout?.sectionHeadersPinToVisibleBounds = true
    }
}

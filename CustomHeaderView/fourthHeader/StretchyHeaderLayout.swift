//
//  StretchyHeaderLayout.swift
//  CollapseToolBar
//
//  Created by yusef naser on 8/31/19.
//  Copyright © 2019 yusef naser. All rights reserved.
//

import UIKit

class StretchyHeaderLayout : UICollectionViewFlowLayout {
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        let attributes = super.layoutAttributesForElements(in: rect)
        
        attributes?.forEach({ (attr) in
            
            guard let collectionView = collectionView else { return }
            let contentOffSetY = collectionView.contentOffset.y
            let width = collectionView.frame.width
            let height = attr.frame.height - contentOffSetY
            
            if contentOffSetY > 0 {
                return
            }
            
            if attr.representedElementKind == UICollectionView.elementKindSectionHeader && attr.indexPath.section == 0  {
                attr.frame = CGRect(x: 0, y: contentOffSetY , width: width , height: height )
            }
        })
        return attributes
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }
    
    
}

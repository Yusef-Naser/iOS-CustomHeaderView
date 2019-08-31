//
//  HeaderView.swift
//  CollapseToolBar
//
//  Created by yusef naser on 8/31/19.
//  Copyright © 2019 yusef naser. All rights reserved.
//

import UIKit

class HeaderView : UICollectionReusableView {
    
    lazy var imageView : UIImageView = {
        let i = UIImageView()
        i.image = #imageLiteral(resourceName: "zhu-hongzhi-eT_rrCbvcqg-unsplash")
        i.clipsToBounds = true
        i.contentMode = UIView.ContentMode.scaleAspectFill
        return i
    }()
    
    var animate : UIViewPropertyAnimator!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
        
        setupVisualEffectBlur()
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func addViews () {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: self.topAnchor , constant: 0).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor , constant: 0).isActive = true
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor , constant: 0).isActive = true
        imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    }
    
    
    private func setupVisualEffectBlur () {
        
        animate = UIViewPropertyAnimator(duration: 0.3 , curve: .linear , animations: { [weak self ] in
            let blurEffect = UIBlurEffect(style: .regular )
            let visualEffect = UIVisualEffectView(effect: blurEffect)
            visualEffect.translatesAutoresizingMaskIntoConstraints = false
            self?.addSubview(visualEffect)
            visualEffect.topAnchor.constraint(equalTo: self!.topAnchor , constant: 0).isActive = true
            visualEffect.bottomAnchor.constraint(equalTo: self!.bottomAnchor , constant: 0).isActive = true
            visualEffect.leadingAnchor.constraint(equalTo: self!.leadingAnchor , constant: 0).isActive = true
            visualEffect .trailingAnchor.constraint(equalTo: self!.trailingAnchor, constant: 0).isActive = true
        }
            )
        
       
    }
    
}

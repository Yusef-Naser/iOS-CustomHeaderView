//
//  ImageTableViewCell.swift
//  CollapseToolBar
//
//  Created by yusef naser on 8/31/19.
//  Copyright © 2019 yusef naser. All rights reserved.
//

import UIKit

class ImageTableViewCell : UITableViewCell {
    
    
    lazy var imagesssss : UIImageView = {
       let i = UIImageView()
        i.image = #imageLiteral(resourceName: "zhu-hongzhi-eT_rrCbvcqg-unsplash")
        i.contentMode = UIView.ContentMode.scaleAspectFill
        i.clipsToBounds = true 
        return i
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style , reuseIdentifier: reuseIdentifier)
        addImageBackground()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func addImageBackground () {
        imagesssss.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(imagesssss)
        imagesssss.topAnchor.constraint(equalTo: self.contentView.topAnchor , constant: 0).isActive = true
        imagesssss.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor , constant: 0).isActive = true
        imagesssss.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor , constant: 0).isActive = true
        imagesssss.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor , constant: 0).isActive = true
    }
    
    
}

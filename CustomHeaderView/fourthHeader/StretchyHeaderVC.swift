//
//  StretchyHeaderVC.swift
//  CollapseToolBar
//
//  Created by yusef naser on 8/31/19.
//  Copyright © 2019 yusef naser. All rights reserved.
//

// source : https://www.youtube.com/watch?v=nGY6ZzMe5tE

import UIKit

class StretchyHeaderVC : UIViewController {
    
    let padding : CGFloat = 16
    var header : HeaderView?
    lazy var collectionView : UICollectionView = {
        let layout = StretchyHeaderLayout()
        layout.sectionInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16 )
        layout.itemSize = CGSize(width: self.view.frame.width - self.padding , height: 50 )
        let c = UICollectionView(frame: .zero , collectionViewLayout: layout )
        c.backgroundColor = .white
        c.delegate = self
        c.dataSource = self
        c.register(UICollectionViewCell.self , forCellWithReuseIdentifier: "cell")
        c.register(HeaderView.self , forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader , withReuseIdentifier: "header")
        return c
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
    }
    
    private func addViews () {
        collectionView.translatesAutoresizingMaskIntoConstraints = false 
        self.view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor , constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor , constant: 0).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor , constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor , constant: 0).isActive = true
    }
    
}


extension StretchyHeaderVC : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .blue
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader , withReuseIdentifier: "header", for: indexPath ) as? HeaderView
        
        return header!
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: self.view.frame.width - padding , height: 200  )
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        if offset > 0 {
            return
        }
        header?.animate.fractionComplete = abs(offset) / 400
    }
    
    
}

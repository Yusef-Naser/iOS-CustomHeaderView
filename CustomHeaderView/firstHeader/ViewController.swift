//
//  ViewController.swift
//  CollapseToolBar
//
//  Created by yusef naser on 8/28/19.
//  Copyright © 2019 yusef naser. All rights reserved.
//

// source : https://blog.usejournal.com/how-to-collapse-a-custom-header-view-in-ios-while-scrolling-5e0949c64ecd

import UIKit

class ViewController: UIViewController {

    lazy var firstView : UIView = {
       let v = UIView()
        v.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        return v
    }()
    
    lazy var secondView : UIView = {
       let v = UIView()
        v.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        return v
    }()
    
    lazy var thirdView : UIView = {
       let v = UIView()
        v.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        return v
    }()
    
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var headerViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var parentViewInScroll: UIView!
    
    let headerViewMaxHeight: CGFloat = 250
    let headerViewMinHeight: CGFloat = 44 + UIApplication.shared.statusBarFrame.height
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      scrollView.delegate = self
        addViewsToScrollView()
    }

    private func addViewsToScrollView () {
        
        self.parentViewInScroll.addSubview(firstView)
        self.parentViewInScroll.addSubview(secondView)
        self.parentViewInScroll.addSubview(thirdView)
        
        firstView.translatesAutoresizingMaskIntoConstraints = false
        firstView.topAnchor.constraint(equalTo: self.parentViewInScroll.topAnchor , constant: 16 ).isActive = true
        firstView.leadingAnchor.constraint(equalTo: self.parentViewInScroll.leadingAnchor , constant: 16 ).isActive = true
        firstView.trailingAnchor.constraint(equalTo: self.parentViewInScroll.trailingAnchor , constant: -16).isActive = true
        firstView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        secondView.translatesAutoresizingMaskIntoConstraints = false
        secondView.topAnchor.constraint(equalTo: self.firstView.bottomAnchor , constant: 16 ).isActive = true
        secondView.leadingAnchor.constraint(equalTo: self.parentViewInScroll.leadingAnchor , constant: 16 ).isActive = true
        secondView.trailingAnchor.constraint(equalTo: self.parentViewInScroll.trailingAnchor , constant: -16).isActive = true
        secondView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        
        thirdView.translatesAutoresizingMaskIntoConstraints = false
        thirdView.topAnchor.constraint(equalTo: self.secondView.bottomAnchor , constant: 16 ).isActive = true
        thirdView.leadingAnchor.constraint(equalTo: self.parentViewInScroll.leadingAnchor , constant: 16 ).isActive = true
        thirdView.trailingAnchor.constraint(equalTo: self.parentViewInScroll.trailingAnchor , constant: -16).isActive = true
        thirdView.bottomAnchor.constraint(equalTo: self.parentViewInScroll.bottomAnchor , constant: -16 ).isActive = true
        thirdView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        
    }

}

extension ViewController : UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y: CGFloat = scrollView.contentOffset.y
        let newHeaderViewHeight: CGFloat = headerViewHeightConstraint.constant - y
        
        if newHeaderViewHeight > headerViewMaxHeight {
            headerViewHeightConstraint.constant = headerViewMaxHeight
        } else if newHeaderViewHeight < headerViewMinHeight {
            headerViewHeightConstraint.constant = headerViewMinHeight
        } else {
            headerViewHeightConstraint.constant = newHeaderViewHeight
            scrollView.contentOffset.y = 0 // block scroll view
        }
        
    }
    
}

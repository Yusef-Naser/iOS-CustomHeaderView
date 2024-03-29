//
//  CollapseHeaderView.swift
//  CollapseToolBar
//
//  Created by yusef naser on 8/31/19.
//  Copyright © 2019 yusef naser. All rights reserved.
//

// source : https://medium.com/@jeremysh/creating-a-sticky-header-for-a-uitableview-40af71653b55

import UIKit

class CollapseHeaderViewVC : UIViewController {
    
    var tableView:UITableView!
    var headerView:CategoryHeaderView!
    var headerHeightConstraint:NSLayoutConstraint!
    let headerViewMinHeight: CGFloat = 44 + UIApplication.shared.statusBarFrame.height

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUpHeader()
        setUpTableView()
    }
    
    
    func setUpHeader() {
        headerView = CategoryHeaderView(frame: .zero , title: "Articles")
        headerView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(headerView)
        headerHeightConstraint = headerView.heightAnchor.constraint(equalToConstant: 250)
        headerHeightConstraint.isActive = true
        let constraints:[NSLayoutConstraint] = [
            headerView.topAnchor.constraint(equalTo: view.topAnchor),
            headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    
    func setUpTableView() {
        tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        let constraints:[NSLayoutConstraint] = [
            tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
        tableView.register(UITableViewCell.self,forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    
    
    
}

extension CollapseHeaderViewVC : UITableViewDataSource {
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",   for: indexPath as IndexPath)
        cell.textLabel?.text = "Article \(indexPath.row)"
        return cell
    }
  
}

extension CollapseHeaderViewVC : UITableViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.y < 0 {
            self.headerHeightConstraint.constant += abs(scrollView.contentOffset.y)
            headerView.incrementColorAlpha(offset: self.headerHeightConstraint.constant)
            headerView.incrementArticleAlpha(offset: self.headerHeightConstraint.constant)
        } else if scrollView.contentOffset.y > 0 && self.headerHeightConstraint.constant >= headerViewMinHeight {
            self.headerHeightConstraint.constant -= scrollView.contentOffset.y / 50
            headerView.decrementColorAlpha(offset: scrollView.contentOffset.y)
            headerView.decrementArticleAlpha(offset: self.headerHeightConstraint.constant)
            if self.headerHeightConstraint.constant < headerViewMinHeight {
                self.headerHeightConstraint.constant = headerViewMinHeight
            }
        }
    }
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if self.headerHeightConstraint.constant > 150 {
            animateHeader()
        }
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if self.headerHeightConstraint.constant > 150 {
            animateHeader()
        }
    }
    
    
    func animateHeader() {
        self.headerHeightConstraint.constant = 250
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.5, options: .curveEaseInOut , animations: {
        self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
}

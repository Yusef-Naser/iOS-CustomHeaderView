//
//  HeaderTableViewVC.swift
//  CollapseToolBar
//
//  Created by yusef naser on 8/31/19.
//  Copyright © 2019 yusef naser. All rights reserved.
//

// source : https://medium.com/@evicoli/creating-simple-table-view-header-animated-with-collapse-d36e74452ef0

import UIKit

class HeaderTableViewVC : UIViewController {
    
    lazy var tableView : UITableView = {
       let t = UITableView()
        t.delegate = self
        t.dataSource = self
        t.separatorStyle = .none
        t.register(ImageTableViewCell.self , forCellReuseIdentifier: String(describing: ImageTableViewCell.self ))
        return t
    }()
    
    var imageHeader : UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addTableView()
    }
    
    private func addTableView () {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor , constant: 0).isActive = true
        tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor , constant: 0).isActive = true
        tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor , constant: 0).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor , constant: 0).isActive = true
    }
    
}

extension HeaderTableViewVC : UITableViewDelegate , UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return indexPath.section == 0 ? 250 : 64
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 0 : 48
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let v = UIView()
        v.backgroundColor = .gray
        return v
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 1 : 25
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ImageTableViewCell.self ), for: indexPath) as! ImageTableViewCell
            imageHeader = cell.imagesssss
            return cell
        }else {
            let cell = UITableViewCell()
            cell.selectionStyle = .none
            cell.textLabel?.text = "cell number : \(indexPath.row)"
            return cell
        }
        
    }
    
    
    
    
}

extension HeaderTableViewVC  {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let image = imageHeader , scrollView.contentOffset.y >= 0 , scrollView.contentOffset.y <= 250 else { return }
        UIView.animate(withDuration: 0.3) {
            image .alpha  = 1.0 - abs(scrollView.contentOffset.y / 250 )
        }
    }
    
    private func setPostion (_ scrollView : UIScrollView ) {
        UIView.animate(withDuration: 0.3) {
            if scrollView.contentOffset.y > 0  && scrollView.contentOffset.y < 128 {
                scrollView.contentOffset = .zero
            }else if scrollView.contentOffset.y >= 128 && scrollView.contentOffset.y <= 256  {
                scrollView.contentOffset.y = 256
            }
        }
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        setPostion(scrollView)
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        setPostion(scrollView)
    }
    
}

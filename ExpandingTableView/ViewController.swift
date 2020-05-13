//
//  ViewController.swift
//  ExpandingTableView
//
//  Created by Wanni on 2020/03/27.
//  Copyright © 2020 Wanni. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initDelegate()
        initTableView()
    }
    
    func initDelegate() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    func initTableView() {
        self.view.addSubview(self.tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.view.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }

    let tableView: MyTableView = {
        let tableView = MyTableView()
        tableView.initUI()
        return tableView
    }()
    
}

// MARK: - TableView Function
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.tableView.myData.sectionNumber
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let tableView = tableView as? MyTableView else {
            return 0
        }
        return tableView.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        switch indexPath.section {
        case 0:
            cell.backgroundColor = #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1)
        case 1:
            cell.backgroundColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
        default:
            cell.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let tableView = tableView as? MyTableView else {
            return
        }
        tableView.expanding(selected: indexPath)
    }
    
}




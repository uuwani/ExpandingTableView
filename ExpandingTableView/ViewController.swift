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
        initDelegateAndDataSource()
        initTableView()
    }
    
    func initDelegateAndDataSource() {
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

    let tableView: ExpandingTableView = {
        let tableView = ExpandingTableView()
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
        guard let tableView = tableView as? ExpandingTableView else {
            return 0
        }
        return tableView.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ExpandingTableViewCell()
        guard let tableView = tableView as? ExpandingTableView else {
            return UITableViewCell()
        }
        
        switch indexPath.row {
        case 0:
            cell.takeTextAndPutItOnLabel(text: tableView.getSectionTitle(indexPath: indexPath))
        default:
            cell.takeTextAndPutItOnLabel(text: tableView.getRowTitle(indexPath: indexPath))

        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let tableView = tableView as? ExpandingTableView else {
            return
        }
        tableView.expanding(selectedIndexPath: indexPath)
    }
    
// MARK: - Editing Function Test
    
//    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
//        return .none
//    }
//
//    func tableView(_ tableView: UITableView, shouldIndentWhileEditingRowAt indexPath: IndexPath) -> Bool {
//        return false
//    }
//
//    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
//
//        let movedObject = self.tableView.myData.sectionsData[sourceIndexPath.row]
//        self.tableView.myData.sectionsData.remove(at: sourceIndexPath.row)
//        self.tableView.myData.sectionsData.insert(movedObject, at: destinationIndexPath.row)
//    }
}




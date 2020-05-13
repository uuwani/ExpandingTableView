//
//  MyTableView.swift
//  ExpandingTableView
//
//  Created by Wanni on 2020/05/12.
//  Copyright © 2020 Wanni. All rights reserved.
//

import Foundation
import UIKit

protocol MyTableViewUI {
    var myBackgroundColor: UIColor { get }
    
}

protocol MyTableViewDataSource {
    var myData: MyTableViewData { get }
}

class MyTableView: UITableView, MyTableViewUI, MyTableViewDataSource {
    
    var myData: MyTableViewData = MyTableViewData()
    var myBackgroundColor: UIColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
    
    func initUI() {
        self.backgroundColor = myBackgroundColor
        self.separatorStyle = .none
        self.tableFooterView = UIView()
    }
}

//MARK: - numOfRowInSections Function

extension MyTableView {
    
    func numberOfRowsInSection(section: Int) -> Int {
        let isOpened = self.myData.sectionsOpened[section]
        switch isOpened {
        case true:
            return self.myData.numOfRowInSections[section] + 1
        default:
            return 1
        }
    }
}


// MARK: - tableView expanding function
extension MyTableView {
    
    /**
     Function to expand the section selected by the user
     
      - Author:
        Wanni
      - Version:
        0.1
     
     - Parameters:
        - selected: user selected section
    */
    
    func expanding(selected indexPath :IndexPath) {
        
        let isOpened = self.myData.sectionsOpened[indexPath.section]
        switch isOpened {
        case true:
            self.deleteRows(selected: indexPath)
        default:
            self.insertRows(selected: indexPath)
        }
    }
    
    private func deleteRows(selected:IndexPath) {
        self.myData.sectionsOpened[selected.section] = false
        var indexesPath = [IndexPath]()
        let sectionNumber = self.myData.numOfRowInSections[selected.section]
        
        for row in 0..<sectionNumber {
            let index = IndexPath(row: row + 1, section: selected.section)
            indexesPath.append(index)
        }
        
        self.beginUpdates()
        self.self.deleteRows(at: indexesPath, with: .fade)
        self.endUpdates()
        
    }
    
    private func insertRows(selected:IndexPath) {
        self.myData.sectionsOpened[selected.section] = true
        var indexesPath = [IndexPath]()
        let sectionNumber = self.myData.numOfRowInSections[selected.section]
        
        for row in 0..<sectionNumber {
            let index = IndexPath(row: row + 1, section: selected.section)
            indexesPath.append(index)
        }
        
        self.beginUpdates()
        self.self.insertRows(at: indexesPath, with: .fade)
        self.endUpdates()
    }
}

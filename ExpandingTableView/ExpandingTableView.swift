//
//  MyTableView.swift
//  ExpandingTableView
//
//  Created by Wanni on 2020/05/12.
//  Copyright © 2020 Wanni. All rights reserved.
//

import Foundation
import UIKit

protocol ExpandingTableViewUI {
    var myBackgroundColor: UIColor { get }
    
}

protocol ExpandingTableViewDataSource {
    var myData: ExpandingTableViewData { get }
}

class ExpandingTableView: UITableView, ExpandingTableViewUI, ExpandingTableViewDataSource {
    
    var myData: ExpandingTableViewData = ExpandingTableViewData()
    var myBackgroundColor: UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    
    func initUI() {
        self.backgroundColor = myBackgroundColor
        self.separatorStyle = .none
        self.tableFooterView = UIView()
        self.estimatedRowHeight = 50
        self.rowHeight = UITableView.automaticDimension
        
    }
}

//MARK: - numOfRowInSections Function

extension ExpandingTableView {
    
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

//MARK: - get TitleText From myData
extension ExpandingTableView {
    
    func getRowTitle(indexPath: IndexPath) -> String {
        return self.myData.rowTitles[indexPath.section][indexPath.row - 1]
    }
    
    func getSectionTitle(indexPath: IndexPath) -> String {
        return self.myData.sectionTitles[indexPath.section]
    }
}


// MARK: - tableView expanding function
extension ExpandingTableView {
    
    /**
     Function to expand the section selected by the user
     
      - Author:
        Wanni
      - Version:
        0.1
     
     - Parameters:
        - selected: user selected section
    */
    
    func expanding(selectedIndexPath indexPath :IndexPath) {
        
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

//
//  MyTableViewData.swift
//  ExpandingTableView
//
//  Created by Wanni on 2020/05/12.
//  Copyright © 2020 Wanni. All rights reserved.
//

import UIKit


protocol ExpandingTableViewDataProtocol {
    
    var sectionNumber: Int { get }
    var sectionTitles: [String] { get }
    var numOfRowInSections: [Int] { get }
    var sectionsOpened: [Bool] { get set }
    
}

struct ExpandingTableViewData: ExpandingTableViewDataProtocol {
    
    var sectionTitles: [String] = ["Section1", "Section2", "Section3"]
    var rowTitles: [[String]] = [["item1"], ["item2","item2"], ["item3","item3","item3"]]
    
    var sectionNumber: Int { return sectionTitles.count }
    
    var numOfRowInSections: [Int] {
        var numOfRowInSections = [Int]()
        for item in rowTitles {
            numOfRowInSections.append(item.count)
        }
        return numOfRowInSections
    }
    var sectionsOpened: [Bool] = [false, false, false]

}

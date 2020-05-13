//
//  MyTableViewData.swift
//  ExpandingTableView
//
//  Created by Wanni on 2020/05/12.
//  Copyright © 2020 Wanni. All rights reserved.
//

import UIKit


protocol MyTableViewDataProtocol {
    
    var sectionNumber: Int { get }
    var sectionTitles: [String] { get }
    var numOfRowInSections: [Int] { get }
    var sectionsOpened: [Bool] { get set }
    
}

struct MyTableViewData: MyTableViewDataProtocol {
    
    let sectionNumber: Int = 3
    var sectionTitles: [String] = ["Test1", "Test2", "Test3"]
    var numOfRowInSections: [Int] = [1, 2, 3]
    var sectionsOpened: [Bool] = [false, false, false]
    
}

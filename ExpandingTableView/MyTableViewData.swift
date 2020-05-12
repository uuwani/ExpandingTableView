//
//  MyTableViewData.swift
//  ExpandingTableView
//
//  Created by Wanni on 2020/05/12.
//  Copyright © 2020 Wanni. All rights reserved.
//

import UIKit


protocol MyTableViewDataProtocol {
    var sectionItemNumber: Int { get }
    var sectionItemTitles: [String] { get }
    var numOfRowInSections: [Int] { get }
}

struct MyTableViewData: MyTableViewDataProtocol {
    
    var sectionItemNumber: Int = 3
    var sectionItemTitles: [String] = ["Test1","Test2","Test3"]
    var numOfRowInSections: [Int] = [3 , 4, 5]
    
}

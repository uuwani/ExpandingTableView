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
    var myBackgroundColor: UIColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    
    func initUI() {
        self.backgroundColor = myBackgroundColor
    }
    
    
}

extension MyTableView {
    
}

//extension MyTableView: MyTableViewDataSource {
//    var myData: MyTableViewData {
//        <#code#>
//    }
//
//
//}

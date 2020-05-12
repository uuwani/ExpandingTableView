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
    }
    
    func initDelegate() {
        self.tableView.delegate = self
    }
    
    func initView() {
        
    }
    
    let tableView: MyTableView = {
        let tableView = MyTableView()
        tableView.initUI()
        return tableView
    }()
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
}




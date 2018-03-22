//
//  SavedContractorsViewController.swift
//  Greenify
//
//  Created by Ryan Schalk on 3/22/18.
//  Copyright © 2018 Greenify. All rights reserved.
//

import UIKit

class SavedContractorsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension SavedContractorsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "savedContractorsTableCell", for: indexPath)
        
        cell.textLabel?.text = "Ryan Schalk"
        
        return cell
    }
}

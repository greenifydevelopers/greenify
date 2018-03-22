//
//  AvailableContractorsViewController.swift
//  Greenify
//
//  Created by Ryan Schalk on 3/22/18.
//  Copyright © 2018 Greenify. All rights reserved.
//

import UIKit

class AvailableContractorsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension AvailableContractorsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "availableContractorsTableCell", for: indexPath)
        
        cell.textLabel?.text = "John Smith"
        
        return cell
    }
}

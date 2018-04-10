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
    let contractorsService = ContractorsService()
    var contractors = [Contractor]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        contractors = contractorsService.fetch()
    }
}

extension AvailableContractorsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contractors.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "availableContractorsTableCell", for: indexPath)
        
        cell.textLabel?.text = contractors[indexPath.row].company_name
        cell.detailTextLabel?.text = contractors[indexPath.row].email
        
        return cell
    }
}

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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showContractorDetail" {
            if let index = tableView.indexPathForSelectedRow?.row {
                let destination = segue.destination as! ContractorDetailViewController
                destination.name = contractors[index].companyName
                destination.contact = contractors[index].contactName
                destination.address = contractors[index].address
                destination.phoneNumber = contractors[index].contactPhone
                destination.email = contractors[index].contactEmail
                destination.website = contractors[index].website
                destination.blurb = contractors[index].blurb
                destination.buttonHidden = false
            }
        }
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
        
        cell.textLabel?.text = contractors[indexPath.row].companyName
        cell.detailTextLabel?.text = contractors[indexPath.row].contactEmail
        
        return cell
    }
}

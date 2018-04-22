//
//  SavedContractorsViewController.swift
//  Greenify
//
//  Created by Ryan Schalk on 3/22/18.
//  Copyright © 2018 Greenify. All rights reserved.
//

import UIKit
import RealmSwift

class SavedContractorsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let dataOfRealm = try! Realm().objects(ContractorRealmObject.self)

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
}

extension SavedContractorsViewController: UITableViewDataSource {
     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataOfRealm.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "savedContractorsTableCell", for: indexPath)
        let con = dataOfRealm[indexPath.row]
        cell.textLabel?.text = con.companyName
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "showDetails", sender: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        guard let realm = try? Realm() else {
            return
        }
        
        if editingStyle == .delete {
            try! realm.write {
                realm.delete(dataOfRealm[indexPath.row])
            }
//            self.tableArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ContractorDetailViewController {
            if let indexPath = tableView.indexPathForSelectedRow {
                destination.name = dataOfRealm[indexPath.row].companyName
                destination.contact = dataOfRealm[indexPath.row].contactName
                destination.address = dataOfRealm[indexPath.row].address
                destination.phoneNumber = dataOfRealm[indexPath.row].contactPhone
                destination.email = dataOfRealm[indexPath.row].contactEmail
                destination.website = dataOfRealm[indexPath.row].website
                destination.blurb = dataOfRealm[indexPath.row].blurb
                destination.buttonHidden = true
            }
        }
    }
}

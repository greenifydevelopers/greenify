//
//  ChooseHomeTableViewController.swift
//  Greenify
//
//  Created by Erik Seitz on 4/16/18.
//  Copyright © 2018 Greenify. All rights reserved.
//

import UIKit

class ChooseHomeTableViewController: UITableViewController {

    let listOfHomes = loadJson()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listOfHomes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let item = listOfHomes[indexPath.row]
        let address = item.getFullAddress()
//        address += item.getFullAddress()
        cell.textLabel?.text = address
        
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "segueToMyHome", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToMyHome" {
            if let index = tableView.indexPathForSelectedRow?.row {
                (UIApplication.shared.delegate as! AppDelegate).homeStruct = listOfHomes[index]
            }
        }
    }
    
    
    
    
    
}

//
//  LearnViewController.swift
//  Greenify
//
//  Created by Ryan Schalk on 3/22/18.
//  Copyright © 2018 Greenify. All rights reserved.
//

import UIKit

class LearnViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var problems: [ProblemsStruct]!

    private var homeStruct: HomeStruct!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeStruct = (UIApplication.shared.delegate as! AppDelegate).homeStruct
//        let problems = homeStruct.
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toLearnInfo" {
            if let dest = segue.destination as? ItemDetailViewController, let selectedIndex = tableView.indexPathForSelectedRow {
                dest.textToDisplay = problems[selectedIndex.row].learn
            }
        }
    }
}

extension LearnViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return problems.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "learnTableCell", for: indexPath)
        
        cell.textLabel?.text = problems[indexPath.row].problems
        cell.detailTextLabel?.text = "Greenify rating: \(homeStruct.getEnergyRating())"
        
        return cell
    }
}

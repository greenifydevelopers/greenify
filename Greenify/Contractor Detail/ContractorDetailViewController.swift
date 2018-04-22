//
//  ContractorDetailViewController.swift
//  Greenify
//
//  Created by Ryan Schalk on 4/15/18.
//  Copyright © 2018 Greenify. All rights reserved.
//

import UIKit
import RealmSwift

class ContractorRealmObject: Object {
    
    @objc dynamic var companyName: String = ""
    @objc dynamic var address: String = ""
    @objc dynamic var blurb: String  = ""
    @objc dynamic var contactName: String = ""
    @objc dynamic var contactEmail: String = ""
    @objc dynamic var contactPhone: String = ""
    @objc dynamic var website: String = ""
}

class ContractorDetailViewController: UIViewController {
    
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var contactNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var blurbTextView: UITextView!
    
    var name: String?
    var contact: String?
    var address: String?
    var phoneNumber: String?
    var email: String?
    var website: String?
    var blurb: String?
    
    var buttonHidden = false
    
    var contractor: Contractor!

    @IBOutlet weak var addContractorButton: UIButton!
    
    @IBAction func addContractor(_ sender: Any) {
        
        guard let realm = try? Realm() else {
            return
        }
        
        let temp = ContractorRealmObject()
        
        temp.companyName = companyNameLabel.text!
        temp.contactName = contactNameLabel.text!
        temp.address = addressLabel.text!
        temp.contactPhone = phoneNumberLabel.text!
        temp.contactEmail = emailLabel.text!
        temp.website = websiteLabel.text!
        temp.blurb = blurbTextView.text!
    
        let contractors = try! Realm().objects(ContractorRealmObject.self)
        var exists = false
        for con in contractors {
            if (con.companyName == temp.companyName) && (con.contactName == temp.contactName) && (con.address == temp.address)
                && (con.contactPhone == temp.contactPhone) && (con.contactEmail == temp.contactEmail) && (con.website == temp.website) && (con.blurb == temp.blurb) {
                exists = true;
            }
        }
        
        if exists == false {
            try? realm.write {
                realm.add(temp)
            }
            
            let alert = UIAlertController(title: "Success!", message: "\(temp.companyName) added to Saved Contractors", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Done", style: .default, handler: nil)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
        }
        else {
            let alert = UIAlertController(title: "Failed!", message: "\(temp.companyName) already saved", preferredStyle: .alert)
            let ok = UIAlertAction(title: "Done", style: .default, handler: nil)
            alert.addAction(ok)
            present(alert, animated: true, completion: nil)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if buttonHidden == true {
            self.addContractorButton.isHidden = true
        }
        
        companyNameLabel.text = name
        contactNameLabel.text = contact
        addressLabel.text = address
        phoneNumberLabel.text = phoneNumber
        emailLabel.text = email
        websiteLabel.text = website
        blurbTextView.text = blurb

        navigationItem.largeTitleDisplayMode = .never
    }
}


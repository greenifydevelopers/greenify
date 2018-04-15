//
//  ContractorDetailViewController.swift
//  Greenify
//
//  Created by Ryan Schalk on 4/15/18.
//  Copyright © 2018 Greenify. All rights reserved.
//

import UIKit

class ContractorDetailViewController: UIViewController {
    
    @IBOutlet weak var companyNameLabel: UILabel!
    @IBOutlet weak var contactNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var websiteLabel: UILabel!
    @IBOutlet weak var blurbTextView: UITextView!
    
    var contractor: Contractor!

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpContractorInfo()
    }
}

private extension ContractorDetailViewController {
    func setUpContractorInfo() {
        companyNameLabel.text = contractor.company_name
        contactNameLabel.text = contractor.contact_name
        addressLabel.text = contractor.address
        phoneNumberLabel.text = contractor.phone_number
        emailLabel.text = contractor.email
        websiteLabel.text = contractor.website
        blurbTextView.text = contractor.blurb
    }
}

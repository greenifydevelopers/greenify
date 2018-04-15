//
//  Contractor.swift
//  Greenify
//
//  Created by Ryan Schalk on 4/4/18.
//  Copyright © 2018 Greenify. All rights reserved.
//

import Foundation

struct ContractorResponse: Codable {
    let contractors: [Contractor]
}

struct Contractor: Codable {
    let company_name: String
    let contact_name: String
    let address: String
    let blurb: String
    let phone_number: String
    let email: String
    let website: String
}

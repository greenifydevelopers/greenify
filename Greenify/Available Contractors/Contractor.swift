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
    let companyName: String
    let contactName: String
    let address: String
    let blurb: String
    let contactPhone: String
    let contactEmail: String
    let website: String
}

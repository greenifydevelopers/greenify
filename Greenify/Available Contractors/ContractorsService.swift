//
//  ContractorsService.swift
//  Greenify
//
//  Created by Ryan Schalk on 4/10/18.
//  Copyright © 2018 Greenify. All rights reserved.
//

import Foundation

class ContractorsService {
    func fetch() -> [Contractor] {
        let responseData = mockedNames().data(using: .utf8)
        let decoder = JSONDecoder()
        let decodedResponse = try! decoder.decode(ContractorResponse.self, from: responseData!)
        let contractorArray = decodedResponse.contractors
        return contractorArray
    }
    
    private func mockedNames() -> String {
        return """
        {
        "contractors": [{
        "company_name": "Dovetail Solar & Wind",
        "contact_name": "Julie Julie Jones",
        "address": "",
        "blurb": "Reduce your electric bills and your carbon footprint with a customized renewable energy system from Dovetail Solar and Wind.",
        "phone_number": "513.477.5814",
        "email": "jjones@dovetailsolar.com",
        "website": "www.dovetailsolar.com"
        },
        {
        "company_name": "greenBAU design and build",
        "contact_name": "Tony Beck",
        "address": "2913 Little Dry Run Rd. Cincinnati Ohio 45244",
        "blurb": "Full Service Green Design + Build – With Anthony Beck, a Certified Green Professional, and a member of the NAHB and his partner Steve Hampton an Architect, NCARB, and LEED AP you can be confident in the quality and service you will see at every turn.",
        "phone_number": "513-784-0037",
        "email": "info@greenbau.net",
        "website": "www.greenbau.com,"
        },
        {
        "company_name": "Green Building Consulting",
        "contact_name": "Paul Yankie",
        "address": "1411 Main St. Ste. B, Cincinnati, OH 45202",
        "blurb": "Green Building Consulting provides technical assistance on environmentally-sustainable building and community design, building science, and energy efficiency.",
        "phone_number": "(513) 381-1470",
        "email": "pyankie@greenbldgconsulting.com",
        "website": "www.greenbuildingconsulting.com"
        }]
        }
        """
    }
}

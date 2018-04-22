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
        let decodedResponse = try! JSONDecoder().decode(ContractorResponse.self, from: responseData!)
        return decodedResponse.contractors
    }
    
    private func mockedNames() -> String {
        return """
        {
        "contractors": [{
        "companyName": "Dovetail Solar & Wind",
        "contactName": "Julie Julie Jones",
        "address": "",
        "blurb": "Reduce your electric bills and your carbon footprint with a customized renewable energy system from Dovetail Solar and Wind.",
        "contactPhone": "513.477.5814",
        "contactEmail": "jjones@dovetailsolar.com",
        "website": "www.dovetailsolar.com"
        },
        {
        "companyName": "greenBAU design and build",
        "contactName": "Tony Beck",
        "address": "2913 Little Dry Run Rd. Cincinnati Ohio 45244",
        "blurb": "Full Service Green Design + Build – With Anthony Beck, a Certified Green Professional, and a member of the NAHB and his partner Steve Hampton an Architect, NCARB, and LEED AP you can be confident in the quality and service you will see at every turn.",
        "contactPhone": "513-784-0037",
        "contactEmail": "info@greenbau.net",
        "website": "www.greenbau.com,"
        },
        {
        "companyName": "Green Building Consulting",
        "contactName": "Paul Yankie",
        "address": "1411 Main St. Ste. B, Cincinnati, OH 45202",
        "blurb": "Green Building Consulting provides technical assistance on environmentally-sustainable building and community design, building science, and energy efficiency.",
        "contactPhone": "(513) 381-1470",
        "contactEmail": "pyankie@greenbldgconsulting.com",
        "website": "www.greenbuildingconsulting.com"
        },
        {
        "companyName": "Green Cincinnati Education Advocacy",
        "contactName": "Chuck Lohre",
        "address": "126A West 14th Street, 2nd Floor, Cincinnati, OH 45202",
        "blurb": "Green Cincinnati’s goal is to help promote Green Building and provide the public with the resources needed to advocate for the U.S Green Building Council’s LEED Certification process.",
        "contactPhone": "877-608-1736",
        "contactEmail": "chuck@lohre.com",
        "website": "www.green-cincinnati.com"
        },
        {
        "companyName": "Greener Stock",
        "contactName": "Heather Curless",
        "address": "3528 Columbia Parkway, Cincinnati, OH 45226",
        "blurb": "Building Supply & Heather Curless LEED Accredited Architect – Whether home, office, or factory if you want to see the latest in energy conservation and sustainability you need to stop by Heather Curless’s shop Greener Stock.",
        "contactPhone": "513.323.1262",
        "contactEmail": "heather@greenerstock.com",
        "website": "www.greenerstock.com"
        }]
        }
        """
    }
}

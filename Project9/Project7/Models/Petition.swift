//
//  Petition.swift
//  Project7
//
//  Created by Matteo Spada on 24/05/22.
//

import Foundation


struct Petitions: Codable {
    var results: [Petition]
}

struct Petition: Codable {
    var title: String
    var body: String
    var signatureCount: Int
}


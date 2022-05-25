//
//  Person.swift
//  Project10
//
//  Created by Matteo Spada on 24/05/22.
//

import UIKit

class Person: NSObject, Codable {
    var name: String
    var image: String
    
    init(name: String, image: String) {
        self.name = name
        self.image = image
    }
    
}

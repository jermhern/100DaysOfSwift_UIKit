//
//  Petition.swift
//  Project7
//
//  Created by Jeremy on 6/4/22.
//

import Foundation

// Codable means it is decodable from JSON
struct Petition: Codable {
    var title: String
    var body: String
    var url: String
    var signatureCount: Int
}

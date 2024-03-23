//
//  Character.swift
//  BB Quotes
//
//  Created by Daniel Ezekiel on 3/23/24.
//

import Foundation

struct Character: Decodable {
    let name: String
    let birthday: String
    let occupations: [String]
    let images: [URL]
    let aliases: [String]
    let portrayedBy: String
}

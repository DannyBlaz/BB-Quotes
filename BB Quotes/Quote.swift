//
//  Quote.swift
//  BB Quotes
//
//  Created by Daniel Ezekiel on 3/23/24.
//

import Foundation

struct Quote: Decodable {
    let quote: String
    let character: String
    let production: String
}

//
//  Constants.swift
//  BB Quotes
//
//  Created by Daniel Ezekiel on 3/23/24.
//

import Foundation

extension String {
    var replaceSpaceWithPlus: String {
        self.replacingOccurrences(of: " ", with: "+")
    }
}

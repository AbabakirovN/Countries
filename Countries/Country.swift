//
//  Country.swift
//  Countries
//
//  Created by Nurzhan Ababakirov on 26/5/22.
//

import Foundation

struct CountryName: Codable{
    var common: String
    var official: String
}

struct Country: Codable {
    var name: CountryName
    var flag: String
}

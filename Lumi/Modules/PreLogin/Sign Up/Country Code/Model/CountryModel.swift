//
//  CountryModel.swift
//  Lumi
//
//  Created by Rishabh Sharma on 06/04/22.
//

import Foundation

// MARK: - Country code model
var allCountryDataSet : [NewCountryJson] = []
struct NewCountryJson : Codable {
    var code : String
    var name : String
}

struct CountryCodeValue : Codable {
    var code : String?
}

var countryCodeValue = CountryCodeValue()

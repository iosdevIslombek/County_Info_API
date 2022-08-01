//
//  CountryDM.swift
//  Constraint_Coding
//
//  Created by Islomjon on 30/07/22.
//

import Foundation
import SwiftyJSON

struct CountryDM {
    
    var name: String
    var capital: String
    var flag: String
    var info: CountryInfoDM
    
    init(country: JSON) {
        self.name = country["name"]["common"].stringValue
        self.capital = country["capital"][0].stringValue
        self.flag = country["flag"].stringValue
        self.info = CountryInfoDM(country: country)
    }
    
}

//
//  CountryInfoDM.swift
//  Constraint_Coding
//
//  Created by Islomjon on 30/07/22.
//

import Foundation
import SwiftyJSON

struct CountryInfoDM {
    
    var area: Int
    var population: Int
    var region: String
    var subregion: String
    var languages: String
    var map: String
    
    var areaString: String {
        return "Area: \(area.formatnumber()) km²"
    }
    
    var populationString: String {
        return "Population: \(population.formatnumber())"
    }
    
    var regionString: String {
        return "Region: \(region)"
    }
    
    var subregionString: String {
        return "Subregion: \(subregion)"
    }
    
    var languagesString: String {
        return "Languages: \(languages)"
    }
    
    var mapString: String {
        return "Map: \(map)"
    }
    
    init(country:JSON) {
        self.area = country["area"].intValue
        self.population = country["population"].intValue
        self.region = country["region"].stringValue
        self.subregion = country["subregion"].stringValue
        self.languages = country["languages"].stringValue
        self.map = country["maps"]["googleMaps"].stringValue
    }
}

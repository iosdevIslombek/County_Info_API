//
//  Ex+Integer.swift
//  Constraint_Coding
//
//  Created by Islomjon on 01/08/22.
//

import Foundation

extension Int {
    
    func formatnumber() -> String {
        let formater = NumberFormatter()
        formater.groupingSeparator = "."
        formater.numberStyle = .decimal
        return formater.string(from: NSNumber(value: self))!
    }
    
}

//
//  Double.swift
//  CryptoCurrenciesCodeChallenge
//
//  Created by Lesha on 25.01.2018.
//  Copyright © 2018 Oleksii. All rights reserved.
//

import UIKit

extension String {
    
    func formatAsCurrency(currencyCode: String) -> String {
        let doubleValue = Double(self) ?? 0.0
        let currencyFormatter = NumberFormatter()
        currencyFormatter.numberStyle = .currency
        currencyFormatter.currencyCode = currencyCode
        currencyFormatter.maximumFractionDigits = floor(doubleValue) == doubleValue ? 0 : 2
        
        return currencyFormatter.string(from: NSNumber(value: doubleValue)) ?? ""
    }
    
    func formatAsCurrencyShortName(currencyCode: String) -> String {
        let doubleValue = Double(self) ?? 0.0
        
        let numFormatter = NumberFormatter()
        
        typealias Abbrevation = (threshold:Double, divisor:Double, suffix:String)
        let abbreviations:[Abbrevation] = [(0, 1, ""),
                                           (1000.0, 1000.0, "K"),
                                           (100_000.0, 1_000_000.0, "M"),
                                           (100_000_000.0, 1_000_000_000.0, "B")]
        
        
        let startValue = Double (abs(doubleValue))
        let abbreviation:Abbrevation = {
            var prevAbbreviation = abbreviations[0]
            for tmpAbbreviation in abbreviations {
                if (startValue < tmpAbbreviation.threshold) {
                    break
                }
                prevAbbreviation = tmpAbbreviation
            }
            return prevAbbreviation
        } ()
        
        let value = doubleValue / abbreviation.divisor
        numFormatter.positiveSuffix = abbreviation.suffix
        numFormatter.negativeSuffix = abbreviation.suffix
        numFormatter.allowsFloats = true
        numFormatter.minimumIntegerDigits = 1
        numFormatter.minimumFractionDigits = 0
        numFormatter.maximumFractionDigits = 1
        
        return numFormatter.string(from: NSNumber (value:value))!
    }
}

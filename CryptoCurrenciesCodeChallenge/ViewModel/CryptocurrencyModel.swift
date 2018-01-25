//
//  CryptocurrencyModel.swift
//  CryptoCurrenciesCodeChallenge
//
//  Created by Lesha on 24.01.2018.
//  Copyright © 2018 Oleksii. All rights reserved.
//

import UIKit

struct CryptocurrencyModel {
    let cryptocurrency: Cryptocurrency
    
    init(cryptocurrency: Cryptocurrency) {
        self.cryptocurrency = cryptocurrency
    }
    
    var name: String {
        return "\(cryptocurrency.name)(\(cryptocurrency.symbol))"
    }
    
    var rank: String {
        return "#\(cryptocurrency.rank)"
    }
    
    var marketCapitalization: String {
        // todo put data
        return cryptocurrency.market_cap_usd.formatAsCurrencyShortName(currencyCode: "EUR")
    }
    
    var price: String {
        
        return "Price: " + cryptocurrency.price_usd.formatAsCurrency(currencyCode: "EUR")
    }
    
    var lastUpdate: String {
        guard let timeInterval = Int(cryptocurrency.last_updated) else {
            return ""
        }
        let date = NSDate(timeIntervalSince1970: TimeInterval(timeInterval))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy, HH:mm:ss ZZZZ"
        
        return dateFormatter.string(from: date as Date)
    }
    
    var logoImage: UIImage? {
        return UIImage(named: cryptocurrency.symbol.lowercased())
    }
}

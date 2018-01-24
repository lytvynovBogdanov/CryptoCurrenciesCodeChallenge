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
        return "Market capitalization: ..."
    }
    
    var price: String {
        return "Price: \(cryptocurrency.price_btc)"
    }
    
    var lastUpdate: String {
        // todo correct date view
        return "Last updated: \(cryptocurrency.last_updated)"
    }
    
    var logoImage: UIImage? {
        return UIImage(named: cryptocurrency.symbol)
    }
}

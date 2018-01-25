//
//  DetailTableDataSource.swift
//  CryptoCurrenciesCodeChallenge
//
//  Created by Lesha on 24.01.2018.
//  Copyright © 2018 Oleksii. All rights reserved.
//

import UIKit

class DetailTableDataSource: NSObject, UITableViewDataSource {
    var cryptocurrency: Cryptocurrency?
    
    let cellIdentification = "DetailTableViewCell"
    
    var rows: [String: String] {
        guard let cryptocurrency = cryptocurrency else {
            return [:]
        }
        let model = CryptocurrencyModel(cryptocurrency: cryptocurrency)
        return ["Global rank": cryptocurrency.rank,
                "Last update": model.lastUpdate,
                "Price": String(cryptocurrency.price_usd.formatAsCurrency(currencyCode: "EUR")),
                "1h ∆": cryptocurrency.percent_change_1h,
                "24h ∆": cryptocurrency.day_volume_usd,
                "7 day ∆": cryptocurrency.percent_change_7d,
                "Market capitaliztion": model.marketCapitalization,
                "24h volume": cryptocurrency.day_volume_usd]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentification, for: indexPath)
        cell.textLabel?.text = Array(rows.keys)[indexPath.row]
        cell.detailTextLabel?.text = Array(rows.values)[indexPath.row]
        
        return cell
    }
}

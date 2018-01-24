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
        return ["Global rank": cryptocurrency.rank,
                "Last update": "",
                "Price": String(cryptocurrency.price_btc),
                "1h ∆": "",
                "24h ∆": "",
                "7 day ∆": "",
                "Market capitaliztion": "",
                "24h volume": ""]
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

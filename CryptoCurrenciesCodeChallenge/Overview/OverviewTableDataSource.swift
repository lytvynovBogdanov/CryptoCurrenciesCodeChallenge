//
//  OverviewTableDataSource.swift
//  CryptoCurrenciesCodeChallenge
//
//  Created by Lesha on 24.01.2018.
//  Copyright © 2018 Oleksii. All rights reserved.
//

import UIKit

class OverviewTableDataSource: NSObject, UITableViewDataSource {
    
    var cryptocurrencies = [Cryptocurrency]()
    let cellIdentification = "OverviewTableViewCell"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptocurrencies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentification, for: indexPath) as! OverviewTableViewCell
        let cryptocurrencyModel = CryptocurrencyModel(cryptocurrency: cryptocurrencies[indexPath.row])
        cell.configure(model: cryptocurrencyModel)
        
        return cell
    }
    
}

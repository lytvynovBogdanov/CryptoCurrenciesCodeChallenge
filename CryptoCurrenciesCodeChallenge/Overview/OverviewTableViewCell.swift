//
//  OverviewTableViewCell.swift
//  CryptoCurrenciesCodeChallenge
//
//  Created by Lesha on 24.01.2018.
//  Copyright © 2018 Oleksii. All rights reserved.
//

import UIKit

class OverviewTableViewCell: UITableViewCell {
    
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var marketCapitalizationLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var lastUpdateLabel: UILabel!
    
    func configure(model: CryptocurrencyModel) {
        logoImageView.image = model.logoImage
        numberLabel.text = model.rank
        nameLabel.text = model.name
        marketCapitalizationLabel.text = "Market capitalization: " + model.marketCapitalization
        priceLabel.text = model.price
        lastUpdateLabel.text = "Last updated: " + model.lastUpdate
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

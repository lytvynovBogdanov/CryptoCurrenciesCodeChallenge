//
//  Cryptocurrency.swift
//  CryptoCurrenciesCodeChallenge
//
//  Created by Lesha on 24.01.2018.
//  Copyright © 2018 Oleksii. All rights reserved.
//

import UIKit

struct Cryptocurrency: Codable {
    
    let id: String
    let name: String
    let symbol: String
    let rank: String
    let price_usd: String
    let price_btc: String
    let day_volume_usd: String
    let market_cap_usd: String
    let available_supply: String
    let total_supply: String
    let percent_change_1h: String
    let percent_change_24h: String
    let percent_change_7d: String
    let last_updated: String
    
    private enum CodingKeys: String, CodingKey {
        case id, name, symbol, rank, price_usd, price_btc, market_cap_usd, available_supply, total_supply, percent_change_1h, percent_change_24h, percent_change_7d, last_updated
        case day_volume_usd = "24h_volume_usd"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try values.decodeIfPresent(String.self, forKey: .id) ?? ""
        self.name = try values.decodeIfPresent(String.self, forKey: .name) ?? ""
        self.symbol = try values.decodeIfPresent(String.self, forKey: .symbol) ?? ""
        self.rank = try values.decodeIfPresent(String.self, forKey: .rank) ?? ""
        self.price_usd = try values.decodeIfPresent(String.self, forKey: .price_usd) ?? ""
        self.price_btc = try values.decodeIfPresent(String.self, forKey: .price_btc) ?? ""
        self.day_volume_usd = try values.decodeIfPresent(String.self, forKey: .day_volume_usd) ?? ""
        self.market_cap_usd = try values.decodeIfPresent(String.self, forKey: .market_cap_usd) ?? ""
        self.available_supply = try values.decodeIfPresent(String.self, forKey: .available_supply) ?? ""
        self.total_supply = try values.decodeIfPresent(String.self, forKey: .total_supply) ?? ""
        self.percent_change_1h = try values.decodeIfPresent(String.self, forKey: .percent_change_1h) ?? ""
        self.percent_change_24h = try values.decodeIfPresent(String.self, forKey: .percent_change_24h) ?? ""
        self.percent_change_7d = try values.decodeIfPresent(String.self, forKey: .percent_change_7d) ?? ""
        self.last_updated = try values.decodeIfPresent(String.self, forKey: .last_updated) ?? ""
    }
}

//
//  JSONParser.swift
//  CryptoCurrenciesCodeChallenge
//
//  Created by Lesha on 24.01.2018.
//  Copyright © 2018 Oleksii. All rights reserved.
//

import UIKit

private struct FailableDecodable<Base : Decodable> : Decodable {
    let base: Cryptocurrency?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        self.base = try? container.decode(Cryptocurrency.self)
    }
}

class JSONParser: NSObject {
    static func cryptocurrencies(inputJSON: String) -> [Cryptocurrency] {
        guard let inputData = inputJSON.data(using: .utf8) else { return [] }
        let decoder = JSONDecoder()
        guard let cryptocurrencies = try? decoder.decode([FailableDecodable<Cryptocurrency>].self, from: inputData).map({ $0.base! }) else { return [] }
        dump (cryptocurrencies)
        return cryptocurrencies        
    }
}

//
//  StringJSON.swift
//  CryptoCurrenciesCodeChallenge
//
//  Created by Lesha on 24.01.2018.
//  Copyright © 2018 Oleksii. All rights reserved.
//

import UIKit

class APILoader: NSObject {
    static func stringJSON(url: URL, completionSuccess: @escaping ((String) -> ()), completionError: @escaping ((Error) -> ())) {
        let urlRequest = URLRequest(url: url)
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest, completionHandler: {
            (data, response, error) in
            if let error = error {
                completionError(error)
            }
            if let data = data {
                if let jsonString = String(data: data, encoding: .utf8) {
                    completionSuccess(jsonString)
                }
            }
        })
        task.resume()
    }
}

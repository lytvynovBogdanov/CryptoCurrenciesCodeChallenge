//
//  DetailViewController.swift
//  CryptoCurrenciesCodeChallenge
//
//  Created by Lesha on 24.01.2018.
//  Copyright © 2018 Oleksii. All rights reserved.
//

import UIKit
import SVProgressHUD

class DetailViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    private let tableViewDataSource = DetailTableDataSource()
    var cryptocurrency: Cryptocurrency?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = tableViewDataSource
        tableView.delegate = self
        tableViewDataSource.cryptocurrency = cryptocurrency
        self.updateView()
        registerCell(identifier: tableViewDataSource.cellIdentification)
    }
    
    private func registerCell(identifier: String) {
        let nib = UINib(nibName: identifier, bundle: nil)
        
        tableView.register(nib, forCellReuseIdentifier: identifier)
    }

    private func updateView() {
        nameLabel.text = cryptocurrency?.name
        symbolLabel.text = cryptocurrency?.symbol
        if cryptocurrency?.symbol != nil {
            logoImageView.image = UIImage(named: cryptocurrency!.symbol.lowercased())
        }
        else {
            logoImageView.image = nil
        }
        
        tableView.reloadData()
    }
    
    @IBAction func changedCurrency(_ sender: UISegmentedControl) {
        var currency = COINMARKETCAP_CURRENCY_EUR
        if sender.selectedSegmentIndex == 1 {
            currency = COINMARKETCAP_CURRENCY_USD
        }
        else if sender.selectedSegmentIndex == 2 {
            currency = COINMARKETCAP_CURRENCY_GBP
        }
        else if sender.selectedSegmentIndex == 3 {
            currency = COINMARKETCAP_CURRENCY_RUB
        }
        else if sender.selectedSegmentIndex == 4 {
            currency = COINMARKETCAP_CURRENCY_JPY
        }
        updateData(currency)
    }
    
    private func updateData(_ currency: String) {
        guard let id = cryptocurrency?.id else { return }
        SVProgressHUD.show(withStatus: "Loading...")
        guard let url = URL(string:COINMARKETCAP_PREFIX + id + "/" + currency) else { return }
        APILoader.stringJSON(url: url, completionSuccess: { (stringJSON) in
            let cryptocurrencies = JSONParser.cryptocurrencies(inputJSON: stringJSON)
            guard let value = cryptocurrencies.first else { return }
            self.cryptocurrency = value
            DispatchQueue.main.async{
                self.updateView()
                SVProgressHUD.dismiss()
            }
            
        }) { (error) in
            DispatchQueue.main.async{
                SVProgressHUD.dismiss()
            }
            self.show(error: error)
        }
    }
    
    private func show(error: Error) {
        let alertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        alertController.addAction(alertAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 44.0;
    }
}

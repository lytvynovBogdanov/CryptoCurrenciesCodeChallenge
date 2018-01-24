//
//  OverviewViewController.swift
//  CryptoCurrenciesCodeChallenge
//
//  Created by Lesha on 24.01.2018.
//  Copyright © 2018 Oleksii. All rights reserved.
//

import UIKit
import SVProgressHUD

class OverviewViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    private let tableViewDataSource = OverviewTableDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerCell(identifier: tableViewDataSource.cellIdentification)
        updateData()
        
        tableView.dataSource = tableViewDataSource
        tableView.delegate = self
    }
    
    private func registerCell(identifier: String) {
        let nib = UINib(nibName: identifier, bundle: nil)
        
        tableView.register(nib, forCellReuseIdentifier: identifier)
    }
    
    @IBAction func updatePressed(_ sender: UIBarButtonItem) {
        updateData()
    }
    
    private func updateData() {
        SVProgressHUD.show(withStatus: "Loading...")
        guard let url = URL(string:COINMARKETCAP_PREFIX + COINMARKETCAP_CURRENCY_EUR + COINMARKETCAP_LIMIT_150) else { return }
        APILoader.stringJSON(url: url, completionSuccess: { (stringJSON) in
            self.tableViewDataSource.cryptocurrencies = JSONParser.cryptocurrencies(inputJSON: stringJSON)
            
            DispatchQueue.main.async{
                self.tableView.reloadData()
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
        self.present(alertController, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 150.0;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVC = DetailViewController(nibName: "DetailViewController", bundle: nil)
        detailVC.cryptocurrency = tableViewDataSource.cryptocurrencies[indexPath.row]
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}

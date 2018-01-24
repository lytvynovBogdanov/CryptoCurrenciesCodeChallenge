//
//  DetailViewController.swift
//  CryptoCurrenciesCodeChallenge
//
//  Created by Lesha on 24.01.2018.
//  Copyright © 2018 Oleksii. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var symbolLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    private let tableViewDataSource = DetailTableDataSource()
    var cryptocurrency: Cryptocurrency?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = tableViewDataSource
        tableViewDataSource.cryptocurrency = cryptocurrency
        self.updateView()
        registerCell(identifier: tableViewDataSource.cellIdentification)
    }
    
    private func registerCell(identifier: String) {
        let nib = UINib(nibName: identifier, bundle: nil)
        
        tableView.register(nib, forCellReuseIdentifier: identifier)
    }

    private func updateView() {
        
        if cryptocurrency?.symbol != nil {
            logoImageView.image = UIImage(named: cryptocurrency!.symbol.lowercased())
        }
        else {
            logoImageView.image = nil
        }
        
        tableView.reloadData()
    }
}

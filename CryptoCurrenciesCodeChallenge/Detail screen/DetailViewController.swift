//
//  DetailViewController.swift
//  CryptoCurrenciesCodeChallenge
//
//  Created by Lesha on 24.01.2018.
//  Copyright © 2018 Oleksii. All rights reserved.
//

import UIKit

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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 44.0;
    }
}

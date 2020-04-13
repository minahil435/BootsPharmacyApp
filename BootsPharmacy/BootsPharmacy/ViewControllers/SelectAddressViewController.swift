//
//  SelectAddressViewController.swift
//  BootsPharmacy
//
//  Created by Minahil Shafique on 13/04/2020.
//  Copyright © 2020 Minahil Shafique. All rights reserved.
//

import UIKit

class SelectAddressViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        tableView.reloadData()
    }
    
    private func setupTableView() {
           tableView.separatorStyle = .none
           tableView.backgroundColor = .clear
           tableView.dataSource = self
           tableView.delegate = self
           tableView.estimatedRowHeight = 120
           tableView.rowHeight = UITableView.automaticDimension
           let cell = UINib(nibName: "AddressTableViewCell", bundle: nil)
           self.tableView.register(cell, forCellReuseIdentifier: "AddressTableViewCell")
    }
}

extension SelectAddressViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (MainPresenter.shared.addressArray.count == 0){
            self.dismiss(animated: false, completion: nil)}
        return MainPresenter.shared.addressArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "AddressTableViewCell", for: indexPath) as? AddressTableViewCell
            cell?.addressLabel.text =  MainPresenter.shared.addressArray[indexPath.row]
            return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
          MainPresenter.shared.AppendAnwerToMainArray(CellStruct(statement: (MainPresenter.shared.addressArray[indexPath.row]), isquestion: false))
          self.dismiss(animated: false, completion: nil)
    }
}


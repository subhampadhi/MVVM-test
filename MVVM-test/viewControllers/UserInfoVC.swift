//
//  UserInfoVC.swift
//  MVVM-test
//
//  Created by Subham Padhi on 21/05/19.
//  Copyright © 2019 Subham Padhi. All rights reserved.
//

import Foundation
import UIKit

class UserInfoVC: UserInfoView {
    
    let viewModel = UserViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userTable.dataSource = self
        userTable.delegate = self
        self.viewModel.tableCellTypes.forEach({ $0.registerCell(tableView: self.userTable)})
        setUpViews()
        viewModel.getData(url: AllUrls.getUserInfo.rawValue)
        
        viewModel.reloadData = {
            DispatchQueue.main.async {
                self.viewModel.assignTableViewCells()
                self.userTable.reloadData()
            }
        }
        
        viewModel.moveToNextScreenCompletion = { result in
            let data = result
            let fullInfoVC = FullInfoVC()
            fullInfoVC.data = data
            self.navigationController?.pushViewController(fullInfoVC, animated: true)
        }
    }
}

extension UserInfoVC: UITableViewDelegate {
}

extension UserInfoVC:UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.viewModel.tableCells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellViewModel = self.viewModel.tableCells[indexPath.row]
        return cellViewModel.cellInstantiate(tableView: tableView,indexPath: indexPath)
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cellViewModel = self.viewModel.tableCells[indexPath.row]
        cellViewModel.didSelect(tableView: tableView, indexPath: indexPath)
    }
}


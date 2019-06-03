//
//  UserViewModel.swift
//  MVVM-test
//
//  Created by Subham Padhi on 21/05/19.
//  Copyright © 2019 Subham Padhi. All rights reserved.
//

import Foundation

class UserViewModel {
    
    var reloadData: (() -> ())?
    var results = [Result]()
    var moveToNextScreenCompletion: ((Result) -> ())?
    
    let tableCellTypes: [CellFunctions.Type] = [UserCellViewModel.self]
    
    private(set) var tableCells = [CellFunctions]()
    
    init() {
        self.assignTableViewCells()
    }
    
    func assignTableViewCells() {
        self.tableCells = self.setupTableViewCells()
    }
}

extension UserViewModel {
    
    func setupTableViewCells() -> [CellFunctions] {
        
        var cellViewModels = [CellFunctions]()
        for result in results {
            let userCell = UserCellViewModel(name: result.name?.first ?? "", Age: "\(result.dob?.age ?? 0)", profileImage:result.picture?.medium ?? "")
            userCell.cellSelectedCompletion = { index in
                let data = self.results[index]
                self.moveToNextScreenCompletion?(data)
            }
            cellViewModels.append(userCell)
        }
        return cellViewModels
    }
    
    func getData(url:String) {
        guard let url = NSURL(string : url) else {return}
        URLSession.shared.dataTask(with: url.absoluteURL!) { (data, response
            , error) in
            if let error = error {
                print(error)
            }
            if let response = response {
                print(response)
            }
            guard let data = data else { return }
            do {
                let decoder = JSONDecoder()
                let value = try decoder.decode(UserResponse?.self, from: data)
                self.results = (value?.results)!
                self.reloadData?()
            } catch let err {
                print(err)
            }
            }.resume()
    }
}


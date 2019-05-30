//
//  UserCellViewModel.swift
//  MVVM-test
//
//  Created by Subham Padhi on 28/05/19.
//  Copyright © 2019 Subham Padhi. All rights reserved.
//

import Foundation
import UIKit


class UserCellViewModel {
    
    let name: String
    let Age: String
    let profileImage: String
    var cellSelectedCompletion: ((Int) -> ())?
    
    init(name: String , Age: String ,profileImage:String) {
        self.name = name
        self.Age = Age
        self.profileImage = profileImage
        
    }
}

extension UserCellViewModel: CellFunctions {
    
    static func registerCell(tableView: UITableView) {
        
        tableView.register(UsersCell.self, forCellReuseIdentifier: "usersCell")
    }
    
    func cellInstantiate(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "usersCell", for: indexPath) as! UsersCell
        cell.profileNameLabel.text = name
        cell.profileAge.text = Age
        cell.profileImage.image = UIImage(url: URL(string: profileImage))
        return cell
    }
    
    func didSelect(tableView: UITableView, indexPath: IndexPath) {
        self.cellSelectedCompletion?(indexPath.row)
    }
}

extension UIImage {
    convenience init?(url: URL?) {
        guard let url = url else { return nil }
        
        do {
            let data = try Data(contentsOf: url)
            self.init(data: data)
        } catch {
            print("Cannot load image from url: \(url) with error: \(error)")
            return nil
        }
    }
}

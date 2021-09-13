//
//  LoadUsersViewModel.swift
//  RealmDemo
//
//  Created by 楊朝富 on 2021/9/13.
//

import UIKit
import RealmSwift

class LoadUsersViewModel: NSObject {
    
    var cellViewModels: [LoadUsersCellViewModel] = []
    var onRequestEnd:(() -> Void)?
    
    func getUsers(with name: String = "") {
        let result = DemoDBHandler().loadUsers(name: name)
        cellViewModels.removeAll()
        for each in result {
            cellViewModels.append(LoadUsersCellViewModel(user: each))
        }
        onRequestEnd?()
    }
    
    func deleteUser(at row: Int) {
        DemoDBHandler().deleteUser(user: cellViewModels[row].user)
        cellViewModels.remove(at: row)
    }
    
}

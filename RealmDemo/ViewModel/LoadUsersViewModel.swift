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
    
    func getUsers() {
        let result = DemoDBHandler().loadUsers()
        for each in result {
            cellViewModels.append(LoadUsersCellViewModel(user: each))
        }
        onRequestEnd?()
    }
    
}

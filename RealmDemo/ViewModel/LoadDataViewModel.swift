//
//  LoadDataViewModel.swift
//  RealmDemo
//
//  Created by 楊朝富 on 2021/9/13.
//

import UIKit
import RealmSwift

class LoadDataViewModel: NSObject {
    
    var cellViewModels: [LoadDataCellViewModel] = []
    var onRequestEnd:(() -> Void)?
    
    func getUsers() {
        let result = DemoDBHandler().loadUsers()
        for each in result {
            cellViewModels.append(LoadDataCellViewModel(user: each))
        }
        onRequestEnd?()
    }
    
}

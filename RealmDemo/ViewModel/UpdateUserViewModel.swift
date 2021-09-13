//
//  UpdateUserViewModel.swift
//  RealmDemo
//
//  Created by 楊朝富 on 2021/9/13.
//

import UIKit

class UpdateUserViewModel: NSObject {
    func updateUser(originUser: DemoUser, updateUser: DemoUser) {
        DemoDBHandler().updateUser(originUser: originUser, updateUser: updateUser)
    }
}

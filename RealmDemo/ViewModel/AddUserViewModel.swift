//
//  AddUserViewModel.swift
//  RealmDemo
//
//  Created by 楊朝富 on 2021/9/13.
//

import UIKit

class AddUserViewModel: NSObject {
    func addData(user: DemoUser) {
        DemoDBHandler().addUser(user: user)
    }
}

//
//  AddDataViewModel.swift
//  RealmDemo
//
//  Created by 楊朝富 on 2021/9/13.
//

import UIKit

class AddDataViewModel: NSObject {
    func addData(user: DemoUser) {
        DemoDBHandler().addUser(user: user)
    }
}

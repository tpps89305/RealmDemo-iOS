//
//  LoadUsersCellViewModel.swift
//  RealmDemo
//
//  Created by 楊朝富 on 2021/9/13.
//

import UIKit

class LoadUsersCellViewModel: NSObject {
    var user: DemoUser
    
    init(user: DemoUser) {
        self.user = user
    }
}

//
//  DemoDBHandler.swift
//  RealmDemo
//
//  Created by 楊朝富 on 2021/9/13.
//

import UIKit
import RealmSwift

class DemoDBHandler: NSObject {
    
    let realm = try! Realm()
    
    func addUser(user: DemoUser) {
        try! realm.write {
            realm.add(user)
        }
    }
    
    func loadUsers() -> Results<DemoUser> {
        realm.objects(DemoUser.self)
    }
    
}

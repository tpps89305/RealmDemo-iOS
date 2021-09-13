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
    
    func loadUsers(name: String) -> Results<DemoUser> {
        if name == "" {
            return realm.objects(DemoUser.self)
        } else {
            return realm.objects(DemoUser.self).filter("name CONTAINS '\(name)'")
        }
    }
    
    func updateUser(originUser: DemoUser, updateUser: DemoUser) {
        try! realm.write {
            originUser.name = updateUser.name
            originUser.age = updateUser.age
            originUser.address = updateUser.address
            realm.add(originUser, update: .modified)
        }
    }
    
    func deleteUser(user: DemoUser) {
        try! realm.write {
            realm.delete(user)
        }
    }
    
}

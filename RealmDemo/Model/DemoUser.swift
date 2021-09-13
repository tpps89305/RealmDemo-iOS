//
//  DemoUser.swift
//  RealmDemo
//
//  Created by 楊朝富 on 2021/9/13.
//

import UIKit
import RealmSwift

class DemoUser: Object {
    
    @Persisted var uuid: String = UUID().uuidString
    @Persisted var name: String
    @Persisted var age: Int
    @Persisted var address: String
    
    convenience init(name: String, age: Int, address: String) {
        self.init()
        self.name = name
        self.age = age
        self.address = address
    }
    
    override static func primaryKey() -> String {
        return "uuid"
    }

}

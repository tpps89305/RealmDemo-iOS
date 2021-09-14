//
//  ViewController.swift
//  RealmDemo
//
//  Created by 楊朝富 on 2021/9/13.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let items = ["Catalog.CreateUser".localized, "Catelog.ViewUsers".localized]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HomePageCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            performSegue(withIdentifier: Constant.SegueID.ADD_DATA, sender: nil)
            break
        case 1:
            performSegue(withIdentifier: Constant.SegueID.LOAD_DATA, sender: nil)
            break
        default:
            break
        }
    }
    
}


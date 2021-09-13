//
//  UpdateUserViewController.swift
//  RealmDemo
//
//  Created by 楊朝富 on 2021/9/13.
//

import UIKit

class UpdateUserViewController: UIViewController {

    @IBOutlet weak var fieldName: UITextField!
    @IBOutlet weak var fieldAge: UITextField!
    @IBOutlet weak var fieldAddress: UITextField!
    
    var user: DemoUser!
    private let viewModel = UpdateUserViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        fieldName.text = user.name
        fieldAge.text = String(user.age)
        fieldAddress.text = user.address
    }
    
    @IBAction func updateUser(_ sender: UIButton) {
        let updateUser = DemoUser()
        updateUser.name = fieldName.text ?? ""
        updateUser.age = Int(fieldAge.text ?? "") ?? 0
        updateUser.address = fieldAddress.text ?? ""
        
        viewModel.updateUser(originUser: user, updateUser: updateUser)
        showAlertDialog(title: "更新完畢")
    }
    
    private func showAlertDialog(title: String, message: String = "") {
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "好", style: .default, handler: nil)
        controller.addAction(okAction)
        present(controller, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

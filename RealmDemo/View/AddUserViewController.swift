//
//  AddUserViewController.swift
//  RealmDemo
//
//  Created by 楊朝富 on 2021/9/13.
//

import UIKit

class AddUserViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var fieldName: UITextField!
    @IBOutlet weak var fieldAge: UITextField!
    @IBOutlet weak var fieldAddress: UITextField!
    
    let viewModel = AddUserViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addUser(_ sender: UIButton) {
        let name = fieldName.text ?? ""
        let age = Int(fieldAge.text ?? "") ?? 0
        let address = fieldAddress.text ?? ""
        
        if name == "" || age == 0 || address == "" {
            showAlertDialog(title: "AlertDialog.CreateFail".localized, message: "AlertDialog.PleaseInput".localized)
            return
        }
        
        let user = DemoUser.init(name: name, age: age, address: address)
        viewModel.addData(user: user)
        showAlertDialog(title: "AlertDialog.CreateSuccess".localized)
    }
    
    private func showAlertDialog(title: String, message: String = "") {
        let controller = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Button.OK".localized, style: .default, handler: nil)
        controller.addAction(okAction)
        present(controller, animated: true, completion: nil)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == fieldName {
            fieldAge.becomeFirstResponder()
        } else if textField == fieldAddress {
            fieldAddress.resignFirstResponder()
        }
        return true
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

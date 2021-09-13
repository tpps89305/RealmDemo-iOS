//
//  AddDataViewController.swift
//  RealmDemo
//
//  Created by 楊朝富 on 2021/9/13.
//

import UIKit

class AddDataViewController: UIViewController {

    @IBOutlet weak var fieldName: UITextField!
    @IBOutlet weak var fieldAge: UITextField!
    @IBOutlet weak var fieldAddress: UITextField!
    
    let viewModel = AddDataViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func addUser(_ sender: UIButton) {
        let name = fieldName.text ?? ""
        let age = Int(fieldAge.text ?? "") ?? 0
        let address = fieldAddress.text ?? ""
        
        if name == "" || age == 0 || address == "" {
            showAlertDialog(title: "新增失敗", message: "請填入所有資訊")
            return
        }
        
        let user = DemoUser.init(name: name, age: age, address: address)
        viewModel.addData(user: user)
        showAlertDialog(title: "新增完畢")
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

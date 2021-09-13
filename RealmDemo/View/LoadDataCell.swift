//
//  LoadDataCell.swift
//  RealmDemo
//
//  Created by 楊朝富 on 2021/9/13.
//

import UIKit

class LoadDataCell: UITableViewCell {
    
    @IBOutlet weak var labelName: UILabel!
    @IBOutlet weak var labelAge: UILabel!
    @IBOutlet weak var labelAddress: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setup(viewModel: LoadUsersCellViewModel) {
        labelName.text = viewModel.user.name
        labelAge.text = String("年齡：\(viewModel.user.age)")
        labelAddress.text = String("地址：\(viewModel.user.address)")
    }

}

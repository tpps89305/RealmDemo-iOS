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
        labelAge.text = String(format: "%@%d", "Cell.Age".localized, viewModel.user.age)
        labelAddress.text = String(format: "%@%@", "Cell.Address".localized, viewModel.user.address)
    }

}

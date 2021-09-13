//
//  LoadUsersViewController.swift
//  RealmDemo
//
//  Created by 楊朝富 on 2021/9/13.
//

import UIKit

class LoadUsersViewController: UITableViewController {
    
    private let viewModel = LoadUsersViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        bindViewModel()
        viewModel.getUsers()
    }
    
    private func bindViewModel() {
        viewModel.onRequestEnd = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel.cellViewModels.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "loadDataCell", for: indexPath) as! LoadDataCell
        cell.setup(viewModel: viewModel.cellViewModels[indexPath.row])
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: Constant.SegueID.UPDATE_DATA, sender: self)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == Constant.SegueID.UPDATE_DATA, let destinatineVC = segue.destination as? UpdateUserViewController {
            if let row = tableView.indexPathForSelectedRow?.row {
                destinatineVC.user = viewModel.cellViewModels[row].user
            }
        }
    }

}

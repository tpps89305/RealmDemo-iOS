//
//  LoadUsersViewController.swift
//  RealmDemo
//
//  Created by 楊朝富 on 2021/9/13.
//

import UIKit

class LoadUsersViewController: UITableViewController, UISearchBarDelegate {
    
    let searchController = UISearchController(searchResultsController: nil)
    private let viewModel = LoadUsersViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()

        initViews()
        bindViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.getUsers()
    }
    
    func initViews() {
        navigationItem.searchController = searchController
        navigationItem.searchController?.searchBar.delegate = self
        // Avoid issue of cannot select cell(s)
        searchController.obscuresBackgroundDuringPresentation = false
    }
    
    private func bindViewModel() {
        viewModel.onRequestEnd = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    private func askDelete(indexPath: IndexPath) {
        let controller = UIAlertController(title: "重大操作", message: "確定要刪除 \(viewModel.cellViewModels[indexPath.row].user.name) 嗎？", preferredStyle: .actionSheet)
        let okAction = UIAlertAction(title: "刪除", style: .destructive) { action in
            self.viewModel.deleteUser(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        let cancelAction = UIAlertAction(title: "算了", style: .cancel, handler: nil)
        controller.addAction(okAction)
        controller.addAction(cancelAction)
        present(controller, animated: true, completion: nil)
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
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            askDelete(indexPath: indexPath)
        }
    }
    
    //MARK: UISearchBar Delegate
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.getUsers(with: searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        viewModel.getUsers()
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

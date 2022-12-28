//
//  ViewController.swift
//  ProspectToClientP2C
//
//  Created by Arturo on 12/12/22.
//

import UIKit

class AccountsListView: UIViewController {
    
    var viewModel: AccountsListViewModel = AccountsListViewModel()
    var isShowingClients: Bool = false
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadTableView()
    }
    
    func loadTableView()  {
        tableView.delegate      = self
        tableView.dataSource    = self
        reloadData()
    }
    
    private func reloadData() {
        viewModel.loadAccountsSaved(by: isShowingClients)
        tableView.reloadData()
    }
    
    private func showOptionsForClient(_ client: AccountEntity) {
        var clientForUpdate = client
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let makeProspectAction = UIAlertAction(title: "Make prospect", style: .default) { (action) in
            clientForUpdate.isClient = false
            self.viewModel.saveNewAccount(clientForUpdate)
            self.reloadData()
        }
        
        let removeClient = UIAlertAction(title: "Delete client", style: .destructive) { (action) in
            self.viewModel.removeAccount(idAccount: client.id)
            self.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            print("didPress cancel")
        }
        
        actionSheet.addAction(makeProspectAction)
        actionSheet.addAction(removeClient)
        actionSheet.addAction(cancelAction)
        self.present(actionSheet, animated: true, completion: nil)
    }
}

//MARK: - Tableview delegate & datasource
extension AccountsListView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.accounts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AccountsListItem", for: indexPath) as? AccountsListItem else {
            return UITableViewCell()
        }
        let account: AccountEntity = viewModel.accounts[indexPath.row]
        cell.lblInfo.text = "\(account.accountName) - \(account.ownerName) "
        cell.delegate = self
        cell.setInfoCell(isClient: account.isClient, index: indexPath.row)
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
}

//MARK: - IBActions
extension AccountsListView {
    @IBAction func segmentDidChange(_ sender: UISegmentedControl) {
        isShowingClients = sender.selectedSegmentIndex == 1
        reloadData()
    }
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        var accountNameTextField        = UITextField()
        var accountOwnerNameTextField   = UITextField()
        
        let alert = UIAlertController(title: "Add new account", message: "", preferredStyle: .alert)
        alert.addTextField { alertTextField in
            alertTextField.placeholder = "Account name"
            accountNameTextField = alertTextField
        }
        
        alert.addTextField { alertTextField in
            alertTextField.placeholder  = "Client name"
            accountOwnerNameTextField   = alertTextField
        }
        
        let action = UIAlertAction(title: "Save account", style: .default) { action in
            let newAccount = AccountEntity(id: String.random(),
                                           isClient: false,
                                           accountName: accountNameTextField.text ?? "",
                                           ownerName: accountOwnerNameTextField.text ?? "")
            self.viewModel.saveNewAccount(newAccount)
            self.reloadData()
        }
        
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

//MARK: - Cell protocols
extension AccountsListView: AccountsListItemProtocol {
    func showOptionsForClient(forIndex: Int) {
        self.showOptionsForClient(viewModel.accounts[forIndex])
    }
    
    func makeClient(forIndex: Int) {
        var accountToUpdate: AccountEntity = viewModel.accounts[forIndex]
        accountToUpdate.isClient = true
        self.viewModel.saveNewAccount(accountToUpdate)
        self.reloadData()
    }
}

//
//  AccountsListViewModel.swift
//  ProspectToClientP2C
//
//  Created by Arturo on 27/12/22.
//

import Foundation

protocol AccountsListViewModelInputProtocol {
    func loadAccountsSaved(by isClient: Bool)
    func saveNewAccount(_ newAccount: AccountEntity)
}

protocol AccountsListViewModelOutputProtocol {
    var accounts: [AccountEntity] { get set }
    
}

class AccountsListViewModel: AccountsListViewModelInputProtocol, AccountsListViewModelOutputProtocol {
    private let useCasesMaker: UseCasesMaker = UseCasesMaker()
    var accounts: [AccountEntity] = [AccountEntity]()
    
    func loadAccountsSaved(by isClient: Bool) {
        let readUseCase: ReadAccountsUseCase = useCasesMaker.makeReadAccountsUseCase()
        accounts = readUseCase.readAccounts(by: isClient)
    }
    
    func saveNewAccount(_ newAccount: AccountEntity) {
        let saveUseCase: SaveAccountsUseCase = useCasesMaker.makeSaveAccountsUseCase()
        saveUseCase.save(account: newAccount)
    }
    
    func removeAccount(idAccount: String) {
        let removeUseCase: RemoveAccountsUseCase = useCasesMaker.makeRemoveAccountUseCase()
        removeUseCase.removeAccount(by: idAccount)
    }
    
}

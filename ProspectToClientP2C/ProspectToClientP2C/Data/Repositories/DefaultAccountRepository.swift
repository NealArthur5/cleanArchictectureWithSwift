//
//  DefaultAccountRepository.swift
//  ProspectToClientP2C
//
//  Created by Arturo on 27/12/22.
//

import Foundation

final class DefaultAccountRepository {
    private let accountStorage: AccountsStorage
    
    init(accountStorage: AccountsStorage) {
        self.accountStorage = accountStorage
    }
}

extension DefaultAccountRepository: AccountRepository {
    func removeAccount(by idClient: String) {
        self.accountStorage.removeAccount(by: idClient)
    }
    
    func saveAccount(_ newAccount: AccountEntity) {
        self.accountStorage.saveOrUpdateAccount(newAccount)
    }
    
    func fetchAccountsList(by isClient: Bool) -> [AccountEntity] {
        return self.accountStorage.getAllAccounts().filter({$0.isClient == isClient})
    }
}

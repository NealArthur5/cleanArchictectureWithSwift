//
//  RemoveAccountUseCase.swift
//  ProspectToClientP2C
//
//  Created by Arturo on 28/12/22.
//

import Foundation

protocol RemoveAccountsUseCase {
    func removeAccount(by idClient: String)
}

final class DefaultRemoveAccountsUseCase:RemoveAccountsUseCase {
    private let accountRepository: AccountRepository
    
    init(accountRepository: AccountRepository){
        self.accountRepository = accountRepository
    }
    
    func removeAccount(by idClient: String) {
        self.accountRepository.removeAccount(by: idClient)
    }
}

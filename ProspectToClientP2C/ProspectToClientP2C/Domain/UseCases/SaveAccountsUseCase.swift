//
//  SaveAccountsUseCase.swift
//  ProspectToClientP2C
//
//  Created by Arturo on 27/12/22.
//

import Foundation

protocol SaveAccountsUseCase {
    func save(account: AccountEntity)
}

final class DefaultSaveAccountUseCase: SaveAccountsUseCase {
    private let accountRepository: AccountRepository
    
    init(accountRepository: AccountRepository){
        self.accountRepository = accountRepository
    }
    
    func save(account: AccountEntity) {
        self.accountRepository.saveAccount(account)
    }
}

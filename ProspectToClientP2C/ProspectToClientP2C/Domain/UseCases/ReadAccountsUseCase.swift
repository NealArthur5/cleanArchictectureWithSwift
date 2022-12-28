//
//  ReadAccountsUseCase.swift
//  ProspectToClientP2C
//
//  Created by Arturo on 27/12/22.
//

import Foundation

protocol ReadAccountsUseCase {
    func readAccounts(by isClient: Bool) -> [AccountEntity]
}

final class DefaultReadAccountsUseCase:ReadAccountsUseCase {
    private let accountRepository: AccountRepository
    
    init(accountRepository: AccountRepository){
        self.accountRepository = accountRepository
    }
    
    func readAccounts(by isClient: Bool) -> [AccountEntity] {
        return self.accountRepository.fetchAccountsList(by: isClient)
    }
}

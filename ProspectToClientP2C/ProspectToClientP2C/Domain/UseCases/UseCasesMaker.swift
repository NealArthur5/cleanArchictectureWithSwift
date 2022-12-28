//
//  UseCasesMaker.swift
//  ProspectToClientP2C
//
//  Created by Arturo on 27/12/22.
//

import Foundation

final class UseCasesMaker {
    func makeSaveAccountsUseCase() -> SaveAccountsUseCase {
        return DefaultSaveAccountUseCase(accountRepository: makeRepo())
    }
    
    func makeReadAccountsUseCase() -> ReadAccountsUseCase {
        return DefaultReadAccountsUseCase(accountRepository: makeRepo())
    }
    
    func makeRemoveAccountUseCase() -> RemoveAccountsUseCase{
        return DefaultRemoveAccountsUseCase(accountRepository: makeRepo())
    }
    
    func makeRepo() -> AccountRepository {
        return DefaultAccountRepository(accountStorage: UserDefaultsAccountsStorage())
    }
}


//
//  AccountRepository.swift
//  ProspectToClientP2C
//
//  Created by Arturo on 27/12/22.
//

import Foundation

protocol AccountRepository {
    func fetchAccountsList(by isClient: Bool) -> [AccountEntity]
    func saveAccount(_ newAccount: AccountEntity)
    func removeAccount(by idClient: String)
}

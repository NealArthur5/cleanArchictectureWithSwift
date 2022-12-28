//
//  AccountsStorage.swift
//  ProspectToClientP2C
//
//  Created by Arturo on 27/12/22.
//

import Foundation

protocol AccountsStorage {
    func saveOrUpdateAccount(_ account: AccountEntity)
    func getAllAccounts() -> [AccountEntity]
    func removeAccount(by idAccount: String)
}


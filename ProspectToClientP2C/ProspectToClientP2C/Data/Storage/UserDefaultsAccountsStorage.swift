//
//  UserDefaultsAccountsStorage.swift
//  ProspectToClientP2C
//
//  Created by Arturo on 27/12/22.
//

import Foundation

final class UserDefaultsAccountsStorage {
    private var userDefaults: UserDefaults
    private let entityKey: String = "Accounts"
    
    init(userDefaults: UserDefaults = UserDefaults.standard) {
        self.userDefaults = userDefaults
    }
    
    private func save(accounts: [AccountEntity])  {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(accounts)
            userDefaults.set(data, forKey: entityKey)
        } catch {
            print("error saving accounts")
        }
    }
    
    private func get() -> [AccountEntity] {
        guard let data = UserDefaults.standard.data(forKey: entityKey) else {
            return []
        }
        
        do {
            let decoder = JSONDecoder()
            let accounts = try decoder.decode([AccountEntity].self, from: data)
            return accounts
        } catch {
            print("error reading accounts")
            return []
        }
    }
}

extension UserDefaultsAccountsStorage: AccountsStorage {
    func removeAccount(by idAccount: String) {
        var accountSaved: [AccountEntity] = get()
        accountSaved.removeAll(where: {$0.id == idAccount})
        self.save(accounts: accountSaved)
    }
    
    func saveOrUpdateAccount(_ account: AccountEntity) {
        var accountSaved: [AccountEntity] = get()
        accountSaved.removeAll(where: {$0.id == account.id})
        accountSaved.append(account)
        self.save(accounts: accountSaved)
    }
    
    func getAllAccounts() -> [AccountEntity] {
        return self.get()
    }
}

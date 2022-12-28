//
//  Account.swift
//  ProspectToClientP2C
//
//  Created by Arturo on 27/12/22.
//

import Foundation

struct AccountEntity: Equatable, Identifiable, Codable {
    typealias Identifier = String
    let id: Identifier
    var isClient: Bool
    let accountName: String
    let ownerName: String
}

//
//  AccountsListItem.swift
//  ProspectToClientP2C
//
//  Created by Arturo on 27/12/22.
//

import UIKit

protocol AccountsListItemProtocol {
    func makeClient(forIndex:Int)
    func showOptionsForClient(forIndex:Int)
}
class AccountsListItem: UITableViewCell {
    var delegate: AccountsListItemProtocol?
    var isClient: Bool = false
    var index:Int?
    @IBOutlet weak var lblInfo: UILabel!
    
    @IBOutlet weak var btnMakeClient: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setInfoCell(isClient: Bool, index: Int) {
        self.isClient  = isClient
        self.btnMakeClient.setTitle(isClient ? "Options":"Make client", for: .normal)
        self.index     = index
    }
    
    @IBAction func optionsTapedAction(_ sender: UIButton) {
        if isClient {
            delegate?.showOptionsForClient(forIndex: self.index ?? 0)
        } else {
            delegate?.makeClient(forIndex: self.index ?? 0)
        }
    }

}

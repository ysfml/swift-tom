//
//  TableViewCell.swift
//  TomRoth
//
//  Created by Tom Roth on 05/01/2023.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var nomCadeau: UILabel!
    @IBOutlet weak var prixCadeau: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

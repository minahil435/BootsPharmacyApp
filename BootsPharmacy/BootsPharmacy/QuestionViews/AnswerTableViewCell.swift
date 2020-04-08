//
//  AnswerTableViewCell.swift
//  BootsPharmacy
//
//  Created by Minahil Shafique on 06/04/2020.
//  Copyright © 2020 Minahil Shafique. All rights reserved.
//

import UIKit

class AnswerTableViewCell: UITableViewCell {

    @IBOutlet weak var MainView: UIView!
    @IBOutlet weak var AnswerLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    override func draw(_ rect: CGRect) {
        MainView.layer.cornerRadius = 5
        MainView.layer.maskedCorners = [ .layerMinXMinYCorner,.layerMinXMaxYCorner,.layerMaxXMinYCorner]
    }
    
    func SetupCellView(_ questionText : String){
    AnswerLabel.text = questionText
    }
    
}

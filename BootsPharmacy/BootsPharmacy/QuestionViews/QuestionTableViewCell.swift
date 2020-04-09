//
//  QuestionTableViewCell.swift
//  BootsPharmacy
//
//  Created by Minahil Shafique on 06/04/2020.
//  Copyright © 2020 Minahil Shafique. All rights reserved.
//

import UIKit

class QuestionTableViewCell: UITableViewCell {
    
    @IBOutlet weak var QuestionLabel: UILabel!
    @IBOutlet weak var MainView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func draw(_ rect: CGRect) {
        MainView.clipsToBounds = true
        MainView.layer.cornerRadius = 5
        MainView.layer.maskedCorners = [ .layerMinXMinYCorner,.layerMaxXMaxYCorner,.layerMaxXMinYCorner]
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func SetupCellView(_ questionText : String){
    QuestionLabel.text = questionText
    }
    
}

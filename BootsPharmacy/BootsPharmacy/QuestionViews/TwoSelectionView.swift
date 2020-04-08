//
//  TwoSelectionView.swift
//  BootsPharmacy
//
//  Created by Minahil Shafique on 06/04/2020.
//  Copyright © 2020 Minahil Shafique. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class TwoSelectionView : UIView {

    var contentView : UIView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
    }
    
    func xibSetup() {
        contentView = loadViewFromNib()
        contentView!.frame = bounds
        contentView!.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        addSubview(contentView!)
    }
    
    func loadViewFromNib() -> UIView! {
        
        let bundle = Bundle(for: TwoSelectionView.self)
        let nib = UINib(nibName: "TwoSelectionView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        
        return view
    }
    
    @IBAction func YesButtonPressed(_ sender: UIButton) {
        MainPresenter.shared.AppendAnwerToMainArray( CellStruct(statement: "Yes", isquestion: false))
    }
    
    
    @IBAction func NoButtonPressed(_ sender: UIButton) {
        MainPresenter.shared.AppendAnwerToMainArray( CellStruct(statement: "No", isquestion: false))
    }
}

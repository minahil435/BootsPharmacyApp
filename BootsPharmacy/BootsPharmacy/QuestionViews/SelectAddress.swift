//
//  SelectAddress.swift
//  BootsPharmacy
//
//  Created by Minahil Shafique on 08/04/2020.
//  Copyright © 2020 Minahil Shafique. All rights reserved.
//

import Foundation
import UIKit
protocol SelectAddressDelegate: class {
    func SelectAddressVC()
}

class SelectAddress : UIView {
    
    @IBOutlet weak var selectAddressButton: UIButton!
    var contentView : UIView?
    weak var delegate : SelectAddressDelegate?
        
    override func draw(_ rect: CGRect) {
        selectAddressButton.layer.cornerRadius = 5
    }
    
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
        let bundle = Bundle(for: SelectAddress.self)
        let nib = UINib(nibName: "SelectAddress", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return view
    }
    
    @IBAction func selectButtonPressed(_ sender: UIButton) {
        self.delegate?.SelectAddressVC()
    }
}

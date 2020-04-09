//
//  postalcode.swift
//  BootsPharmacy
//
//  Created by Minahil Shafique on 08/04/2020.
//  Copyright © 2020 Minahil Shafique. All rights reserved.
//

import Foundation
import UIKit

@IBDesignable
class postalCode : UIView {
    
    var contentView : UIView?
    @IBOutlet weak var postcodeTextField: UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        xibSetup()
        setupTextField()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        xibSetup()
        setupTextField()
    }
    
    func xibSetup() {
        contentView = loadViewFromNib()
        contentView!.frame = bounds
        contentView!.autoresizingMask = [UIView.AutoresizingMask.flexibleWidth, UIView.AutoresizingMask.flexibleHeight]
        addSubview(contentView!)
    }
    
    func loadViewFromNib() -> UIView! {
        let bundle = Bundle(for: postalCode.self)
        let nib = UINib(nibName: "postalCode", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return view
    }
    
    func setupTextField(){
        postcodeTextField.delegate = self
    }
    
}

extension postalCode : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        MainPresenter.shared.AppendAnwerToMainArray( CellStruct(statement: textField.text ?? "", isquestion: false))
        textField.text = ""
        textField.resignFirstResponder()
        return true
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        guard let textFieldText = postcodeTextField.text,
            let rangeOfTextToReplace = Range(range, in: textFieldText) else {
                return false
        }
        let substringToReplace = textFieldText[rangeOfTextToReplace]
        let count = textFieldText.count - substringToReplace.count + string.count
        return count < 10
    }

}

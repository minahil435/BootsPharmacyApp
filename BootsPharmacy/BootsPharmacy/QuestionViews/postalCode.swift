//
//  postalcode.swift
//  BootsPharmacy
//
//  Created by Minahil Shafique on 08/04/2020.
//  Copyright © 2020 Minahil Shafique. All rights reserved.
//

import Foundation
import CoreLocation
import UIKit


protocol PostalCodeCallDelegate: class {
    func PostalCodeCallFailure()
}

@IBDesignable
class postalCode : UIView {
    
    var contentView : UIView?
    var text = ""
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var postcodeTextField: UITextField!
    weak var delegate : PostalCodeCallDelegate?
    
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
    
    func getPharmacies (_ latitude:Double ,_ longitude:Double ) {
        let location  = CLLocation.init(latitude: latitude, longitude: longitude)
        
        let radius : Float = 100.0
        ServiceLayer.request(router: Router.getPharmacies(location, radius)) { (result: Result< Response , Error >) in
            switch result {
            case .success(let resposne):
                print(result)
                self.activityIndicator.isHidden = true
                MainPresenter.shared.SetAddressArray(resposne.results)
                MainPresenter.shared.AppendAnwerToMainArray(CellStruct(statement: self.text, isquestion: false))
            case .failure:
                print(result)
                self.delegate?.PostalCodeCallFailure()
                self.activityIndicator.isHidden = true
            }
        }
    }
    
    func getCoordinateFrom(address: String, completion: @escaping(_ coordinate: CLLocationCoordinate2D?, _ error: Error?) -> () ) {
        CLGeocoder().geocodeAddressString(address) { completion($0?.first?.location?.coordinate, $1) }
    }
}

extension postalCode : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        text = textField.text ?? ""
        
        getCoordinateFrom(address: text + " ,london") { coordinate, error in
            guard let coordinate = coordinate, error == nil else {
                self.delegate?.PostalCodeCallFailure()
                return }
            // don't forget to update the UI from the main thread
            self.activityIndicator.isHidden = false
            DispatchQueue.main.async {
                self.getPharmacies (Double(coordinate.latitude),Double(coordinate.longitude))
            }
        }
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

//
//  MainPresenter.swift
//  BootsPharmacy
//
//  Created by Minahil Shafique on 07/04/2020.
//  Copyright © 2020 Minahil Shafique. All rights reserved.
//

import Foundation
import UIKit

struct CellStruct{
    var statement = ""
    var isquestion = false
}

struct MainStruct{
    var question = ""
    var view = UIView()
}

protocol MainArrayUpdateable: class {
    func MainArraysUpdated()
}

class MainPresenter {

    weak var delegate: MainArrayUpdateable?
    static var MainArray = [CellStruct]()
    static var QuestionArrayIndex = 0
    static var shared = MainPresenter()
    var addressArray = [String]()
    
    var DisplayArray = [MainStruct(question: "Have you used this service before", view: TwoSelectionView()),MainStruct(question: "Enter your postcode", view: postalCode()),MainStruct(question: "Select address", view: SelectAddress()),
                        MainStruct(question: "More to come", view: UIView())]
    
    init() {
         MainPresenter.MainArray.append(CellStruct(statement: DisplayArray[MainPresenter.QuestionArrayIndex].question,isquestion: true))
    }

}

extension MainPresenter {
    
   func AppendAnwerToMainArray( _ statement : CellStruct){
        MainPresenter.QuestionArrayIndex += 1
        MainPresenter.MainArray.append(statement)
        MainPresenter.MainArray.append(CellStruct(statement: DisplayArray[MainPresenter.QuestionArrayIndex].question,isquestion: true))
        delegate?.MainArraysUpdated()
    }
    
    func getView() -> MainStruct{
        return DisplayArray[MainPresenter.QuestionArrayIndex]

    }
    
    func DeleteAnswerToMainArray( _ index : Int){
        while (index<MainPresenter.MainArray.count){
            MainPresenter.MainArray.removeLast()
            let (q, _) = index.quotientAndRemainder(dividingBy: 2)
            MainPresenter.QuestionArrayIndex = q
             delegate?.MainArraysUpdated()
            
        }
    }
    
    func SetAddressArray(_ array : [Results]){
        
        for each in array{
          let address = each.addressLine1 + " " + each.addressLine2 + " " + each.addressLine3 + " " + each.addressLine4
            addressArray.append(address)
            
        }
    }
}

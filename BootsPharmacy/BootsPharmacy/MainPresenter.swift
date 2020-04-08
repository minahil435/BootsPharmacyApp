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
    
    var DisplayArray = [MainStruct(question: "Have you used this service before", view: TwoSelectionView()),MainStruct(question: "Enter your postcode", view: postalCode()),MainStruct(question: "Select address", view: SelectAddress())]
    
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
}

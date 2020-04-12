//
//  ViewController.swift
//  BootsPharmacy
//
//  Created by Minahil Shafique on 06/04/2020.
//  Copyright © 2020 Minahil Shafique. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var interactiveView: UIView!
    @IBOutlet var keyboardHeightLayoutConstraint: NSLayoutConstraint?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        MainPresenter.shared.delegate = self
        tableView.reloadData()
       // self.view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        
        NotificationCenter.default.addObserver(self,
        selector: #selector(self.keyboardNotification(notification:)),
        name: UIResponder.keyboardWillChangeFrameNotification,
        object: nil)
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc func keyboardNotification(notification: NSNotification) {
    if let userInfo = notification.userInfo {
        let endFrame = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        let endFrameY = endFrame?.origin.y ?? 0
        let duration:TimeInterval = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0
        let animationCurveRawNSN = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber
        let animationCurveRaw = animationCurveRawNSN?.uintValue ?? UIView.AnimationOptions.curveEaseInOut.rawValue
        let animationCurve:UIView.AnimationOptions = UIView.AnimationOptions(rawValue: animationCurveRaw)
        if endFrameY >= UIScreen.main.bounds.size.height {
            self.keyboardHeightLayoutConstraint?.constant = 0.0
        } else {
            self.keyboardHeightLayoutConstraint?.constant = endFrame?.size.height ?? 0.0
        }
        UIView.animate(withDuration: duration,
                                   delay: TimeInterval(0),
                                   options: animationCurve,
                                   animations: { self.view.layoutIfNeeded() },
                                   completion: nil)
    }
}
    
    override func viewDidAppear(_ animated: Bool) {
        setupView(MainPresenter.shared.getView())
    }
        
    
    func setupView(_ viewName : MainStruct?){
        if let _viewName = viewName{
        let newView = _viewName.view
        interactiveView.addSubview(newView)
        newView.frame = interactiveView.bounds
        }
    }
    
    private func setupTableView() {
        tableView.separatorStyle = .none
        tableView.backgroundColor = .clear
        tableView.dataSource = self
        tableView.delegate = self
        tableView.estimatedRowHeight = 120
        tableView.rowHeight = UITableView.automaticDimension
        let cell = UINib(nibName: "QuestionTableViewCell", bundle: nil)
        self.tableView.register(cell, forCellReuseIdentifier: "QuestionTableViewCell")
        let cell2 = UINib(nibName: "AnswerTableViewCell", bundle: nil)
        self.tableView.register(cell2, forCellReuseIdentifier: "AnswerTableViewCell")
    }
}

extension MainViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MainPresenter.MainArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (MainPresenter.MainArray[indexPath.row].isquestion){
            let cell = tableView.dequeueReusableCell(withIdentifier: "QuestionTableViewCell", for: indexPath) as? QuestionTableViewCell
            cell?.SetupCellView(MainPresenter.MainArray[indexPath.row].statement)
            return cell ?? UITableViewCell()
        }
        else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "AnswerTableViewCell", for: indexPath) as? AnswerTableViewCell
            cell?.SetupCellView(MainPresenter.MainArray[indexPath.row].statement)
            return cell ?? UITableViewCell()
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         if !(MainPresenter.MainArray[indexPath.row].isquestion){
            MainPresenter.shared.DeleteAnswerToMainArray(indexPath.row)}
    }
}

extension MainViewController: MainArrayUpdateable{
    func MainArraysUpdated() {
        tableView.reloadData()
        setupView(MainPresenter.shared.getView())
    }
    
    
}



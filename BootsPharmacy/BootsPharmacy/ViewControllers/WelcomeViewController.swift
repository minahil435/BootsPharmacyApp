//
//  WelcomeViewController.swift
//  BootsPharmacy
//
//  Created by Minahil Shafique on 12/04/2020.
//  Copyright © 2020 Minahil Shafique. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        startButton.layer.cornerRadius = 5
    }
    
    
    @IBAction func StartButtonPressed(_ sender: UIButton) {
        
        let nextViewController = self.storyboard?.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        nextViewController.modalPresentationStyle = .overFullScreen
        self.present(nextViewController, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

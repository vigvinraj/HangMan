//
//  MainMenuVC.swift
//  HangMan
//
//  Created by Vignesh Kumar on 8/8/16.
//  Copyright © 2016 Vignesh Kumar. All rights reserved.
//

import UIKit

class MainMenuVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func singlePlayerBtn(_ sender: AnyObject) {
        
        performSegue(withIdentifier: "Main2Difficulty", sender: nil)
    }

    @IBAction func doublePlayerBtn(_ sender: AnyObject) {
        
        performSegue(withIdentifier: "Menu2GuessWord", sender: nil)
       
    }
}

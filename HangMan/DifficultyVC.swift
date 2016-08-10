//
//  DifficultyVC.swift
//  HangMan
//
//  Created by Vignesh Kumar on 8/8/16.
//  Copyright © 2016 Vignesh Kumar. All rights reserved.
//

import UIKit

class DifficultyVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func backBtn(_ sender: AnyObject) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBAction func easyBtn(_ sender: AnyObject) {
        performSegue(withIdentifier: "Difficulty2Game", sender: nil)
    }
}

//
//  GuessWordVC.swift
//  HangMan
//
//  Created by Vignesh Kumar on 8/8/16.
//  Copyright © 2016 Vignesh Kumar. All rights reserved.
//

import UIKit

class GuessWordVC: UIViewController {

    @IBOutlet weak var guessWordTxtField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       guessWordTxtField.textColor = UIColor.white
        
    }

    @IBAction func backBtn(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func playBtn(_ sender: AnyObject) {
        
        if guessWordTxtField.text != "" {
        
            performSegue(withIdentifier: "GuessWord2Game", sender: nil)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "GuessWord2Game" {
            let gameVC = segue.destination as! GameVC
            gameVC.guessWord = guessWordTxtField.text
            
        }
    }
    
}

//
//  GameVC.swift
//  HangMan
//
//  Created by Vignesh Kumar on 8/8/16.
//  Copyright © 2016 Vignesh Kumar. All rights reserved.
//

import UIKit

class GameVC: UIViewController {

    var guessWord:String!
    
    @IBOutlet weak var guessWordLbl: UILabel!
    @IBOutlet var keyboardBtnCollecton: [UIButton]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createHiddenWord()
      // guessWordLbl.text = guessWord
    }

    @IBAction func closeBtn(_ sender: AnyObject) {
        
        //dismiss(animated: true, completion: nil)
        
        self.view.window?.rootViewController?.dismiss(animated: true, completion: nil)
    }

    
    
    func createHiddenWord(){
        let imageName = "Line.png"
        let image = UIImage(named: imageName)
        var x = 20
        for i in 0  ..< guessWord.characters.count  {
            let imageView = UIImageView(image: image!)
            imageView.frame = CGRect(x: x, y: 450, width: 20, height: 2)
            imageView.tag = i
            view.addSubview(imageView)
            x += 30
            
        }
    }
}

//
//  DoublePlayerViewController.h
//  Hangman
//
//  Created by Vignesh Kumar Rajasekaran on 9/24/15.
//  Copyright (c) 2015 Vignesh Kumar Rajasekaran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DoublePlayerViewController : UIViewController
{
    
}

//outlets

@property (weak, nonatomic) IBOutlet UITextField *guessWordTextField;


//actions
- (IBAction)menuButtonAction:(id)sender;
- (IBAction)playButtonAction:(id)sender;

@end

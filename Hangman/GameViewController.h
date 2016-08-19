//
//  GameViewController.h
//  Hangman
//
//  Created by Vignesh Kumar Rajasekaran on 9/24/15.
//  Copyright (c) 2015 Vignesh Kumar Rajasekaran. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface GameViewController : UIViewController <UIAlertViewDelegate>
{
    int _curGuessCount;
    UIAlertView* _loseAlert;
    UIAlertView* _winAlert;
    NSArray* _titlesArray;
    AVAudioPlayer* _correctSoundPlayer;
    AVAudioPlayer* _wrongSoundPlayer;

}

//properties and outlets
@property (strong, nonatomic) IBOutlet UILabel *guessWordLabel;
@property (strong, nonatomic) IBOutlet UIImageView *hangmanImgView;
@property (weak, nonatomic) IBOutletCollection(UIButton) NSArray *btnCollection;
@property (nonatomic, retain) NSString* guessWord;


//actions
- (IBAction)backButtonAction:(id)sender;
- (IBAction)btnAction:(id)sender;


@end

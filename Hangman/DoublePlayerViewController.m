//
//  DoublePlayerViewController.m
//  Hangman
//
//  Created by Vignesh Kumar Rajasekaran on 9/24/15.
//  Copyright (c) 2015 Vignesh Kumar Rajasekaran. All rights reserved.
//

#import "DoublePlayerViewController.h"
#import "GameViewController.h"

@interface DoublePlayerViewController ()

@end

@implementation DoublePlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [_guessWordTextField becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue is to GameVC
    if ([[segue identifier] isEqualToString:@"doubleplayer2game"])
    {
        // Get reference to GameVC
        GameViewController *gameVC = [segue destinationViewController];
        
        // Pass guess word to GameVC
        gameVC.guessWord = _guessWordTextField.text;
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)menuButtonAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)playButtonAction:(id)sender {
    [self performSegueWithIdentifier:@"doubleplayer2game" sender:self];
}
@end

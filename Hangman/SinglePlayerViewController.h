//
//  SinglePlayerViewController.h
//  Hangman
//
//  Created by Vignesh Kumar Rajasekaran on 10/1/15.
//  Copyright © 2015 Vignesh Kumar Rajasekaran. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SinglePlayerViewController : UITableViewController
{
    //private variables
    NSMutableArray* _dataArray;
    NSString* _guessWord;
    NSManagedObjectContext* _managedObjectContext;
    
}

//outlets and properties



//actions and methods
- (IBAction)menuBtnAction:(id)sender;


@end

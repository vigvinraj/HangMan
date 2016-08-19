//
//  SinglePlayerViewController.m
//  Hangman
//
//  Created by Vignesh Kumar Rajasekaran on 10/1/15.
//  Copyright © 2015 Vignesh Kumar Rajasekaran. All rights reserved.
//

#import "SinglePlayerViewController.h"
#import "AppDelegate.h"
#import "Guessword.h"
#import "GameViewController.h"

@interface SinglePlayerViewController ()

@end

@implementation SinglePlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    _dataArray = [[NSMutableArray alloc] initWithObjects:@"Easy", @"Medium", @"Difficult", nil];
    AppDelegate* appDelegate = [[UIApplication sharedApplication] delegate];
    _managedObjectContext = appDelegate.managedObjectContext;
    
    [self loadWordsIntoDatabase];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"myCell" forIndexPath:indexPath];
    // Configure the cell...
    cell.textLabel.text = [_dataArray objectAtIndex:indexPath.row];
    return cell;
    
}

- (void)tableView:(UITableView * )tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString* selectedCategory = [_dataArray objectAtIndex:indexPath.row];
    _guessWord = [self fetchWordFromCategory:selectedCategory ];
    [self deleteWord:_guessWord];
    [self performSegueWithIdentifier:@"singleplayer2game" sender:self];
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)menuBtnAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSString *)fetchWordFromCategory: (NSString*)categoryname
{
    // Define our table/entity to use
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Guessword" inManagedObjectContext:_managedObjectContext];
    // Setup the fetch request
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"category=%@", categoryname];
    [request setPredicate:predicate];
    // Define how we will sort the records
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"word" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    [request setSortDescriptors:sortDescriptors];
    // Fetch the records and handle an error
    NSError *error;
    NSMutableArray *mutableFetchResults = [[_managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    NSString* retStr = nil;
    if (!mutableFetchResults)
    {
        // Handle the error.
    }
    else
    {
        if([mutableFetchResults count] > 0)
        {
            int indexOfRandomWord = arc4random() % [mutableFetchResults count];
            Guessword *guessWordObj = [mutableFetchResults objectAtIndex:indexOfRandomWord];
            retStr = [NSString stringWithFormat:@"%@",guessWordObj.word];
        }
    }
    return retStr;
}
-(void)addWordWithWord:(NSString *)word category:(NSString *)category
{
    Guessword *guessWordObj = (Guessword *)[NSEntityDescription insertNewObjectForEntityForName:@"Guessword" inManagedObjectContext:_managedObjectContext];
    [guessWordObj setWord:word];
    [guessWordObj setCategory:category];
    NSError *error;
    if(![_managedObjectContext save:&error])
    {
        // Handle the error.
    }
    else
    {
        // Successfully added the record.
    }
}

-(void)deleteWord:(NSString *)wordString
{
    // Define our table/entity to use
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Guessword" inManagedObjectContext:_managedObjectContext];
    // Setup the fetch request
    NSFetchRequest *request = [[NSFetchRequest alloc] init];
    [request setEntity:entity];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"word=%@", wordString];
    [request setPredicate:predicate];
    // Define how we will sort the records
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"word" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObject:sortDescriptor];
    [request setSortDescriptors:sortDescriptors];
    // Fetch the records and handle an error
    NSError *error;
    NSMutableArray *mutableFetchResults = [[_managedObjectContext executeFetchRequest:request error:&error] mutableCopy];
    if(mutableFetchResults.count > 0)
    {
        NSManagedObject *managedObject = [mutableFetchResults objectAtIndex:0];[_managedObjectContext deleteObject:managedObject];
        if (![_managedObjectContext save:&error])
        {
            // Handle Error
        }
    }
}
- (void) loadWordsIntoDatabase
{
    if ([self fetchWordFromCategory:@"Easy"] == nil)
    {
        NSString *easyPath = [[NSBundle mainBundle] pathForResource:@"Easy" ofType:@"plist"];
        NSMutableArray *easyArray = [[NSMutableArray alloc] initWithContentsOfFile:easyPath];
        for (int i=0; i<100; i++)
        {
            NSString* curWord = (NSString *)[easyArray objectAtIndex:i];
            [self addWordWithWord:curWord category:@"Easy"];
        }
        NSString *mediumPath = [[NSBundle mainBundle] pathForResource:@"Medium" ofType:@"plist"];
        NSMutableArray *mediumArray = [[NSMutableArray alloc] initWithContentsOfFile:mediumPath];
        for (int i=0; i<100; i++)
        {
            NSString* curWord = (NSString *)[mediumArray objectAtIndex:i];
            [self addWordWithWord:curWord category:@"Medium"];
        }
        NSString *difficultPath = [[NSBundle mainBundle] pathForResource:@"Hard" ofType:@"plist"];
        NSMutableArray *difficultArray = [[NSMutableArray alloc] initWithContentsOfFile:difficultPath];
        for (int i=0; i<100; i++)
        {
            NSString* curWord = (NSString *)[difficultArray objectAtIndex:i];
            [self addWordWithWord:curWord category:@"Difficult"];
        }
    }
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Make sure your segue is to GameVC
    if ([[segue identifier] isEqualToString:@"singleplayer2game"])
    {
        // Get reference to GameVC
        GameViewController *gameVC = [segue destinationViewController];
        
        // Pass guess word to GameVC
        gameVC.guessWord = _guessWord;
    }
}

@end

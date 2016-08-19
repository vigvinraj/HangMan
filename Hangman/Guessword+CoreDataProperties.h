//
//  Guessword+CoreDataProperties.h
//  Hangman
//
//  Created by Vignesh Kumar Rajasekaran on 10/22/15.
//  Copyright © 2015 Vignesh Kumar Rajasekaran. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "Guessword.h"

NS_ASSUME_NONNULL_BEGIN

@interface Guessword (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *word;
@property (nullable, nonatomic, retain) NSString *category;

@end

NS_ASSUME_NONNULL_END

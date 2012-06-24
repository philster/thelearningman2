//
//  SelectionViewController.h
//  The Learning Man
//
//  Created by Dinesh Garg on 6/9/12.
//  Copyright (c) 2012 _dNESH_04028g_. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LearnViewController.h"
#import "AvatarSelectionController.h"
#import "AppDelegate.h"
#import "GamePlayViewController.h"

@interface SelectionViewController : UIViewController
{
    UIButton *levelOneButton;
    UIButton *levelTwoButton;
    UIButton *levelThreeButton;
    UIButton *learnButton;
    
    UIImage *avatarImage;
    
    LearnViewController *learnView;
    GamePlayViewController *avatarSelection;
    AppDelegate *delegate;
    
}

@property (nonatomic, retain) IBOutlet UIButton *levelOneButton;
@property (nonatomic, retain) IBOutlet UIButton *levelTwoButton;
@property (nonatomic, retain) IBOutlet UIButton *levelThreeButton;
@property (nonatomic, retain) IBOutlet UIButton *learnButton;
@property (nonatomic, retain) IBOutlet LearnViewController *learnView;
@property (nonatomic, retain) IBOutlet GamePlayViewController *avatarSelection;

-(IBAction)levelOneSelected:(id)sender;
-(IBAction)levelTwoSelected:(id)sender;
-(IBAction)levelThreeSelected:(id)sender;
-(IBAction)learnButtonPressed:(id)sender;

@end

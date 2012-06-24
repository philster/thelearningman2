//
//  GamePlayViewController.h
//  The Learning Man
//
//  Created by Dinesh Garg on 6/9/12.
//  Copyright (c) 2012 _dNESH_04028g_. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

#define MAX_STRIKES 3;

@interface GamePlayViewController : UIViewController<UITextFieldDelegate>
{
    
    UIImageView *avatarImage;
    UIButton *hintButton;
    UIButton *trashBinButton;
    UILabel *levelLabel;
    UILabel *wordBackgroundLabel;
    UILabel *scoreLabel;
    
    UIPopoverController *popoverController;
    UIPopoverController *trashPopoverController;
    UITextField *wordTextField;
    
    NSString *checkString;
    
    NSMutableArray *wordsArray;
    NSMutableArray *guess;
    NSMutableArray *keyboardStack;
    
    UILabel *wordLabel;

    
    
    int score;
    int strikes;
    int count;
    int answerCheck;
    
    
    AppDelegate *delegate;
    NSString *wordString; 

}

@property (nonatomic, retain) IBOutlet UIImageView *avatarImage;
@property (nonatomic, retain) IBOutlet UIButton *hintButton;
@property (nonatomic, retain) IBOutlet UIButton *trashBinButton;
@property (nonatomic, retain) IBOutlet UILabel *levelLabel;
@property (nonatomic, retain) IBOutlet UILabel *wordBackgroundLabel;
@property (nonatomic, retain) IBOutlet UIPopoverController *popoverController;
@property (nonatomic, retain) IBOutlet UIPopoverController *trashPopoverController;
@property (nonatomic, retain) IBOutlet UILabel *scoreLabel;
@property (nonatomic, retain) IBOutlet UITextField *wordTextField;
@property (nonatomic, retain) NSString *checkString;
@property (nonatomic, retain) NSMutableArray *wordsArray;
@property (nonatomic, retain) NSMutableArray *guess;
@property (nonatomic, retain) NSMutableArray *keyboardStack;
@property (nonatomic, retain) IBOutlet UILabel *wordLabel;
@property (nonatomic, retain) NSString *wordString;


-(IBAction)hintButtonPressed:(id)sender;
-(IBAction)trashBinButtonPressed:(id)sender;
-(void) createButtons;
-(IBAction)fullscreen:(id)sender;
-(void)createViewForWord;
//+ (NSString *) stringWithUnichar:(unichar) value ;
-(void)checkIncorrectWords;
-(void)wordAnsweredCorrectly;

@end

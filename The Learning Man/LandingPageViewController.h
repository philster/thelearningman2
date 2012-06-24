//
//  LandingPageViewController.h
//  The Learning Man
//
//  Created by Dinesh Garg on 6/9/12.
//  Copyright (c) 2012 _dNESH_04028g_. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LearnViewController.h"
#import "SelectionViewController.h"
#import "AppDelegate.h"

@interface LandingPageViewController : UIViewController{
    
    //UIImage *logoImage;
    //UIImage *avatarImage;
    UIButton *learnButton;
    UIButton *playButton;
    
    SelectionViewController *selectionView;
    LearnViewController *learnView;
    AppDelegate *delegate;
}

//@property (nonatomic, retain) UIImage *logoImage;
//@property (nonatomic, retain) UIImage *avatarImage;
@property (nonatomic, retain) IBOutlet UIButton *learnButton;
@property (nonatomic, retain) IBOutlet UIButton *playButton;
@property (nonatomic, retain) IBOutlet LearnViewController *learnView;
@property (nonatomic, retain) IBOutlet SelectionViewController *selectionView;;

-(IBAction)playButtonPressed:(id)sender;
-(IBAction)learnButtonPressed:(id)sender;

@end

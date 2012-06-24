//
//  AvatarSelectionController.h
//  The Learning Man
//
//  Created by Dinesh Garg on 6/9/12.
//  Copyright (c) 2012 _dNESH_04028g_. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface AvatarSelectionController : UIViewController
{
    
    AppDelegate *delegate;
    
    //UIImageView *avatarImageView;
    UIButton *continueButton;
    

}

@property (nonatomic, retain) IBOutlet UIImageView *avatarImageView;
@property (nonatomic, retain) IBOutlet UIButton *continueButton;

-(IBAction)continueButtonPressed:(id)sender;

@end

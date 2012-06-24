//
//  AvatarSelectionController.m
//  The Learning Man
//
//  Created by Dinesh Garg on 6/9/12.
//  Copyright (c) 2012 _dNESH_04028g_. All rights reserved.
//

#import "AvatarSelectionController.h"
#import "GamePlayViewController.h"

@interface AvatarSelectionController ()

@end

@implementation AvatarSelectionController
@synthesize continueButton;
@synthesize avatarImageView;

-(void)dealloc
{
    [continueButton release];
    [avatarImageView release];
    [super dealloc];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation == UIInterfaceOrientationLandscapeLeft);

}


-(IBAction)continueButtonPressed:(id)sender
{
    
    GamePlayViewController *gameView = [[GamePlayViewController alloc] init];
    
    delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    [delegate.navController pushViewController:gameView animated:YES];
    
}

@end

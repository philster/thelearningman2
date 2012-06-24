//
//  SelectionViewController.m
//  The Learning Man
//
//  Created by Dinesh Garg on 6/9/12.
//  Copyright (c) 2012 _dNESH_04028g_. All rights reserved.
//

#import "SelectionViewController.h"

@interface SelectionViewController ()

@end

@implementation SelectionViewController

@synthesize levelOneButton;
@synthesize levelTwoButton;
@synthesize levelThreeButton;
@synthesize learnButton;
@synthesize learnView;
@synthesize avatarSelection;

-(void)dealloc
{
    
    [levelOneButton release];
    [levelTwoButton release];
    [levelThreeButton release];
    [learnButton release];
    [super dealloc];
    
}

/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}*/

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"landingPageBackGround1.png"]]];


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

-(IBAction)levelOneSelected:(id)sender
{
    
    avatarSelection = [[GamePlayViewController alloc] init];
    [delegate.navController pushViewController:avatarSelection animated:YES];
    [avatarSelection release];
    
}

-(IBAction)levelTwoSelected:(id)sender
{
    // Show View that it is locked
    NSLog(@"Level Two Selected");
}

-(IBAction)levelThreeSelected:(id)sender
{
    // Show View that it is locked
    NSLog(@" Level Three Selected");
}

-(IBAction)learnButtonPressed:(id)sender
{
    learnView = [[LearnViewController alloc] init];
    [delegate.navController pushViewController:learnView animated:YES];
    [learnView release];
}

@end

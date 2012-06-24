//
//  LandingPageViewController.m
//  The Learning Man
//
//  Created by Dinesh Garg on 6/9/12.
//  Copyright (c) 2012 _dNESH_04028g_. All rights reserved.
//

#import "LandingPageViewController.h"

@interface LandingPageViewController ()

@end

@implementation LandingPageViewController
//@synthesize logoImage;
//@synthesize avatarImage;
@synthesize playButton;
@synthesize learnButton;
@synthesize learnView;
@synthesize selectionView;

-(void)dealloc{
    //[logoImage release];
    //[avatarImage release];
    [delegate release];
    [playButton release];
    [learnButton release];
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
    delegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    // Do any additional setup after loading the view from its nib.
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"landingPageBackGround1.png"]]];
    //[playButton setBackgroundImage:[UIImage imageNamed:@"landingPagePlayButton1.png"] forState:UIControlStateNormal];

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

-(IBAction)playButtonPressed:(id)sender
{
    selectionView = [[SelectionViewController alloc] init];
    [delegate.navController pushViewController:selectionView animated:YES];

    //[self.view addSubview:selectionView.view];
    [selectionView release];
    
}

-(IBAction)learnButtonPressed:(id)sender
{
    learnView = [[LearnViewController alloc] init];
    [delegate.navController pushViewController:learnView animated:YES];

   // [self.view addSubview:learnView.view];
    [learnView release];
    
}

@end

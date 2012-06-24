//
//  LearnViewController.m
//  The Learning Man
//
//  Created by Dinesh Garg on 6/9/12.
//  Copyright (c) 2012 _dNESH_04028g_. All rights reserved.
//

#import "LearnViewController.h"

@interface LearnViewController ()

@end

@implementation LearnViewController

@synthesize doneButton;
@synthesize dictionaryTable;

-(void)dealloc
{
    [dictionaryTable release];
    [doneButton release];
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
    
    dictionaryTable.delegate = self;
    dictionaryTable.dataSource = self;
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"landingPageBackGround1.png"]]];
    

    
    /*
    UIImageView *tempImg = [[UIImageView alloc] initWithFrame:CGRectMake(212, 125, 628, 590)];
    [tempImg setImage:[UIImage imageNamed:@"wordBox1.JPG"]];
    dictionaryTable = [[UITableView alloc] initWithFrame:CGRectMake(212, 125, 628, 590) style:UITableViewStylePlain];
    [tempImg addSubview:dictionaryTable];
    [self.view addSubview:tempImg];
    //[dictionaryTable setBackgroundView:tempImg];
     */

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

-(IBAction)doneButtonPressed:(id)sender
{
    //remove from super view
    [delegate.navController popViewControllerAnimated:YES];

    //[self.view removeFromSuperview];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    //return <#number of rows in section#>;
	return 8;
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  	static NSString *CellIdentifier = @"Cell";
	
    NSMutableArray *wordsArray = [[NSMutableArray alloc] initWithObjects:@"Pacing",@"Abstain", @"abscond", @"Lean", @"incubate",@"magnanimity",@"nefarious",@"Pulchritudinous", nil];
    NSMutableArray *guess = [[NSMutableArray alloc] initWithObjects:@"a rate of activity, progress, growth, performance, etc.; tempo.",@"to hold oneself back voluntarily. ",@"to depart in a sudden and secret manner, especially to avoid capture and legal prosecution.",@"to incline or bend from a vertical position.",@"to develop or produce as if by hatching; give form to.",@"generosity and nobility.",@"wicked, evil.",@"beautiful.", nil];

    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
	
		
    //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
   // cell.contentView.text = [wordsArray objectAtIndex:indexPath.row];
    cell.textLabel.text = [wordsArray objectAtIndex:indexPath.row];
    cell.detailTextLabel.text = [guess objectAtIndex:indexPath.row];
	
    // Configure the cell...
	cell.backgroundColor = [UIColor clearColor];
    [wordsArray release];
    [guess release];
    return cell;
}


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@" Row Pressed");
    
}

@end

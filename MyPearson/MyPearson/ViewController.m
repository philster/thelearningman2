//
//  ViewController.m
//  MyPearson
//
//  Created by Phillip Wee on 6/23/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

static NSString *const kMyPearsonAPIKey = @"bd13a41bdeff59d5d56c245adc5a2ffe";

@implementation ViewController

// Pearson code
- (IBAction)searchForEntries
{
    NSString *format = @"json";
    NSString *pattern = @"agog";
    NSString *callback = @"";
    
    NSURL *restURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.pearson.com/longman/dictionary/entry.%@?q=%@&apikey=%@&jsonp=%@", format, pattern, kMyPearsonAPIKey, callback]];
    NSURLRequest *request = [NSURLRequest requestWithURL:restURL];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                               
                               NSString *responseBody = [ [NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                               NSLog(@"Received Response: %@", responseBody);
                               
                               UIAlertView *alertView = [ [UIAlertView alloc] initWithTitle:@"Profiles Response"
                                                                                    message:responseBody
                                                                                   delegate:self
                                                                          cancelButtonTitle:@"Dismiss"
                                                                          otherButtonTitles:nil];
                               [alertView show];
                               
                           }];
}

- (IBAction)viewRandomEntry
{
    NSString *format = @"json";
    NSString *callback = @"";
    
    NSURL *restURL = [NSURL URLWithString:[NSString stringWithFormat:@"https://api.pearson.com/longman/dictionary/entry/random.%@?apikey=%@&jsonp=%@", format, kMyPearsonAPIKey, callback]];
    NSURLRequest *request = [NSURLRequest requestWithURL:restURL];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response, NSData *data, NSError *error) {
                               
                               NSString *responseBody = [ [NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
                               NSLog(@"Received Response: %@", responseBody);
                               
                               UIAlertView *alertView = [ [UIAlertView alloc] initWithTitle:@"Profiles Response"
                                                                                    message:responseBody
                                                                                   delegate:self
                                                                          cancelButtonTitle:@"Dismiss"
                                                                          otherButtonTitles:nil];
                               [alertView show];
                               
                           }];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end

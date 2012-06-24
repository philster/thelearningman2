//
//  LearnViewController.h
//  The Learning Man
//
//  Created by Dinesh Garg on 6/9/12.
//  Copyright (c) 2012 _dNESH_04028g_. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface LearnViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>{
    
    UIButton *doneButton;
    AppDelegate *delegate;
    UITableView *dictionaryTable;
}

@property (nonatomic, retain) IBOutlet UIButton *doneButton;

-(IBAction)doneButtonPressed:(id)sender;
@property (nonatomic, retain) IBOutlet UITableView *dictionaryTable;

@end

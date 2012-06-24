//
//  AppDelegate.h
//  The Learning Man
//
//  Created by Dinesh Garg on 6/9/12.
//  Copyright (c) 2012 _dNESH_04028g_. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LandingPageViewController;
//@class SelectionViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>{
    
    AppDelegate *delegate;
    UINavigationController *navController;
}

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) LandingPageViewController *viewController;
//@property (nonatomic, retain) AppDelegate *delegate;
@property (nonatomic, retain) UINavigationController *navController;



@end

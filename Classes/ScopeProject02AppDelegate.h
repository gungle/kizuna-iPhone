//-------------------------------------------------------------
//
//  ScopeProject02AppDelegate.h
//  ScopeProject02
//
//  Created by YOSHIDA Hiroyuki on 09/11/17.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//
//-------------------------------------------------------------

@interface ScopeProject02AppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;
//	UIViewController *socialViewController;
	
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;
//@property (nonatomic, retain) IBOutlet UIViewController *socialViewController;

@end


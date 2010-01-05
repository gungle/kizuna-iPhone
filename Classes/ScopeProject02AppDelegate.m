//-------------------------------------------------------------
//
//  ScopeProject02AppDelegate.m
//  ScopeProject02
//
//  Created by YOSHIDA Hiroyuki on 09/11/17.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//
//-------------------------------------------------------------

#import "ScopeProject02AppDelegate.h"
#import "RootViewController.h"


@implementation ScopeProject02AppDelegate

@synthesize window;
@synthesize navigationController;

//@synthesize socialViewController;

#pragma mark -
#pragma mark Application lifecycle

- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
	
	[window addSubview:[navigationController view]];
    [window makeKeyAndVisible];
	
	// 追加
//	SecondViewController *secondController = [[[SecondViewController alloc] initWithNibName:nil bundle:nil] autorelease]:
//	[navigationController pushViewController:secondController animated:NO];
}


- (void)applicationWillTerminate:(UIApplication *)application {
	// Save data if appropriate
}


#pragma mark -
#pragma mark Memory management

- (void)dealloc {
	[navigationController release];
	[window release];
	[super dealloc];
}


@end


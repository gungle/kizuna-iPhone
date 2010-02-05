//
//  CommonViewController.m
//  SCOPEProject
//
//  Created by YOSHIDA Hiroyuki on 09/12/16.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "CommonViewController.h"
#import "SCOPEProjectAppDelegate.h"
#import "PropertiesUtil.h"


@implementation CommonViewController

@synthesize myGroupId;
@synthesize myUserId;
@synthesize userId;

- (void)viewDidLoad {
	[super viewDidLoad];
	SCOPEProjectAppDelegate *scopeDelegate = (SCOPEProjectAppDelegate *)[[UIApplication sharedApplication] delegate];
	myGroupId = [[NSString alloc]initWithFormat:scopeDelegate.groupId];
	myUserId  = [[NSString alloc]initWithFormat:scopeDelegate.userId];
	NSLog(@"---- > [my group id] = %@", myGroupId);
	NSLog(@"---- > [my user  id] = %@", myUserId);
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (NSString *)getMyTabBarTitle {
	// "Tweet", "Status", "Map", "Report"
	SCOPEProjectAppDelegate *scopeDelegate = (SCOPEProjectAppDelegate *)[[UIApplication sharedApplication] delegate];
	return scopeDelegate.tabBarController.selectedViewController.title;
}

- (NSString *)getProperties:(NSString *)key{
	return [PropertiesUtil getProperties:key];
}

- (NSString *)getApplicationProperties:(NSString *)key{
	NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
	return [userDefaults stringForKey:key];
}

// OK,CANCEL確認用AlertView表示
- (void)confirmView:(NSString *)title message:(NSString *)message cancelBtnName:(NSString *)cancelBtnName okBtnName:(NSString *)okBtnName {
	UIAlertView *alert = [[UIAlertView alloc]  
						  initWithTitle:title  
						  message:message
						  delegate:self
						  cancelButtonTitle:cancelBtnName		// cancel = 0
						  otherButtonTitles:okBtnName, nil];	// ok = 1
	[alert show];  
	[alert release];	
}

// OK確認用AlertView表示
- (void)alertView:(NSString *)title message:(NSString *)message okBtnName:(NSString *)okBtnName {
	UIAlertView *alert = [[UIAlertView alloc]  
						  initWithTitle:title  
						  message:message
						  delegate:self
						  cancelButtonTitle:nil					// cancel設定しない 
						  otherButtonTitles:okBtnName, nil];	// ok = 0
	[alert show];  
	[alert release];	
}

// 確認用AlertViewの返却判定
// 現在位置取得確認結果
// 個々のビューコントローラでオーバーライドしてください。
- (void)alertView:(UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	// confirmの場合
	// alertView.numberOfButtons > 1
	// buttonIndex = 0 → CANCEL
	// buttonIndex = 1 → OK
	
	// alertの場合
	// alertView.numberOfButtons = 1
	// buttonIndex = 0 → OK
}

- (void)dealloc {
	[myGroupId release];
	[myUserId  release];
	[userId    release];
    [super     dealloc];
}

@end

//
//  SCOPEProjectAppDelegate.m
//  SCOPEProject
//
//  Created by YOSHIDA Hiroyuki on 09/12/04.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "SCOPEProjectAppDelegate.h"
#import "TweetViewController.h"
#import "StatusViewController.h"
#import "MapViewController.h"

#import "PropertiesUtil.h"
#import "LoginXMLParser.h"


@implementation SCOPEProjectAppDelegate

@synthesize window;
@synthesize tabBarController;
@synthesize tweetNaviController;
@synthesize statusNaviController;
@synthesize mapNaviController;
@synthesize reportNaviController;
@synthesize userListNaviController;

@synthesize loginId;
@synthesize groupId;
@synthesize userId;


- (void)applicationDidFinishLaunching:(UIApplication *)application {

    // ログイン認証
	// Setting Bundle読み込み
	NSError *parseError = nil;

//	LoginXMLParser *loginXmlParser = [[LoginXMLParser alloc] init];
//	[loginXmlParser authenticate];

	NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];

	// ログインID、パスワード取得
	loginId = [userDefaults stringForKey:@"login_id_preference"];
	NSString *password = [userDefaults stringForKey:@"password_preference"];
	NSLog(@"ログインID　= %@",loginId);
	NSLog(@"パスワード = %@",password);

	// indicator visible
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;

	// グループID、ユーザID取得・設定
	LoginXMLParser *loginXmlParser = [[LoginXMLParser alloc] init];
	NSString *url = [[NSString alloc]initWithFormat:@"%@%@?login=%@&password=%@",
													[PropertiesUtil getProperties:@"SERVER"], 
													[PropertiesUtil getProperties:@"API_KEY_LOGIN"],
													loginId,
													password];
	
	[loginXmlParser parseXMLFileAtURL:[NSURL URLWithString:url] parseError:&parseError];
	
	self.groupId = [loginXmlParser groupId];
	self.userId  = [loginXmlParser userId];
	NSLog(@"結果　　　　　= %@",[loginXmlParser result]);
	NSLog(@"メッセージ　 = %@",[loginXmlParser message]);
	NSLog(@"グループID　= %@",self.groupId);
	NSLog(@"ユーザID　 = %@",self.userId);
	
	// Add the tab bar controller's current view as a subview of the window
	[tabBarController setViewControllers:[NSArray arrayWithObjects:tweetNaviController, statusNaviController, mapNaviController, reportNaviController, userListNaviController, nil] animated:NO];
	[window addSubview:tabBarController.view];

	[password release];
	[loginXmlParser release];
	
	// indicator invisible
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}


/*
// Optional UITabBarControllerDelegate method
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
}
*/

/*
// Optional UITabBarControllerDelegate method
- (void)tabBarController:(UITabBarController *)tabBarController didEndCustomizingViewControllers:(NSArray *)viewControllers changed:(BOOL)changed {
}
*/


- (void)dealloc {
    [tabBarController     release];
    [tweetNaviController  release];
    [statusNaviController release];
    [mapNaviController    release];
	[reportNaviController release];
	[userListNaviController release];
	[loginId              release];
	[groupId              release];
	[userId               release];
    [window               release];
    [super                dealloc];
}

@end


//
//  SCOPEProjectAppDelegate.h
//  SCOPEProject
//
//  Created by YOSHIDA Hiroyuki on 09/12/04.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCOPEProjectAppDelegate : NSObject <UIApplicationDelegate, UITabBarControllerDelegate> {
    UIWindow *window;
    UITabBarController *tabBarController;
	UINavigationController *tweetNaviController;
	UINavigationController *statusNaviController;
	UINavigationController *mapNaviController;
	UINavigationController *reportNaviController;
	UINavigationController *userListNaviController;
	
	NSString *loginId;		 // ログインID
	NSString *groupId;		 // グループID
	NSString *userId;		 // ユーザID
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UITabBarController *tabBarController;
@property (nonatomic, retain) IBOutlet UINavigationController *tweetNaviController;
@property (nonatomic, retain) IBOutlet UINavigationController *statusNaviController;
@property (nonatomic, retain) IBOutlet UINavigationController *mapNaviController;
@property (nonatomic, retain) IBOutlet UINavigationController *reportNaviController;
@property (nonatomic, retain) IBOutlet UINavigationController *userListNaviController;

@property (nonatomic, retain) NSString *loginId;
@property (nonatomic, retain) NSString *groupId;
@property (nonatomic, retain) NSString *userId;

@end

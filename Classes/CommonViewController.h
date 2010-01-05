//
//  CommonViewController.h
//  SCOPEProject
//
//  Created by ハイパー研 on 09/12/16.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//


@interface CommonViewController : UIViewController {
	NSString *myGroupId;
	NSString *myUserId;
	NSString *userId;
}

@property (nonatomic, retain) NSString *myGroupId;
@property (nonatomic, retain) NSString *myUserId;
@property (nonatomic, retain) NSString *userId;

- (NSString *)getProperties:(NSString *)key;
- (NSString *)getApplicationProperties:(NSString *)key;
- (NSString *)getMyTabBarTitle;

- (void)confirmView:(NSString *)title message:(NSString *)message cancelBtnName:(NSString *)cancelBtnName okBtnName:(NSString *)okBtnName;
- (void)alertView:(NSString *)title message:(NSString *)message okBtnName:(NSString *)okBtnName;
@end

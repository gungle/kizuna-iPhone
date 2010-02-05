//
//  LocationViewController.h
//  SCOPEProject
//
//  Created by YOSHIDA Hiroyuki on 09/12/17.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "CommonViewController.h"
#import <CoreLocation/CoreLocation.h>

@interface LocationViewController : CommonViewController <CLLocationManagerDelegate> {
	CLLocationManager      *locationManager;	// 現在地情報取得
	CLLocationCoordinate2D location;	
}

@property (nonatomic, retain) CLLocationManager *locationManager;

// GPS現在位置取得
- (void)getGpsLocation;
// 現在位置取得確認
- (void)confirmGetLocation;

@end

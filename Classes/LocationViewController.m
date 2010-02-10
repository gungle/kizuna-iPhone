//
//  LocationViewController.m
//  SCOPEProject
//
//  Created by YOSHIDA Hiroyuki on 09/12/17.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "LocationViewController.h"

@implementation LocationViewController

@synthesize locationManager;

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[locationManager release];
    [super dealloc];
}

// 現在位置取得確認
- (void)confirmGetLocation {
	// 現在位置取得確認
	[self confirmView:@"現在位置取得" 
					 message:@"現在の位置情報を利用します。\nよろしいですか？" 
			   cancelBtnName:@"許可しない"
				   okBtnName:@"OK"];
}


// GPS現在位置取得
- (void)getGpsLocation{
	// 現在位置取得
	// CLLocationManagerのインスタンスを作成
	locationManager = [[CLLocationManager alloc] init];
	
	if ([locationManager locationServicesEnabled]) {
		// ロケーションサービスが利用できる場合
//		NSLog(@"----- > ロケーションサービス利用");
		locationManager.delegate = self;
		locationManager.desiredAccuracy = kCLLocationAccuracyBest; // 位置測定の望みの精度を設定
		locationManager.distanceFilter = kCLDistanceFilterNone; // 位置情報更新の目安距離
		// 現在地情報受信開始
		[locationManager startUpdatingLocation];		
	} else {
		// ロケーションサービスが利用できない場合
//		NSLog(@"----- > ロケーションサービス利用不可");
	}
}

// 現在位置取得成功時の処理
- (void)locationManager:(CLLocationManager *)manager
	didUpdateToLocation:(CLLocation *)newLocation
		   fromLocation:(CLLocation *)oldLocation
{
}

// 現在位置取得失敗時の処理
- (void)locationManager:(CLLocationManager *)manager
	   didFailWithError:(NSError *)error
{
	[self alertView:@"現在取得エラー" message:@"位置情報が取得できませんでした。" okBtnName:@"OK"];
}

@end

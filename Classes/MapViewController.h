//
//  MapViewController.h
//  SCOPEProject
//
//  Created by YOSHIDA Hiroyuki on 09/12/01.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "LocationViewController.h"

@interface MapViewController : LocationViewController <MKMapViewDelegate> {
	MKMapView              *mkMapView;
	NSMutableArray         *mapItems;
	bool                   locationFlag;
}

@property (nonatomic, retain) IBOutlet MKMapView *mkMapView;

// 更新
- (void)reload:(id)sender;
// マップ表示
- (void)showMap;

// 現在位置取得
- (void)getLocation;

// 周辺情報取得(API取得)
- (void)getNeighborhoodInfo;

// マップ情報設定
- (void)setMapViewAnnotation;

@end

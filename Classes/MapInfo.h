//
//  MapInfo.h
//  ScopeProject02
//
//  Created by ハイパー研 on 09/12/02.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>


@interface MapInfo : NSObject<MKAnnotation> {
	NSString *mapId;						// マップID
	NSString *groupId;						// グループID
	NSString *posTitle;						// タイトル
	NSString *posExplain;					// 説明
	NSString *posKind;						// 種別
	NSString *posLat;						// 現在位置　緯度
	NSString *posLon;						// 現在位置　経度	
	NSString *picturePath;					// 画像パス
	NSString *createdAt;					// 登録日時
	NSString *updatedAt;					// 最終更新日時
	CLLocationCoordinate2D coordinate;		// 緯度／経度
}

@property (nonatomic, retain) NSString *mapId;
@property (nonatomic, retain) NSString *groupId;
@property (nonatomic, retain) NSString *posTitle;
@property (nonatomic, retain) NSString *posExplain;
@property (nonatomic, retain) NSString *posKind;
@property (nonatomic, retain) NSString *posLat;
@property (nonatomic, retain) NSString *posLon;
@property (nonatomic, retain) NSString *picturePath;
@property (nonatomic, retain) NSString *createdAt;
@property (nonatomic, retain) NSString *updatedAt;

-(void)setCoordinate;
-(void)setCoordinate:(CLLocationCoordinate2D)coordinateVal;

@end

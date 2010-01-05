//
//  TweetInfo.h
//  Cells2
//
//  Created by 菊池　達哉 on 09/12/16.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface TweetInfo : NSObject {
	NSString *tweetId;			// 識別ID
	NSString *groupId;			// グループID
	NSString *parentId;			// つぶやき親ID
	NSString *userId;			// ユーザID
	NSString *fullName;			// 本名
	NSString *iconPath;			// アイコン (URL)
	NSString *tweet;			// つぶやき
	NSString *tweetLat;			// 位置情報 緯度
	NSString *tweetLon;			// 位置情報 経度
	NSString *picturePath;		// 写真へのPATH (URL)
	NSString *createdAt;		// 作成日時
	NSString *updatedAt;		// 最終更新日時
}

@property (nonatomic, retain) NSString *tweetId;
@property (nonatomic, retain) NSString *groupId;
@property (nonatomic, retain) NSString *parentId;
@property (nonatomic, retain) NSString *userId;
@property (nonatomic, retain) NSString *fullName;
@property (nonatomic, retain) NSString *iconPath;
@property (nonatomic, retain) NSString *tweet;
@property (nonatomic, retain) NSString *tweetLat;	
@property (nonatomic, retain) NSString *tweetLon;
@property (nonatomic, retain) NSString *picturePath;
@property (nonatomic, retain) NSString *createdAt;
@property (nonatomic, retain) NSString *updatedAt;

@end

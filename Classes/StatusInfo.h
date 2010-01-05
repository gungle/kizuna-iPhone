//-------------------------------------------------------------
//
//  StatusInfo.h
//  ScopeProject02
//
//  Created by yoshida on 09/11/20.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//
//-------------------------------------------------------------

#import <Foundation/Foundation.h>


@interface StatusInfo : NSObject {
	NSString *groupId;			// グループID
	NSString *userId;			// ユーザID
	NSString *fullName;			// ユーザ名
	NSString *fullNameKana;		// ユーザ名カナ
	NSString *status;			// 現在の状況
	NSString *position;			// 立場
	NSString *note;				// 追加情報
	NSString *nowLat;			// 現在位置　緯度
	NSString *nowLon;			// 現在位置　経度
	NSString *createdAt;		// 登録日時
	NSString *updatedAt;		// 最終更新日時
	NSString *iconPath;			// アイコンパス
}

@property (nonatomic, retain) NSString *groupId;
@property (nonatomic, retain) NSString *userId;
@property (nonatomic, retain) NSString *fullName;
@property (nonatomic, retain) NSString *fullNameKana;
@property (nonatomic, retain) NSString *status;
@property (nonatomic, retain) NSString *position;
@property (nonatomic, retain) NSString *note;
@property (nonatomic, retain) NSString *nowLat;
@property (nonatomic, retain) NSString *nowLon;
@property (nonatomic, retain) NSString *createdAt;
@property (nonatomic, retain) NSString *updatedAt;
@property (nonatomic, retain) NSString *iconPath;

@end

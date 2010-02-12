//
//  UserInfo.h
//  SCOPEProject
//
//  Created by YOSHIDA Hiroyuki on 09/12/18.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface UserInfo : NSObject {
	NSString *groupId;			// グループID
	NSString *familyId;			// 家族ID
	NSString *userId;			// ユーザID
	NSString *fullName;			// ユーザ名
	NSString *fullNameKana;		// ユーザ名カナ
	NSString *address;			// 住所
	NSString *birthday;			// 誕生日
	NSString *sex;				// 性別
	NSString *blood;			// 血液型
	NSString *tel;				// 電話番号
	NSString *mail;				// メールアドレス
	NSString *job;				// 職業
	NSString *goodField;		// 得意分野
	NSString *medicalHistory;	// 既往歴
	NSString *createdAt;		// 登録日時
	NSString *updatedAt;		// 最終更新日時
	NSString *iconPath;			// アイコンパス
	NSMutableData *imageData;
	
}

@property (nonatomic, retain) NSString *groupId;
@property (nonatomic, retain) NSString *familyId;
@property (nonatomic, retain) NSString *userId;
@property (nonatomic, retain) NSString *fullName;
@property (nonatomic, retain) NSString *fullNameKana;
@property (nonatomic, retain) NSString *address;
@property (nonatomic, retain) NSString *birthday;
@property (nonatomic, retain) NSString *sex;
@property (nonatomic, retain) NSString *blood;
@property (nonatomic, retain) NSString *tel;
@property (nonatomic, retain) NSString *mail;
@property (nonatomic, retain) NSString *job;
@property (nonatomic, retain) NSString *goodField;
@property (nonatomic, retain) NSString *medicalHistory;
@property (nonatomic, retain) NSString *createdAt;
@property (nonatomic, retain) NSString *updatedAt;
@property (nonatomic, retain) NSString *iconPath;
@property (nonatomic, retain) NSMutableData *imageData;

@end

//
//  UserListViewCell.h
//  SCOPEProject
//
//  Created by YOSHIDA Hiroyuki on 10/01/05.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonImageView.h"

@interface UserListViewCell : UITableViewCell {
	UILabel         *fullName;      // 氏名
	UILabel         *fullNameKana;  // 氏名カナ
	UILabel         *address;		// 住所
	CommonImageView *userIcon;      // アイコン
}

@property (nonatomic, retain) IBOutlet UILabel         *fullName;
@property (nonatomic, retain) IBOutlet UILabel         *fullNameKana;
@property (nonatomic, retain) IBOutlet UILabel         *address;
@property (nonatomic, retain) IBOutlet CommonImageView *userIcon;

@end

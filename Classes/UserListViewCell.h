//
//  UserListViewCell.h
//  SCOPEProject
//
//  Created by ハイパー研 on 10/01/05.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonImageView.h"

@interface UserListViewCell : UITableViewCell {
	UILabel         *fullName;      // 氏名
	UILabel         *fullNameKana;  // 氏名カナ
	UILabel         *sex;           // 性別
	UILabel         *blood;         // 血液型
	UILabel         *updatedAt;     // 更新日時
	CommonImageView *userIcon;      // アイコン
}

@property (nonatomic, retain) IBOutlet UILabel         *fullName;
@property (nonatomic, retain) IBOutlet UILabel         *fullNameKana;
@property (nonatomic, retain) IBOutlet UILabel         *sex;
@property (nonatomic, retain) IBOutlet UILabel         *blood;
@property (nonatomic, retain) IBOutlet UILabel         *updatedAt;
@property (nonatomic, retain) IBOutlet CommonImageView *userIcon;

@end

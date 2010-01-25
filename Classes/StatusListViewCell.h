//-------------------------------------------------------------
//
//  StatusListViewCell.h
//  ScopeProject
//
//  Created by YOSHIDA Hiroyuki on 09/11/25.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//
//-------------------------------------------------------------

#import <UIKit/UIKit.h>
#import "CommonImageView.h"


@interface StatusListViewCell : UITableViewCell {
	UILabel     *fullName;    // ユーザ名
	UILabel     *status;      // 現在の状況
	UILabel     *position;    // 立場
	UILabel     *updatedAt;   // 更新日時
	CommonImageView *userIcon;    // アイコン
}

@property (nonatomic, retain) IBOutlet UILabel     *fullName;
@property (nonatomic, retain) IBOutlet UILabel     *status;
@property (nonatomic, retain) IBOutlet UILabel     *position;
@property (nonatomic, retain) IBOutlet UILabel     *updatedAt;
@property (nonatomic, retain) IBOutlet CommonImageView *userIcon;

@end

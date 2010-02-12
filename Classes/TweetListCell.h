//
//  TweetListCell.h
//  
//
//  Created by 菊池　達哉 on 09/12/16.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonImageView.h"


@interface TweetListCell : UITableViewCell {
	IBOutlet UILabel *fullName;				// 本名
	IBOutlet UILabel *tweet;				// つぶやき
	IBOutlet UILabel *tweetLat;				// 位置情報 緯度
	IBOutlet UILabel *tweetLon;				// 位置情報 経度
	IBOutlet UILabel *updatedAt;			// 最終更新日時
//	IBOutlet UIImageView *picturePath;		// 写真へのPATH (URL)
//	IBOutlet UIImageView *iconPath;			// アイコン (URL)
	IBOutlet CommonImageView *userIcon;    // アイコン
}
@property (nonatomic, retain) UILabel *fullName;
@property (nonatomic, retain) UILabel *tweet;
@property (nonatomic, retain) UILabel *tweetLat;
@property (nonatomic, retain) UILabel *tweetLon;
@property (nonatomic, retain) UILabel *updatedAt;
//@property (nonatomic, retain) UIImageView *iconPath;
//@property (nonatomic, retain) UIImageView *picturePath;
@property (nonatomic, retain) CommonImageView *userIcon;
@end

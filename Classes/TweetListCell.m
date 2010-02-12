//
//  TweetListCell.m
//  
//
//  Created by 菊池　達哉 on 09/12/16.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TweetListCell.h"


@implementation TweetListCell

@synthesize fullName;			// 本名
//@synthesize iconPath;			// アイコン (URL)
@synthesize tweet;				// つぶやき
@synthesize tweetLat;			// 位置情報 緯度
@synthesize tweetLon;			// 位置情報 経度
//@synthesize picturePath;		// 写真へのPATH (URL)
@synthesize updatedAt;			// 最終更新日時
@synthesize userIcon;			// アイコン



- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // Initialization code
    }
    return self;
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)dealloc {
	[userIcon release];
    [super dealloc];
}


@end

//
//  UserListViewCell.m
//  SCOPEProject
//
//  Created by ハイパー研 on 10/01/05.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "UserListViewCell.h"


@implementation UserListViewCell

@synthesize fullName;
@synthesize fullNameKana;
@synthesize sex;
@synthesize blood;
@synthesize updatedAt;
@synthesize userIcon;

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
	[fullName     release];
	[fullNameKana release];
	[sex          release];
	[blood        release];
	[userIcon     release];
	[updatedAt    release];
    [super        dealloc];
}


@end

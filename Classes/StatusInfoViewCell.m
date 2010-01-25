//
//  StatusInfoViewCell.m
//  SCOPEProject
//
//  Created by YOSHIDA Hiroyuki on 09/12/11.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "StatusInfoViewCell.h"


@implementation StatusInfoViewCell

@synthesize note;

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
	[note  setDelegate:nil];
	[note  release];
    [super dealloc];
}


@end

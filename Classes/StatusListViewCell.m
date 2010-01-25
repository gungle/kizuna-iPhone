//-------------------------------------------------------------
//
//  StatusListViewCell.m
//  ScopeProject
//
//  Created by YOSHIDA Hiroyuki on 09/11/25.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//
//-------------------------------------------------------------

#import "StatusListViewCell.h"


@implementation StatusListViewCell

@synthesize fullName;
@synthesize status;
@synthesize position;
@synthesize updatedAt;
@synthesize userIcon;

/*
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        // Initialization code
    }
    return self;
}
*/

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {

    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (void)dealloc {
	[fullName  release];
	[status    release];
	[position  release];
	[userIcon  release];
	[updatedAt release];
    [super     dealloc];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	NSLog(@"tuchesBegan status list cell");
	[[self nextResponder] touchesBegan:touches withEvent:event];
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	NSLog(@"tuchesEnd status list cell");
	[[self nextResponder] touchesEnded:touches withEvent:event];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	NSLog(@"touchesMoved status list cell");
	[[self nextResponder] touchesMoved:touches withEvent:event];
}

@end

//
//  CommonImageView.m
//  SCOPEProject
//
//  Created by YOSHIDA Hiroyuki on 09/12/18.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "CommonImageView.h"


@implementation CommonImageView


- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}


- (void)drawRect:(CGRect)rect {
    // Drawing code
}


- (void)dealloc {
    [super dealloc];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	NSLog(@"tuchesBegan Image view");
	[[self nextResponder] touchesBegan:touches withEvent:event];
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	NSLog(@"tuchesEnd Image view");
	[[self nextResponder] touchesEnded:touches withEvent:event];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	NSLog(@"touchesMoved Image view");
	[[self nextResponder] touchesMoved:touches withEvent:event];
}

@end

//-------------------------------------------------------------
//
//  StatusListViewController.m
//  ScopeProject02
//
//  Created by YOSHIDA Hiroyuki on 09/11/25.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//
//-------------------------------------------------------------
#import "StatusListViewController.h"
#import "StatusListViewCell.h"


@implementation StatusListViewController

@synthesize viewCell;


- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[viewCell release];
    [super dealloc];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	[[self nextResponder] touchesBegan:touches withEvent:event];
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	[[self nextResponder] touchesEnded:touches withEvent:event];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	[[self nextResponder] touchesMoved:touches withEvent:event];
}

@end

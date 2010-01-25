//
//  StatusInfoTextViewController.m
//  SCOPEProject
//
//  Created by YOSHIDA Hiroyuki on 09/12/11.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "StatusInfoTextViewController.h"


@implementation StatusInfoTextViewController

@synthesize statusInfoViewCell;

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
	[statusInfoViewCell release];
    [super dealloc];
}


@end

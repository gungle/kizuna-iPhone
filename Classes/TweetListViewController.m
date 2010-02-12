//
//  TweetListViewController.m
//  SCOPEProject
//
//  Created by YOSHIDA Hiroyuki on 10/02/12.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "TweetListViewController.h"


@implementation TweetListViewController

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


@end

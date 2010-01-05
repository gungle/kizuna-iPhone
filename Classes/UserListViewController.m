//
//  UserListViewController.m
//  SCOPEProject
//
//  Created by ハイパー研 on 10/01/05.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "UserListViewController.h"


@implementation UserListViewController

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

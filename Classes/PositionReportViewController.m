//
//  PositionReportViewController.m
//  Test
//
//  Created by ハイパー研 on 09/12/01.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PositionReportViewController.h"


@implementation PositionReportViewController

@synthesize positionBtn01;
@synthesize positionBtn02;
@synthesize positionBtn03;

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
	[positionBtn01 release];
	[positionBtn02 release];
	[positionBtn03 release];
    [super dealloc];
}


-(IBAction)pushDownPostionBtn01:(id)sender{
	// 救助者
	[self report:@"position" value:@"1"];
}

-(IBAction)pushDownPostionBtn02:(id)sender{
	// 非救助者
	[self report:@"position" value:@"2"];
}

-(IBAction)pushDownPostionBtn03:(id)sender{
	// その他
	[self report:@"position" value:@"3"];
}

@end

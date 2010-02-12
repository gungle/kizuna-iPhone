//
//  StatusReportViewControll.m
//  SCOPEProject
//
//  Created by YOSHIDA Hiroyuki on 09/12/01.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "StatusReportViewController.h"

@implementation StatusReportViewController

@synthesize statusBtn01;
@synthesize statusBtn02;
@synthesize statusBtn03;
@synthesize statusBtn04;

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


-(IBAction)pushDownStatusBtn01:(id)sender{
	// 避難済 → 安否不明
	[self report:@"status" value:@"1"];
}
-(IBAction)pushDownStatusBtn02:(id)sender{
	// 避難中 → ケガ
	[self report:@"status" value:@"2"];
}
-(IBAction)pushDownStatusBtn03:(id)sender{
	// ヘルプ → 閉じ込み
	[self report:@"status" value:@"3"];
}
-(IBAction)pushDownStatusBtn04:(id)sender{
	// 救助活動中 → 死亡
	[self report:@"status" value:@"4"];
}

- (void)dealloc {
	[statusBtn01 release];
	[statusBtn02 release];
	[statusBtn03 release];
	[statusBtn04 release];
    [super       dealloc];
}


@end

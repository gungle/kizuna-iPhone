//
//  StatusReportViewControll.h
//  SCOPEProject
//
//  Created by YOSHIDA Hiroyuki on 09/12/01.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ReportCommonViewController.h"

@interface StatusReportViewController : ReportCommonViewController {
	UIButton *statusBtn00;	// 取り消し
	UIButton *statusBtn01;	// 安否不明
	UIButton *statusBtn02;	// 大ケガ
	UIButton *statusBtn03;	// 閉じ込め
	UIButton *statusBtn04;	// 意識不明
}

@property (nonatomic, retain) IBOutlet UIButton *statusBtn00;
@property (nonatomic, retain) IBOutlet UIButton *statusBtn01;
@property (nonatomic, retain) IBOutlet UIButton *statusBtn02;
@property (nonatomic, retain) IBOutlet UIButton *statusBtn03;
@property (nonatomic, retain) IBOutlet UIButton *statusBtn04;

-(IBAction)pushDownStatusBtn00:(id)sender;
-(IBAction)pushDownStatusBtn01:(id)sender;
-(IBAction)pushDownStatusBtn02:(id)sender;
-(IBAction)pushDownStatusBtn03:(id)sender;
-(IBAction)pushDownStatusBtn04:(id)sender;

@end

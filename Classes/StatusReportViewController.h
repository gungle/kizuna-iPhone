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
	UIButton *statusBtn01;	// 避難済
	UIButton *statusBtn02;	// 避難中
	UIButton *statusBtn03;	// ヘルプ
	UIButton *statusBtn04;	// 救助活動中
}

@property (nonatomic, retain) IBOutlet UIButton *statusBtn01;
@property (nonatomic, retain) IBOutlet UIButton *statusBtn02;
@property (nonatomic, retain) IBOutlet UIButton *statusBtn03;
@property (nonatomic, retain) IBOutlet UIButton *statusBtn04;

-(IBAction)pushDownStatusBtn01:(id)sender;
-(IBAction)pushDownStatusBtn02:(id)sender;
-(IBAction)pushDownStatusBtn03:(id)sender;
-(IBAction)pushDownStatusBtn04:(id)sender;

@end

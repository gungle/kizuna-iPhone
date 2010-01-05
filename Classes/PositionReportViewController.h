//
//  PositionReportViewController.h
//  Test
//
//  Created by ハイパー研 on 09/12/01.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ReportCommonViewController.h"

@interface PositionReportViewController : ReportCommonViewController {
	UIButton *positionBtn01;		// 救助者
	UIButton *positionBtn02;		// 非救助者
	UIButton *positionBtn03;		// その他
}

@property (nonatomic, retain) IBOutlet UIButton *positionBtn01;
@property (nonatomic, retain) IBOutlet UIButton *positionBtn02;
@property (nonatomic, retain) IBOutlet UIButton *positionBtn03;

-(IBAction)pushDownPostionBtn01:(id)sender;
-(IBAction)pushDownPostionBtn02:(id)sender;
-(IBAction)pushDownPostionBtn03:(id)sender;

@end

//
//  NoteReportViewController.h
//  Test
//
//  Created by ハイパー研 on 09/12/01.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ReportCommonViewController.h"



@interface NoteReportViewController : ReportCommonViewController {
	UITextView *noteTextView;		// その他情報テキストビュー
}

@property (nonatomic, retain) IBOutlet UITextView *noteTextView;

-(void)regist:(id)sender;

@end

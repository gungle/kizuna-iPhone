//
//  ReportCommonViewController.h
//  SCOPEProject
//
//  Created by YOSHIDA Hiroyuki on 09/12/21.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "CommonViewController.h"

@interface ReportCommonViewController : CommonViewController {
	NSString *reportTitle;
}

@property (nonatomic,retain) NSString *reportTitle;

- (void)report:(NSString *)key value:(NSString *)value;

@end

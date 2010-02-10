//-------------------------------------------------------------
//
//  StatusInfoViewController.h
//  ScopeProject
//
//  Created by YOSHIDA Hiroyuki on 09/11/18.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//
//-------------------------------------------------------------

#import <UIKit/UIKit.h>
#import "CommonViewController.h"
#import "CommonScrollView.h"
#import "CommonImageView.h"

@interface StatusInfoViewController : CommonViewController <UIScrollViewDelegate> {
	UILabel      *fullName;
	UILabel      *fullNameKana;
	UILabel      *updatedAt;
	UIButton     *mapBtn;
	UIButton     *reportBtn;
	UITableView  *tblView;
	NSString     *status;
	NSString     *position;
	NSString     *note;
	NSString     *publicFlag;
	CommonImageView  *userIcon;
	CommonScrollView *scrlView;
	
	
}

@property (nonatomic, retain) IBOutlet UILabel      *fullName;
@property (nonatomic, retain) IBOutlet UILabel      *fullNameKana;
@property (nonatomic, retain) IBOutlet UILabel      *updatedAt;
@property (nonatomic, retain) IBOutlet UIButton     *mapBtn;
@property (nonatomic, retain) IBOutlet UIButton     *reportBtn;
@property (nonatomic, retain) IBOutlet UITableView  *tblView;
@property (nonatomic, retain) NSString     *status;
@property (nonatomic, retain) NSString     *position;
@property (nonatomic, retain) NSString     *note;
@property (nonatomic, retain) NSString     *publicFlag;
@property (nonatomic, retain) IBOutlet CommonImageView  *userIcon;
@property (nonatomic, retain) IBOutlet CommonScrollView *scrlView;

-(IBAction)pushDownMapBtn:(id)sender;
-(IBAction)pushDownReportBtn:(id)sender;
-(void)refresh:(id)sender;
-(void)requestStatusInfo;

@end

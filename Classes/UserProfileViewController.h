//
//  GroupTestViewController.h
//  GroupTest
//
//  Created by ハイパー研 on 09/12/03.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonViewController.h"
#import "CommonImageView.h"
#import "CommonScrollView.h"

@interface UserProfileViewController : CommonViewController <UIScrollViewDelegate> {

	UILabel     *fullName;
	UILabel     *fullNameKana;
	UIButton    *mapBtn;
	UITableView *tblView;
	CommonImageView *userIcon;
	CommonScrollView *scrlView;
	
	int            sectionNum;
	NSMutableArray        *sectionArray;
	NSMutableArray        *groupName1;
	NSMutableArray        *groupName2;
	NSMutableArray        *groupName3;
	NSMutableArray *groupValue1;
	NSMutableArray *groupValue2;
	NSMutableArray *groupValue3;
}

@property (nonatomic, retain) IBOutlet UILabel     *fullName;
@property (nonatomic, retain) IBOutlet UILabel     *fullNameKana;
@property (nonatomic, retain) IBOutlet UIButton    *mapBtn;
@property (nonatomic, retain) IBOutlet CommonImageView *userIcon;
@property (nonatomic, retain) IBOutlet UITableView *tblView;
@property (nonatomic, retain) IBOutlet CommonScrollView *scrlView;

@property (nonatomic, retain) NSMutableArray *sectionArray;
@property (nonatomic, retain) NSMutableArray *groupName1;
@property (nonatomic, retain) NSMutableArray *groupName2;
@property (nonatomic, retain) NSMutableArray *groupName3;
@property (nonatomic, retain) NSMutableArray *groupValue1;
@property (nonatomic, retain) NSMutableArray *groupValue2;
@property (nonatomic, retain) NSMutableArray *groupValue3;


-(IBAction)pushDownMapBtn:(id)sender;
@end


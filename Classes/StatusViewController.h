//-------------------------------------------------------------
//
//  StatusViewController.h
//  ScopeProject
//
//  Created by YOSHIDA Hiroyuki on 09/11/17.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//
//-------------------------------------------------------------

#import "CommonViewController.h"
#import "StatusListXMLParser.h"
#import "StatusInfoViewController.h"

@interface StatusViewController : CommonViewController {
	NSMutableArray *items;	
	UITableView *tblView;
	StatusListXMLParser *statusXmlParser;
}

@property (nonatomic, retain) StatusListXMLParser *statusXmlParser;
@property (nonatomic, retain) IBOutlet UITableView *tblView;

- (void)refresh:(id)sender;
- (void)requestStatusList;
@end

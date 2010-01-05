//
//  UserViewController.h
//  SCOPEProject
//
//  Created by ハイパー研 on 10/01/05.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "CommonViewController.h"
#import "UserXMLParser.h"


@interface UserViewController : CommonViewController {
	NSMutableArray *items;	
	UITableView    *tblView;
	UserXMLParser  *userXmlParser;
}

@property (nonatomic, retain) UserXMLParser *userXmlParser;
@property (nonatomic, retain) IBOutlet UITableView *tblView;

-(void)refresh:(id)sender;
-(void)requestUserList;

@end

//
//  TweetViewController.h
//  SCOPEProject
//
//  Created by ハイパー研 on 09/12/04.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "CommonViewController.h"
#import "TweetListXMLParser.h"

#define kTableViewRowHeight 66

@interface TweetViewController : CommonViewController {
	NSMutableArray *items;					// つぶやきのリストを格納
	TweetListXMLParser *tweetXMLParser;		// Rest-XMLパーサー
	IBOutlet UITableView *tweetList;					// 
	
	NSString *parentId;						// つぶやき親ID
	
}
@property (nonatomic, retain) TweetListXMLParser *tweetXMLParser;
@property (nonatomic, retain) UITableView *tweetList;
@property (nonatomic, retain) NSString *parentId;

@end

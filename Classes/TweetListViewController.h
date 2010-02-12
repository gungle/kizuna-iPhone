//
//  TweetListViewController.h
//  SCOPEProject
//
//  Created by YOSHIDA Hiroyuki on 10/02/12.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import	"TweetListCell.h"

@interface TweetListViewController : UIViewController {
	TweetListCell *viewCell;
}

@property (nonatomic, retain) IBOutlet TweetListCell *viewCell;

@end

//-------------------------------------------------------------
//
//  StatusListViewController.h
//  ScopeProject02
//
//  Created by YOSHIDA Hiroyuki on 09/11/25.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//
//-------------------------------------------------------------
#import <UIKit/UIKit.h>
#import	"StatusListViewCell.h"

@interface StatusListViewController : UIViewController {
	StatusListViewCell *viewCell;
}

@property (nonatomic, retain) IBOutlet StatusListViewCell *viewCell;

@end

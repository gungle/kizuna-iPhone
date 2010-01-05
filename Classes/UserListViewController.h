//
//  UserListViewController.h
//  SCOPEProject
//
//  Created by ハイパー研 on 10/01/05.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserListViewCell.h"

@interface UserListViewController : UIViewController {
	UserListViewCell *viewCell;
}

@property (nonatomic, retain) IBOutlet UserListViewCell *viewCell;

@end

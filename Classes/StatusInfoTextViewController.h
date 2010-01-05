//
//  StatusInfoTextViewController.h
//  SCOPEProject
//
//  Created by ハイパー研 on 09/12/11.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "StatusInfoViewCell.h"

@interface StatusInfoTextViewController : UIViewController {
	StatusInfoViewCell *statusInfoViewCell;
}

@property (nonatomic, retain) IBOutlet StatusInfoViewCell *statusInfoViewCell;

@end

//
//  StatusInfoViewCell.h
//  SCOPEProject
//
//  Created by ハイパー研 on 09/12/11.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface StatusInfoViewCell : UITableViewCell {
	UITextView  *note;
}

@property (nonatomic, retain) IBOutlet UITextView  *note;

@end

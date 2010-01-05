//
//  TweetInputController.h
//  Cells2
//
//  Created by 菊池　達哉 on 09/12/21.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocationViewController.h"


@interface TweetInputController : LocationViewController {
	IBOutlet UITextView			*tweetMessage;
	NSString *parentId;						// つぶやき親ID

}
@property (nonatomic, retain) UITextView *tweetMessage;
@property (nonatomic, retain) NSString *parentId;

-(void)getLocation:(id)sender;

@end

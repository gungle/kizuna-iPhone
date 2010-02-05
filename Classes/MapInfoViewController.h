//
//  MapInfoViewController.h
//  SCOPEProject
//
//  Created by YOSHIDA Hiroyuki on 10/01/07.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonViewController.h"
#import "CommonImageView.h"


@interface MapInfoViewController : CommonViewController {
	CommonImageView *imageView;
	NSString *imagePath;
}

@property (nonatomic, retain) IBOutlet UIImageView *imageView;
//@property (nonatomic, retain) NSString *imagePath;

- (id)initWithImagePath:(NSString *)path;

@end

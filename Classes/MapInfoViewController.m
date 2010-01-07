//
//  MapInfoViewController.m
//  SCOPEProject
//
//  Created by ハイパー研 on 10/01/07.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "MapInfoViewController.h"
#import "AsyncImageView.h"


@implementation MapInfoViewController

@synthesize imageView;
//@synthesize imagePath;

- (id)initWithImagePath:(NSString *)path {
    if (self = [super initWithNibName:nil bundle:nil]) {
		NSLog(@"---> initWithImagePath -- > %@", path);
		imagePath = path;
	}
    return self;
}
/*
 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	NSLog(@"---> viewDidLoad -- > %@", imagePath);
    [super viewDidLoad];
	AsyncImageView *asyncImageView =[[AsyncImageView alloc] initWithFrame:CGRectMake(0,0,320,320)];
	[asyncImageView loadImage:imagePath];
	[imageView addSubview:asyncImageView];
	[asyncImageView release];
}


/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	[imageView release];
//	[imagePath release];
    [super dealloc];
}


@end

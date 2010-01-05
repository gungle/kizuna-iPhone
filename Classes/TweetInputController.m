//
//  TweetInputController.m
//  Cells2
//
//  Created by 菊池　達哉 on 09/12/21.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TweetInputController.h"


@implementation TweetInputController
@synthesize tweetMessage;
@synthesize parentId;


// GPS情報取得
- (void)getLocation:(id)sender {
	NSLog(@"------ getLocation");
	
	[self confirmGetLocation];
}

- (void)postTweet{
	NSLog(@"------ postTweet");
	NSLog(@"======%@", tweetMessage.text);

	// つぶやきをアップロード
	NSString *url = [[NSString alloc]initWithFormat:@"%@%@",
					 [self getProperties:@"SERVER"], 
					 [self getProperties:@"API_KEY_TWEETS"]
					 ];
	
	NSLog(@"-- >> url = %@",url);
	
	NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];	
	[request setURL:[NSURL URLWithString:url]];
	[request setHTTPMethod:@"POST"];
	[request addValue:@"application/xml" forHTTPHeaderField: @"Content-Type"];
	
	// GPS関連のXMLパート生成（キレイじゃないかな。。。）
	NSString *loc = @"";
	if (location.latitude != 0.0) {
		loc = [[NSString alloc]initWithFormat:@"",location.latitude, location.latitude];
	}
	
	// XML生成
	NSMutableData *body = [NSMutableData data];
	[body appendData:[[NSString stringWithFormat:@"<tweet><group_id>%@</group_id><parent_id>%@</parent_id><user_id>%@</user_id><tweet>%@</tweet>%@</tweet>",
					   myGroupId,
					   parentId,
					   myUserId,
					   tweetMessage.text,
					   loc] dataUsingEncoding:NSUTF8StringEncoding]];
	[request setHTTPBody:body];
	
	// URLコネクションを作る
	[NSURLConnection connectionWithRequest:request delegate:self];
	
//	[request release];
	
	// 元の一覧画面に戻る
	[self.navigationController popViewControllerAnimated:YES];
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
	
	UIBarButtonItem *uploadButton = [[UIBarButtonItem alloc] initWithTitle:@"投稿" style:UIBarButtonItemStyleBordered target:self action:@selector(postTweet)];
	self.navigationItem.rightBarButtonItem = uploadButton;
	[uploadButton release];
	
    [super viewDidLoad];
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
    [super dealloc];
}


@end

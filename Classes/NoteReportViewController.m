//
//  NoteReportViewController.m
//  SCOPEProject
//
//  Created by YOSHIDA Hiroyuki on 09/12/01.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "NoteReportViewController.h"
#import "StatusListXMLParser.h"

@implementation NoteReportViewController

@synthesize noteTextView;


 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	// Button
	UIBarButtonItem *refreshButton = [[UIBarButtonItem alloc] 
									  initWithBarButtonSystemItem:UIBarButtonSystemItemDone
									  target:self 
									  action:@selector(regist:)
									  ];
	//	refreshButton.style = UIBarButtonItemStylePlain;
	self.navigationItem.rightBarButtonItem = refreshButton;
	[refreshButton release];
	
	self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
	noteTextView.backgroundColor = [UIColor whiteColor];
	
	
	// indicator visible
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	
	// ユーザステータス一覧取得
	NSError *parseError = nil;	
	StatusListXMLParser *statusXmlParser = [[StatusListXMLParser alloc] init];
	NSString *url = [[NSString alloc]initWithFormat:@"%@%@?user_id=%@",
					 [self getProperties:@"SERVER"], 
					 [self getProperties:@"API_KEY_STATUS"],
					 userId
					 ];
	[statusXmlParser parseXMLFileAtURL:[NSURL URLWithString:url] parseError:&parseError];	
	[url release];

	NSMutableArray *items = [statusXmlParser items];
	
	StatusInfo *statusInfo = [items objectAtIndex:0];
	noteTextView.text = statusInfo.note;
	[statusXmlParser release];
	
	// indicator invisible
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

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
    [noteTextView release];
    [super        dealloc];
}

-(void)regist:(id)sender{
	NSLog(@"----- >>> 登録");
	// その他情報登録API
	[noteTextView resignFirstResponder];

	[self report:@"note" value:noteTextView.text];
	}

@end

//-------------------------------------------------------------
//
//  StatusInfoViewController.m
//  ScopeProject02
//
//  Created by yoshida on 09/11/18.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//
//-------------------------------------------------------------

#import "StatusInfoViewController.h"
#import "StatusInfo.h"
#import "StatusListXMLParser.h"
#import "AsyncImageView.h"
#import "MapViewController.h"
#import "ReportViewController.h"
#import "UserProfileViewController.h"

#import "ScopeProjectAppDelegate.h"
#import "StatusInfoViewCell.h"
#import "StatusInfoTextViewController.h"

@implementation StatusInfoViewController

@synthesize fullName;
@synthesize fullNameKana;
@synthesize status;
@synthesize position;
@synthesize updatedAt;
@synthesize note;
@synthesize mapBtn;
@synthesize reportBtn;
@synthesize userIcon;
@synthesize tblView;
@synthesize scrlView;

 // The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
	NSLog(@"-- <StatusInfoViewController> initWithNibName");
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		// Custom initialization
		// Button
		UIBarButtonItem *refreshButton = [[UIBarButtonItem alloc] 
										  initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
										  target:self
										  action:@selector(refresh:)
										  ];
		//	refreshButton.style = UIBarButtonItemStylePlain;
		self.navigationItem.rightBarButtonItem = refreshButton;
		[refreshButton release];
    }
    return self;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	NSLog(@"-- <StatusInfoViewController> viewDidLoad");
    [super viewDidLoad];
	scrlView.pagingEnabled = NO;
	scrlView.contentSize = CGSizeMake(320, 500);
	scrlView.showsHorizontalScrollIndicator = NO;
	scrlView.showsVerticalScrollIndicator = NO;
	scrlView.scrollsToTop = YES;
	scrlView.delaysContentTouches = NO;
	self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
	
}

-(void)requestStatusInfo{
	NSError *parseError = nil;	
	StatusListXMLParser *statusXmlParser = [[StatusListXMLParser alloc] init];
	
	// ユーザステータス一覧取得
	NSString *url = [[NSString alloc]initWithFormat:@"%@%@?user_id=%@",
					 [self getProperties:@"SERVER"], 
					 [self getProperties:@"API_KEY_STATUS"],
					 userId
					 ];
	[statusXmlParser parseXMLFileAtURL:[NSURL URLWithString:url] parseError:&parseError];
	
	NSLog(@" url = %@", url);
	[url release];
	NSMutableArray *items = [statusXmlParser items];
	
	StatusInfo *statusInfo = [items objectAtIndex:0];
	
	[fullName     setText:statusInfo.fullName];
	[fullNameKana setText:statusInfo.fullNameKana];
	[updatedAt    setText:statusInfo.updatedAt];
	status   = [[NSString alloc]initWithString:statusInfo.status];
	position = [[NSString alloc]initWithString:statusInfo.position];
	note     = [[NSString alloc]initWithString:statusInfo.note];
	
	AsyncImageView *asyncImageView =[[AsyncImageView alloc] initWithFrame:CGRectMake(0,0,100,100)];
	NSString *imagePath = [[NSString alloc] initWithFormat:@"%@", statusInfo.iconPath];
	NSLog(@" image path = %@", imagePath);
	[asyncImageView loadImage:imagePath];
	
	[userIcon addSubview:asyncImageView];
	[asyncImageView release];
	[statusXmlParser release];
}

-(void)refresh:(id)sender{
	[self requestStatusInfo];
	[self.tblView reloadData];
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
	NSLog(@"-- <StatusInfoViewController> viewDidUnload");
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated {
	NSLog(@"-- <StatusInfoViewController> viewWillAppear");
    [super viewWillAppear:animated];
	[self requestStatusInfo];
	[self.tblView reloadData];

}
- (void)viewDidAppear:(BOOL)animated {
	NSLog(@"-- <StatusInfoViewController> viewDidAppear");
    [super viewDidAppear:animated];
}
- (void)viewWillDisappear:(BOOL)animated {
	NSLog(@"-- <StatusInfoViewController> viewWillDisappear");
	[super viewWillDisappear:animated];
}
- (void)viewDidDisappear:(BOOL)animated {
	NSLog(@"-- <StatusInfoViewController> viewDidDisappear");
	[super viewDidDisappear:animated];
}


- (void)dealloc {
	NSLog(@"-- <StatusInfoViewController> dealloc");
	[fullName     release];
	[fullNameKana release];
	[status       release];
	[position     release];
	[updatedAt    release];
	[note         release];
	[mapBtn       release];
	[reportBtn    release];
	[userIcon     release];
	[tblView      release];
	[scrlView     release];
	
    [super dealloc];
}

-(IBAction)pushDownMapBtn:(id)sender{
	NSLog(@"----- >>> pushDownMapBtn");
	MapViewController *mapViewController = [[MapViewController alloc] initWithNibName:nil bundle:nil];
	mapViewController.userId  = userId;
	mapViewController.title = @"現在位置";
	[self.navigationController pushViewController:mapViewController animated:YES];
	[mapViewController release];
}

-(IBAction)pushDownReportBtn:(id)sender{
	NSLog(@"----- >>> pushDownReportBtn");
	ReportViewController *reportViewController = [[ReportViewController alloc] initWithNibName:nil bundle:nil];
	reportViewController.userId  = userId;
	reportViewController.title = @"現状報告";
	[self.navigationController pushViewController:reportViewController animated:YES];
	[reportViewController release];
	
}

// セクション数
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}

// 行数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 1;
}

// セルの高さ変更
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
	CGFloat height = 25;
	if (indexPath.section == 2) {
		// その他の情報
		height = 150;
	}
	return height;
}

// セルの表示
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

	if (indexPath.section == 2) {
		static NSString *CellIdentifier = @"StatusInfoViewCell";
		StatusInfoViewCell *cell = (StatusInfoViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
		if (cell == nil) {
			StatusInfoTextViewController *viewController = [[StatusInfoTextViewController alloc]initWithNibName:CellIdentifier bundle:nil];
			cell = (StatusInfoViewCell *)viewController.view;
			[viewController release];
		}
		[cell.note setText:note];
		return cell;
		
	} else {
		static NSString *identifier = @"Cell";
		UITableViewCell *defaultCell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
		if (defaultCell == nil) {
			defaultCell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:identifier] autorelease];
		}
		
		if (indexPath.section == 0) {
			defaultCell.textLabel.text = @"現在の状況";
			defaultCell.detailTextLabel.text= status;
		} else {
			defaultCell.textLabel.text = @"現在の立場";
			defaultCell.detailTextLabel.text = position;
		}
		return defaultCell;
	}
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
	NSLog(@"tuchesBegan kita-");
	UITouch *touch = [[event allTouches] anyObject];
	if ([touch view] == userIcon) {
		NSLog(@"-- > Image View touched!!");
		// ユーザプロフィール画面に遷移
		UserProfileViewController *userViewController = [[UserProfileViewController alloc] initWithNibName:nil bundle:nil];
		userViewController.userId  = userId;
		userViewController.title = @"ユーザプロフィール";
		[self.navigationController pushViewController:userViewController animated:YES];
		[userViewController release];
	} else {
		NSLog(@"-- > scroll View touched!!");		
	}
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
	NSLog(@"tuchesEnd");
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
	NSLog(@"touchesMoved");		
}

@end

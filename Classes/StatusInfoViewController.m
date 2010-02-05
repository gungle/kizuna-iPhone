//-------------------------------------------------------------
//
//  StatusInfoViewController.m
//  ScopeProject
//
//  Created by YOSHIDA Hiroyuki on 09/11/18.
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
	// indicator visible
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;

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
	
	// indicator invisible
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

-(void)refresh:(id)sender{
	[self requestStatusInfo];
	[self.tblView reloadData];
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

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
	[self requestStatusInfo];
	[self.tblView reloadData];

}


- (void)dealloc {
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
	MapViewController *mapViewController = [[MapViewController alloc] initWithNibName:nil bundle:nil];
	mapViewController.userId  = userId;
	mapViewController.title = @"現在位置";
	[self.navigationController pushViewController:mapViewController animated:YES];
	[mapViewController release];
}

-(IBAction)pushDownReportBtn:(id)sender{
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
	UITouch *touch = [[event allTouches] anyObject];
	if ([touch view] == userIcon) {
		// ユーザプロフィール画面に遷移
		UserProfileViewController *userViewController = [[UserProfileViewController alloc] initWithNibName:nil bundle:nil];
		userViewController.userId  = userId;
		userViewController.title = @"ユーザプロフィール";
		[self.navigationController pushViewController:userViewController animated:YES];
		[userViewController release];
	} else {
	}
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
}

@end

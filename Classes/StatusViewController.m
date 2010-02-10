//-------------------------------------------------------------
//
//  StatusViewController.m
//  SCOPEProject
//
//  Created by YOSHIDA Hiroyuki on 09/11/17.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//
//-------------------------------------------------------------

#import "StatusViewController.h"
#import "StatusInfoViewController.h"
#import "StatusInfo.h"
#import "StatusListXMLParser.h"
#import "StatusListViewController.h"
#import "StatusListViewCell.h"

#import "AsyncImageView.h"


@implementation StatusViewController

@synthesize statusXmlParser;
@synthesize tblView;

- (void)viewDidLoad {
    [super viewDidLoad];

    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

	// Button
	UIBarButtonItem *refreshButton = [[UIBarButtonItem alloc] 
								initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
								target:self
								action:@selector(refresh:)
								];
	self.navigationItem.rightBarButtonItem = refreshButton;
	[refreshButton release];
	
}

- (void)requestStatusList {
	// indicator visible
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;

	// Table
	NSError *parseError = nil;  
	if (statusXmlParser == nil){
		statusXmlParser = [[StatusListXMLParser alloc] init]; 
	}
	
	// ユーザステータス一覧取得
	NSString *url = [[NSString alloc]initWithFormat:@"%@%@?group_id=%@",
											[self getProperties:@"SERVER"], 
											[self getProperties:@"API_KEY_STATUS"],
											myGroupId
											];
//	NSLog(@" url = %@", url);

	[statusXmlParser parseXMLFileAtURL:[NSURL URLWithString:url] parseError:&parseError];
	[url release];
	items = [statusXmlParser items];
	
	// indicator invisible
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (void)refresh:(id)sender {
	// 更新処理
	[self requestStatusList];
	[self.tblView reloadData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
	[self requestStatusList];
	[self.tblView reloadData];
}

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.	
}

- (void)viewDidUnload {
	// Release anything that can be recreated in viewDidLoad or on demand.
	// e.g. self.myOutlet = nil;
//	NSLog(@"-- <StatusViewController> viewDidUnload");
}

- (void)dealloc {
//	NSLog(@"-- <StatusViewController> dealloc");
	[statusXmlParser release];
	[tblView         release];
    [super dealloc];
}


#pragma mark Table view methods
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [items count];
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"StatusListViewCell";
    StatusListViewCell *cell = (StatusListViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
		StatusListViewController *viewController = [[StatusListViewController alloc]initWithNibName:CellIdentifier bundle:nil];
		cell = (StatusListViewCell *)viewController.view;
		[viewController release];
    }
    
	// Configure the cell.
	int personIndex = [indexPath indexAtPosition:[indexPath length] -1];
	StatusInfo *info = (StatusInfo *)[items objectAtIndex:personIndex];
	
	// ユーザ情報設定
/*
	// アイコン
	AsyncImageView *asyncImageView =[[AsyncImageView alloc] initWithFrame:CGRectMake(2,2,48,48)];
	NSString *imagePath = [[NSString alloc] initWithFormat:@"%@", [[items objectAtIndex:personIndex] iconPath]];
	[asyncImageView loadImage:imagePath];
	asyncImageView.tag = 1;
	[imagePath release];

	[cell.userIcon addSubview:asyncImageView];
	[asyncImageView release];
*/
	AsyncImageView *asyncImageView =[[AsyncImageView alloc] initWithFrame:CGRectMake(2,2,48,48)];
	if (info.imageData == nil) {
		// first time
/* アイコンにインディケータを表示する場合
		// create activity indicator
		UIActivityIndicatorView *indicator;
		indicator = [[[UIActivityIndicatorView alloc] 
					  initWithActivityIndicatorStyle: UIActivityIndicatorViewStyleGray]
					 autorelease];
		indicator.frame = cell.userIcon.bounds;
		indicator.contentMode = UIViewContentModeCenter;
		
		[indicator startAnimating];
		cell.userIcon.image = nil;
		// add indicator
		[cell.userIcon addSubview: indicator];
*/
		NSString *imagePath = [[NSString alloc] initWithFormat:@"%@", [info iconPath]];
		[asyncImageView loadImage:imagePath];
		//	 asyncImageView.tag = 1;
		asyncImageView.indexPath = indexPath;
		[imagePath release];
		
		[[NSNotificationCenter defaultCenter]
		 addObserver: self
		 selector: @selector(loadImageDidEnd:)
		 name:@"nothiFyImageLoadFinish"
		 object: asyncImageView];
		
	} else {
		// over than second times
		NSData *data = (NSData *)[info imageData];
		asyncImageView.image = [UIImage imageWithData:data];
		[cell.userIcon addSubview:asyncImageView];
	}
	[asyncImageView release];

	// ユーザ名
	[cell.fullName setText:[info fullName]];
	// ステータス
	[cell.status setText:[info status]];
	// 立場
	[cell.position setText:[info position]];
	// 更新日時
	[cell.updatedAt setText:[info updatedAt]];

    return cell;
}

// Override to support row selection in the table view.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    // Navigation logic may go here -- for example, create and push another view controller.
	int personIndex = [indexPath indexAtPosition:[indexPath length] -1];
	StatusInfo *info = [items objectAtIndex:personIndex];
	StatusInfoViewController *statusInfoViewController = [[StatusInfoViewController alloc] initWithNibName:nil bundle:nil];
	statusInfoViewController.title = @"ステータス詳細";

	// 選択されたユーザのグループIDとユーザIDを設定
	statusInfoViewController.userId = info.userId;
	[self.navigationController pushViewController:statusInfoViewController animated:YES];

	[statusInfoViewController release];
}

#pragma mark Load Image
- (void) loadImageDidEnd: (NSNotification *)notification
{	
	AsyncImageView *asyncImageView = (AsyncImageView *)[notification object];
	if (asyncImageView != nil) {
		int personIndex = [asyncImageView.indexPath indexAtPosition:[asyncImageView.indexPath length] -1];
		StatusInfo *info = (StatusInfo *)[items objectAtIndex:personIndex];
		info.imageData = [[NSMutableData alloc]initWithCapacity:0];
		info.imageData =  asyncImageView.imageData;
		StatusListViewCell *cell = (StatusListViewCell *)[self.tblView cellForRowAtIndexPath: asyncImageView.indexPath];
		if (cell != nil) {
/*　アイコンにインディケータを表示した場合
			// remove indicator
			for ( UIView *subView in cell.userIcon.subviews){
				[subView removeFromSuperview];
			}
*/
			[cell.userIcon addSubview:asyncImageView];
		}
	}	
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
/*
	UITouch *touch = [[event allTouches] anyObject];
	if ([touch view] == userIcon) {
		NSLog(@"-- > Image View touched!!");		
	} else {
		NSLog(@"-- > scroll View touched!!");		
	}
*/
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
}

@end


//
//  UserViewController.m
//  SCOPEProject
//
//  Created by YOSHIDA Hiroyuki on 10/01/05.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "UserViewController.h"
#import "UserProfileViewController.h"
#import "UserInfo.h"
#import "UserXMLParser.h"
#import "UserListViewController.h"
#import "UserListViewCell.h"
#import "AsyncImageView.h"


@implementation UserViewController

@synthesize userXmlParser;
@synthesize tblView;


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	// Button
	UIBarButtonItem *refreshButton = [[UIBarButtonItem alloc] 
									  initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
									  target:self
									  action:@selector(refresh:)
									  ];
	self.navigationItem.rightBarButtonItem = refreshButton;
	[refreshButton release];
}

- (void)requestUserList {
	// indicator visible
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;

	// Table
	NSError *parseError = nil;  
	if (userXmlParser == nil){
		userXmlParser = [[UserXMLParser alloc] init]; 
	}
	
	// ユーザ一覧取得
	NSString *url = [[NSString alloc]initWithFormat:@"%@%@?group_id=%@",
					 [self getProperties:@"SERVER"], 
					 [self getProperties:@"API_KEY_USERS"],
					 myGroupId
					 ];
//	NSLog(@" url = %@", url);
	
	[userXmlParser parseXMLFileAtURL:[NSURL URLWithString:url] parseError:&parseError];
	[url release];
	items = [userXmlParser items];

	// indicator invisible
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (void)refresh:(id)sender {
	// 更新処理
	[self requestUserList];
	[self.tblView reloadData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
	[self requestUserList];
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


- (void)dealloc {
	[userXmlParser release];
	[tblView       release];
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
    
    static NSString *CellIdentifier = @"UserListViewCell";
    UserListViewCell *cell = (UserListViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
		UserListViewController *viewController = [[UserListViewController alloc]initWithNibName:CellIdentifier bundle:nil];
		cell = (UserListViewCell *)viewController.view;
		[viewController release];
    }
    
	// Configure the cell.
	int personIndex = [indexPath indexAtPosition:[indexPath length] -1];
	UserInfo *info = [items objectAtIndex:personIndex];
	
	// ユーザ情報設定
	// アイコン
/*
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
	
	// 氏名
	[cell.fullName setText:(NSString *)[info fullName]];
	// 氏名カナ
	[cell.fullNameKana setText:(NSString *)[info fullNameKana]];
	// 住所
	[cell.address setText:(NSString *)[info address]];
    return cell;
}

// Override to support row selection in the table view.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
    // Navigation logic may go here -- for example, create and push another view controller.
	int personIndex = [indexPath indexAtPosition:[indexPath length] -1];
	UserInfo *info = [items objectAtIndex:personIndex];
	UserProfileViewController *userProfileViewController = [[UserProfileViewController alloc] initWithNibName:nil bundle:nil];
	userProfileViewController.title = @"ユーザプロフィール";
	
	// 選択されたユーザのグループIDとユーザIDを設定
	userProfileViewController.userId = info.userId;
	[self.navigationController pushViewController:userProfileViewController animated:YES];
	
	[userProfileViewController release];
}

#pragma mark Load Image
- (void) loadImageDidEnd: (NSNotification *)notification
{	
	AsyncImageView *asyncImageView = (AsyncImageView *)[notification object];
	if (asyncImageView != nil) {
		int personIndex = [asyncImageView.indexPath indexAtPosition:[asyncImageView.indexPath length] -1];
		UserInfo *info = (UserInfo *)[items objectAtIndex:personIndex];
		info.imageData = [[NSMutableData alloc]initWithCapacity:0];
		info.imageData =  asyncImageView.imageData;
		UserListViewCell *cell = (UserListViewCell *)[self.tblView cellForRowAtIndexPath: asyncImageView.indexPath];
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

@end

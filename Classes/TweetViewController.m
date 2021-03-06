//
//  TweetViewController.m
//  SCOPEProject
//
//  Created by ハイパー研 on 09/12/04.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//TweetViewController

#import "TweetViewController.h"
#import "TweetListCell.h"
#import "TweetInputController.h"
#import "TweetInfo.h"
#import "AsyncImageView.h"
#import "TweetListViewController.h"

@implementation TweetViewController
@synthesize tweetXMLParser;
@synthesize tweetList;
@synthesize parentId;

- (void)viewDidLoad {
	NSLog(@"-- <TweetViewController> viewDidLoard");
    [super viewDidLoad];
	
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
	
	// Button
	UIBarButtonItem *inputButton = [[UIBarButtonItem alloc] initWithTitle:@"入力" style:UIBarButtonItemStyleBordered target:self action:@selector(loadInputScreen)];
	self.navigationItem.rightBarButtonItem = inputButton;
	[inputButton release];
	
//	[self requestTweetList];
//	[super viewDidLoad];
}

// つぶやき情報取得
- (void)requestTweetList {

	NSError *parseError = nil;  
	if (tweetXMLParser == nil){
		tweetXMLParser = [[TweetListXMLParser alloc] init]; 
	}
	
	// URL生成
	if (parentId == nil) {		// TOPなら親IDは0
		parentId = @"0";
	}
	
	NSString *url = [[NSString alloc]initWithFormat:@"%@%@?group_id=%@&parent_id=%@",
					 [self getProperties:@"SERVER"], 
					 [self getProperties:@"API_KEY_TWEETS"],
					 myGroupId, parentId
					 ];
//	NSString *url = @"http://localhost:3000/tweets.xml";
	NSLog(@" url = %@", url);
	
	// 情報取得＆パース
	[tweetXMLParser parseXMLFileAtURL:[NSURL URLWithString:url] parseError:&parseError];
	[url release];
	
	// インスタンス変数に保存
	items = [tweetXMLParser items];
}

// -
//- (void)refresh:(id)sender {
//	// 更新処理
//	[self requestTweetList];
//	[tweetList reloadData];
//}

// 発言投稿画面の表示
- (void) loadInputScreen{
	NSLog(@"------ loadInputScreen");
	TweetInputController *inputController = [[TweetInputController alloc] initWithNibName:@"TweetInput" bundle:nil];
	
	inputController.parentId = parentId;	// 親IDを引き継ぐ
	
	[self.navigationController pushViewController:inputController animated:YES];
	[inputController release];
	
}

- (void)viewWillAppear:(BOOL)animated {
	NSLog(@"-- <TweetViewController> viewWillAppear");
    [super viewWillAppear:animated];
	[self requestTweetList];
	[self.tweetList reloadData];
}

/*
 - (void)viewDidAppear:(BOOL)animated {
 NSLog(@"-- <TweetViewController> viewDidAppear");
 [super viewDidAppear:animated];
 }
 - (void)viewWillDisappear:(BOOL)animated {
 NSLog(@"-- <TweetViewController> viewWillDisappear");
 [super viewWillDisappear:animated];
 }
 - (void)viewDidDisappear:(BOOL)animated {
 NSLog(@"-- <TweetViewController> viewDidDisappear");
 [super viewDidDisappear:animated];
 }
 */

/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations.
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.	
}

- (void)viewDidUnload {
	// Release anything that can be recreated in viewDidLoad or on demand.
	// e.g. self.myOutlet = nil;
	NSLog(@"-- <TweetViewController> viewDidUnload");
}

- (void)dealloc {
	NSLog(@"-- <TweetViewController> dealloc");
//	[statusXmlParser release];
//	[tweetList         release];
    [super dealloc];
}


#pragma mark Table view methods
//- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//    return 1;
//}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return [items count] + 1;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
	if (indexPath.row == 0) {
		
		static NSString *TweetListCellIdentifier2 = @"TweetListCellIdentifier2";
		
		UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TweetListCellIdentifier2];
		
		if (cell == nil) {
			cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:TweetListCellIdentifier2] autorelease];
		}
		
		cell.textLabel.text = @"RELOAD";
		
		
		return cell;
	}else{
		
		static NSString *TweetListCellIdentifier = @"TweetListCell";
	
		TweetListCell *cell = (TweetListCell *)[tableView dequeueReusableCellWithIdentifier:TweetListCellIdentifier];
		
		if (cell == nil) {
//			NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"TweetListCell" owner:self options:nil];
//			cell = [nib objectAtIndex:0];
			TweetListViewController *viewController = [[TweetListViewController alloc]initWithNibName:TweetListCellIdentifier bundle:nil];
			cell = (TweetListCell *)viewController.view;
			[viewController release];
			
		}
		// remove subView
		for ( UIView *subView in cell.userIcon.subviews){
			[subView removeFromSuperview];
		}
		
		NSUInteger row = [indexPath row] -1;
		TweetInfo *info = (TweetInfo *)[items objectAtIndex:row];
		
		cell.fullName.text = [info fullName];
		cell.tweet.text = [info tweet];
		cell.updatedAt.text = [info updatedAt];
		
		// アイコン
/*
		AsyncImageView *asyncImageView =[[AsyncImageView alloc] initWithFrame:CGRectMake(0,0,48,48)];
		NSString *imagePath = [[NSString alloc] initWithFormat:@"%@", [[items objectAtIndex:row] iconPath]];
		[asyncImageView loadImage:imagePath];

		[cell. iconPath addSubview:asyncImageView];
		[asyncImageView release];
*/
		AsyncImageView *asyncImageView =[[AsyncImageView alloc] initWithFrame:CGRectMake(0,0,48,48)];
		if (info.imageData == nil) {
			NSString *imagePath = [[NSString alloc] initWithFormat:@"%@", [info iconPath]];
			[asyncImageView loadImage:imagePath];
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
		
		return cell;
	}
}

// Override to support row selection in the table view.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

//	NSLog(@"------- start. didSelectRowAtIndexPath");
	
	if (indexPath.row == 0) {
		[self requestTweetList];
		[tweetList reloadData];
		
//		[self refresh];
		
	} else {
		
		// 次の画面のインスタンス生成
		TweetViewController *listController = [[TweetViewController alloc] initWithNibName:@"TweetViewController" bundle:nil];
		
		// タイトルバー変更
		listController.title = @"緊急連絡一覧";		// 何階層目か、わかるようにする★
		
		// パラメタを引き継ぐ
		NSUInteger row = [indexPath row] -1;
		listController.parentId = [[items objectAtIndex:row] tweetId]; // 選択されたつぶやきIDが、次の画面の親IDとなる
	
		// 画面遷移
		[self.navigationController pushViewController:listController animated:YES];
		[listController release];
		
	}
	
//	NSLog(@"------- end. didSelectRowAtIndexPath");
	
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//	NSUInteger row = [indexPath row] -1;
	
//	if (row % 2 == 0) {
		return kTableViewRowHeight;
//	}else {
//		return kTableViewRowHeight * 2;
//	}

	

}

#pragma mark Load Image
- (void) loadImageDidEnd: (NSNotification *)notification
{	
	AsyncImageView *asyncImageView = (AsyncImageView *)[notification object];
	if (asyncImageView != nil) {
		NSUInteger row = [asyncImageView.indexPath row] -1;
		TweetInfo *info = (TweetInfo *)[items objectAtIndex:row];
		info.imageData = [[NSMutableData alloc]initWithCapacity:0];
		info.imageData =  asyncImageView.imageData;
		TweetListCell *cell = (TweetListCell *)[self.tweetList cellForRowAtIndexPath: asyncImageView.indexPath];
		if (cell != nil) {
			[cell.userIcon addSubview:asyncImageView];
		}
	}	
}




@end


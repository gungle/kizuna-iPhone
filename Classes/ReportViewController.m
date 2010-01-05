//
//  TestViewController.m
//  Test
//
//  Created by ハイパー研 on 09/11/30.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "ReportViewController.h"
#import "StatusReportViewController.h"
#import "PositionReportViewController.h"
#import "NoteReportViewController.h"

@implementation ReportViewController

// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
		self.title = @"現在報告画面";
    }
    return self;
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	if ([[self getMyTabBarTitle] isEqualToString:@"Report"]) {
		// 報告タブから遷移の場合
		userId = myUserId;
	}
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
    [super   dealloc];
}

// 現在位置取得成功時の処理
- (void)locationManager:(CLLocationManager *)manager
	didUpdateToLocation:(CLLocation *)newLocation
		   fromLocation:(CLLocation *)oldLocation
{
	NSLog(@"---> ReportViewController > locationManager");
	// 位置情報を取り出す
	location.latitude  = newLocation.coordinate.latitude;
	location.longitude = newLocation.coordinate.longitude;
	[self report];
	[self alertView:@"現在位置報告完了" message:@"現在位置の報告が完了しました。" okBtnName:@"OK"];
}


#pragma mark Table view methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 4;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
		//        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
		cell = [[[UITableViewCell alloc] initWithFrame:CGRectZero reuseIdentifier:CellIdentifier] autorelease];
		cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    }
    
	int personIndex = [indexPath indexAtPosition:[indexPath length] -1];
	switch (personIndex) {
		case 0:
			// 現在の状況
			cell.textLabel.text = @"現在の状況";
			break;
		case 1:
			// 立場
			cell.textLabel.text = @"立場";
			break;
		case 2:
			// 現在の位置
			cell.textLabel.text = @"現在の位置";
			break;
		default:
			// その他の情報
			cell.textLabel.text = @"その他の情報";
			break;
	}
	
    return cell;
}



// Override to support row selection in the table view.
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	
    // Navigation logic may go here -- for example, create and push another view controller.
	
	int personIndex = [indexPath indexAtPosition:[indexPath length] -1];
	
	
	StatusReportViewController   *statusViewController;
	PositionReportViewController *positionViewController;
	NoteReportViewController     *noteViewController;
	switch (personIndex) {
		case 0:
			// 現在の状況
			statusViewController = [[StatusReportViewController alloc] initWithNibName:nil bundle:nil];
			statusViewController.title = @"現在の状況";
			statusViewController.userId = userId;
			[self.navigationController pushViewController:statusViewController animated:YES];
			[statusViewController release];
			break;
		case 1:
			// 立場
			positionViewController = [[PositionReportViewController alloc] initWithNibName:nil bundle:nil];
			positionViewController.title = @"立場";
			positionViewController.userId = userId;
			[self.navigationController pushViewController:positionViewController animated:YES];
			[positionViewController release];
			break;
		case 2:
			// 現在位置取得確認
			[self confirmGetLocation];		
			break;
		default:
			// その他の情報
			noteViewController = [[NoteReportViewController alloc] initWithNibName:nil bundle:nil];
			noteViewController.title = @"その他の情報";
			noteViewController.userId = userId;
			[self.navigationController pushViewController:noteViewController animated:YES];
			[noteViewController release];
			break;
	}
}

- (void)alertView:(UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	if (alertView.numberOfButtons == 1) {
		NSLog(@"ボタンは１つ");
		return;
	} else {
		NSLog(@"ボタンは2つ以上");
		if (buttonIndex == 1) {
			// OK
			// 現在位置をGPSで取得して、現在位置通知APIを呼ぶ
			[self getGpsLocation];
		} else {
			// 取得しない
		}
	}
}

// 現在位置報告
- (void)report {
	
	NSString *url = [[NSString alloc]initWithFormat:@"%@%@/%@.xml",
					 [self getProperties:@"SERVER"], 
					 [self getProperties:@"API_KEY_REPORT_STATUS"],
					 userId];
	NSLog(@"-- >> url = %@",url);
	
	NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];	
	[request setURL:[NSURL URLWithString:url]];
	[request setHTTPMethod:@"PUT"];
	[request addValue:@"application/xml" forHTTPHeaderField: @"Content-Type"];
	
	NSMutableData *body = [NSMutableData data];
	[body appendData:[[NSString stringWithFormat:@"<status><now_lat>%f</now_lat><now_lon>%f</now_lon></status>",
								location.latitude,
								location.longitude] dataUsingEncoding:NSUTF8StringEncoding]];
	[request setHTTPBody:body];
	
	// URLコネクションを作る
	[NSURLConnection connectionWithRequest:request delegate:self];
}

- (void)connection:(NSURLConnection*)connection
	didReceiveData:(NSData*)data
{
	NSLog(@"---- >>> connection start");
	char* p = (char*)[data bytes];
	int len = [data length];
	while (len-- > 0) {
		putchar(*p++);
	}
	NSLog(@"---- >>> %c", *p);
	NSLog(@"---- >>> connection end");
}

@end

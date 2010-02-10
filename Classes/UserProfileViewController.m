//
//  GroupTestViewController.m
//  SCOPEProject
//
//  Created by YOSHIDA Hiroyuki on 09/12/03.
//  Copyright __MyCompanyName__ 2009. All rights reserved.
//

#import "UserProfileViewController.h"
#import "MapViewController.h"
#import "AsyncImageView.h"
#import "UserXMLParser.h"

@implementation UserProfileViewController

@synthesize fullName;
@synthesize fullNameKana;
@synthesize mapBtn;
@synthesize userIcon;
@synthesize tblView;
@synthesize scrlView;

@synthesize sectionArray;
@synthesize groupName1;
@synthesize groupName2;
@synthesize groupName3;
@synthesize groupValue1;
@synthesize groupValue2;
@synthesize groupValue3;


// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
		
		sectionNum = 3;
		groupName1 = [[NSMutableArray alloc] initWithCapacity:3];
		[groupName1 addObject:@"電話"];
		[groupName1 addObject:@"アドレス"];
		[groupName1 addObject:@"住所"];
		groupName2 = [[NSMutableArray alloc] initWithCapacity:3];
		[groupName2 addObject:@"生年月日"];
		[groupName2 addObject:@"性別"];
		[groupName2 addObject:@"血液型"];
		groupName3 = [[NSMutableArray alloc] initWithCapacity:3];
		[groupName3 addObject:@"職業"];
		[groupName3 addObject:@"得意分野"];
		[groupName3 addObject:@"既往歴"];
		sectionArray = [[NSMutableArray alloc] initWithCapacity:3];
		[sectionArray addObject:groupName1];
		[sectionArray addObject:groupName2];
		[sectionArray addObject:groupName3];
		groupValue1 = [[NSMutableArray alloc] initWithCapacity:3];
		groupValue2 = [[NSMutableArray alloc] initWithCapacity:3];
		groupValue3 = [[NSMutableArray alloc] initWithCapacity:3];
    }
    return self;
}


/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/



// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	scrlView.pagingEnabled = NO;
	scrlView.contentSize = CGSizeMake(320, 500);
	scrlView.showsHorizontalScrollIndicator = NO;
	scrlView.showsVerticalScrollIndicator = NO;
	scrlView.scrollsToTop = YES;
	self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
	tblView.backgroundColor = [UIColor groupTableViewBackgroundColor];

}


- (void)requestUserInfo{
	// indicator visible
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
	
	NSError *parseError = nil;  
	UserXMLParser *userXMLParser = [[UserXMLParser alloc] init];
	NSString *url = [[NSString alloc]initWithFormat:@"%@%@?user_id=%@",
					 [self getProperties:@"SERVER"],
					 [self getProperties:@"API_KEY_USERS"],
					 userId];
	[userXMLParser parseXMLFileAtURL:[NSURL URLWithString:url] parseError:&parseError];
	NSMutableArray *items = [userXMLParser items];
	UserInfo *userInfo = [items objectAtIndex:0];
	fullName.text = userInfo.fullName;
	fullNameKana.text = userInfo.fullNameKana;
	[groupValue1 addObject:userInfo.tel];
	[groupValue1 addObject:userInfo.mail];
	[groupValue1 addObject:userInfo.address];
	[groupValue2 addObject:userInfo.birthday];
	[groupValue2 addObject:userInfo.sex];
	[groupValue2 addObject:userInfo.blood];
	[groupValue3 addObject:userInfo.job];
	[groupValue3 addObject:userInfo.goodField];
	[groupValue3 addObject:userInfo.medicalHistory];
	
	AsyncImageView *asyncImageView =[[AsyncImageView alloc] initWithFrame:CGRectMake(0,0,100,100)];
	NSString *imagePath = [[NSString alloc] initWithFormat:@"%@", userInfo.iconPath];
	[asyncImageView loadImage:imagePath];
	
	[userIcon addSubview:asyncImageView];
	[asyncImageView release];
	
	[url          release];
	[userXMLParser release];
	
	// indicator invisible
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

- (void) viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	[self requestUserInfo];
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
	[fullName     release];
	[fullNameKana release];
	[mapBtn       release];
	[userIcon     release];
	[tblView      release];
	[scrlView     release];
	
	[sectionArray release];
	[groupName1   release];
	[groupName2   release];
	[groupName3   release];
	[groupValue1  release];
	[groupValue2  release];
	[groupValue3  release];
    [super        dealloc];
}

-(IBAction)pushDownMapBtn:(id)sender{
	MapViewController *mapViewController = [[MapViewController alloc] initWithNibName:nil bundle:nil];
	mapViewController.userId  = userId;
	mapViewController.title = @"現在位置";
	[self.navigationController pushViewController:mapViewController animated:YES];
	[mapViewController release];
}
/*
-(IBAction)pushDownReportBtn:(id)sender{
	NSLog(@"----- >>> pushDownReportBtn");
	ReportViewController *reportViewController = [[ReportViewController alloc] initWithNibName:nil bundle:nil];
	reportViewController.userId  = userId;
	reportViewController.title = @"現状報告";
	[self.navigationController pushViewController:reportViewController animated:YES];
	[reportViewController release];
	
}
*/
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [sectionArray count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	NSInteger nubmerOfRows = 0;
	switch (section) {
		case 0:
			nubmerOfRows = [groupName1 count];
			break;
		case 1:
			nubmerOfRows = [groupName2 count];
			break;
		default:
			nubmerOfRows = [groupName3 count];
			break;
	}
    return nubmerOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:identifier] autorelease];
	}
    
	switch (indexPath.section) {
		case 0:
			cell.textLabel.text = [groupName1 objectAtIndex:indexPath.row];
			cell.detailTextLabel.text= [groupValue1 objectAtIndex:indexPath.row];
			break;
		case 1:
			cell.textLabel.text = [groupName2 objectAtIndex:indexPath.row];
			cell.detailTextLabel.text = [groupValue2 objectAtIndex:indexPath.row];
			break;
		default:
			cell.textLabel.text = [groupName3 objectAtIndex:indexPath.row];
			cell.detailTextLabel.text = [groupValue3 objectAtIndex:indexPath.row];
			break;
	}
    return cell;
}


@end

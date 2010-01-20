//
//  MapViewController.m
//  ScopeProject02
//
//  Created by ハイパー研 on 09/12/01.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "MapViewController.h"
#import "MapInfo.h"
#import "StatusInfo.h"
#import "StatusListXMLParser.h"
#import "MapXMLParser.h"
#import "AsyncImageView.h"
#import "MapInfoViewController.h"

#import "SCOPEProjectAppDelegate.h"

@implementation MapViewController

@synthesize mkMapView;

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
	NSLog(@"--- > MapViewController > viewDidLoad ");
	// 更新ボタン
	UIBarButtonItem *refreshButton = [[UIBarButtonItem alloc] 
									  initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
									  target:self 
									  action:@selector(reload:)
									  ];
	//	refreshButton.style = UIBarButtonItemStylePlain;
	self.navigationItem.rightBarButtonItem = refreshButton;
	[refreshButton release];
	
	
	// 既存の情報を削除
	if ([[mkMapView annotations] count] > 0) {
		[mkMapView removeAnnotations:mkMapView.annotations];
	}
	
	// 現在位置フラグ初期化
	// 遷移元判定
	if ([[self getMyTabBarTitle] isEqualToString:@"Map"]) {
		// タブバーのマップボタンで遷移
		NSLog(@"タブバーのマップボタンで遷移");
		userId = myUserId;
		locationFlag = TRUE;	
	} else {
		// ステータス詳細の位置ボタンで遷移
		NSLog(@"ステータス詳細の位置ボタンで遷移");
		NSLog(@"userId               = %@" ,userId);
		NSLog(@"scopeDelegate.userId = %@" ,myUserId);
		if ([userId isEqualToString:myUserId]) {
			// 自分が選択された
			NSLog(@"自分が選択された");
			locationFlag = TRUE;
		} else {
			NSLog(@"別のユーザが選択された");
			locationFlag = FALSE;
		}
	}
	
	if (locationFlag) {
		// 現在位置取得確認
		[self confirmGetLocation];		
	} else {
		[self showMap];
	}	
}

- (void)viewDidAppear:(BOOL)animated {
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


// 更新ボタンの処理
- (void)reload:(id)sender{
	[self viewDidLoad];
}

// 現在位置取得
- (void)getLocation{
	NSError *parseError = nil;  
	StatusListXMLParser *statusXmlParser = [[StatusListXMLParser alloc] init];
	NSString *url = [[NSString alloc]initWithFormat:@"%@%@?user_id=%@",
					 [self getProperties:@"SERVER"],
					 [self getProperties:@"API_KEY_STATUS"],
					 userId];
	
	[statusXmlParser parseXMLFileAtURL:[NSURL URLWithString:url] parseError:&parseError];
	
	NSMutableArray *items = [statusXmlParser items];
	StatusInfo *statusInfo = [items objectAtIndex:0];
	NSLog(@"---- > latitude  = %f",[statusInfo.nowLat doubleValue]);
	NSLog(@"---- > longitude = %f",[statusInfo.nowLon doubleValue]);
		
	if(statusInfo) {
		if (locationFlag) {
			// 現在位置情報取得
			[self getGpsLocation];
		} else{
			
			if ([statusInfo.nowLat doubleValue] && [statusInfo.nowLon doubleValue]) {
				location.latitude  = [statusInfo.nowLat doubleValue];
				location.longitude = [statusInfo.nowLon doubleValue];
			} else {
				// DBに位置情報がない
				if (!locationFlag) {
					// 本人でもない（ユーザIDが一致しない）
					// 選択されたユーザのグループまたは家族のデフォルトの位置を取得？
				}
			}
		}			
		MapInfo *userMapInfo = [[MapInfo alloc] initWithCoordinate:location];
		userMapInfo.posTitle = @"ココ";
		userMapInfo.posExplain = statusInfo.fullName;
		userMapInfo.picturePath = statusInfo.iconPath;
		userMapInfo.posKind = @"0";
		[mkMapView addAnnotation:userMapInfo];
		[userMapInfo release];		
	} else {
		// TODO エラー
		NSLog(@"現在位置を取得できませんでした。");
	}
	
	[url release];
	[statusXmlParser release];
	
}

- (void)alertView:(UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
	if (alertView.numberOfButtons == 1) {
		NSLog(@"ボタンは１つ");
		return;
	} else {
		NSLog(@"ボタンは2つ以上");
		if (buttonIndex == 1) {
			// OK
			locationFlag = TRUE;
		} else {
			// Cancel
			locationFlag = FALSE;
		}
	}
	// マップ表示
	[self showMap];
}

// 周辺情報取得(API取得)
- (void)getNeighborhoodInfo{
	
	NSError *parseError = nil;  
	MapXMLParser *mapXmlParser = [[MapXMLParser alloc] init];
	NSString *url = [[NSString alloc]initWithFormat:@"%@%@?group_id=%@",
					 [self getProperties:@"SERVER"],
					 [self getProperties:@"API_KEY_MAP"],
					 myGroupId];
	NSLog(@"----- ====== >>>> %@",url);
	[mapXmlParser parseXMLFileAtURL:[NSURL URLWithString:url] parseError:&parseError];
	mapItems = [mapXmlParser items];
	for (int i = 0; i < [mapItems count];i++) {
		// マップ情報
		[mkMapView addAnnotation:[mapItems objectAtIndex:i]];		
	}
	[url          release];
	[mapXmlParser release];
	
}

// マップ表示
- (void) showMap {
	NSLog(@"----- > showMap");
	// 現在位置取得
	[self getLocation];
	// 周辺情報
	[self getNeighborhoodInfo];
	
	MKCoordinateRegion region;
	MKCoordinateSpan   span;
	span.latitudeDelta  = 0.05;
	span.longitudeDelta = 0.05;
	region.span = span;
	
	// 位置設定
	region.center = location;	
	
	[mkMapView setRegion:region animated:FALSE];
	[mkMapView regionThatFits:region];
	
}

// 現在位置取得成功時の処理
- (void)locationManager:(CLLocationManager *)manager
	didUpdateToLocation:(CLLocation *)newLocation
		   fromLocation:(CLLocation *)oldLocation
{
	// 位置情報を取り出す
	location.latitude  = newLocation.coordinate.latitude;
	location.longitude = newLocation.coordinate.longitude;
	NSLog(@"---- > GPS latitude  = %f",location.latitude);
	NSLog(@"---- > GPS longitude = %f",location.longitude);
}

// Override
- (MKAnnotationView *) mapView:(MKMapView *)mapView viewForAnnotation:(id <MKAnnotation>) annotation{
    MKPinAnnotationView *annView=[[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"currentloc"];
	NSString *posKind = [(MapInfo *)annotation posKind];
		
	if ([posKind isEqualToString:@"0"]) {
		// ユーザ
		annView.pinColor = MKPinAnnotationColorRed;			
	} else if ([posKind isEqualToString:@"1"]){
		// 避難場所
		annView.pinColor = MKPinAnnotationColorGreen;
	} else {
		// その他
		annView.pinColor = MKPinAnnotationColorPurple;
	}
	annView.animatesDrop=YES;
	annView.canShowCallout = YES;
	annView.calloutOffset = CGPointMake(-5, 5);
	AsyncImageView *asyncImageView =[[AsyncImageView alloc] initWithFrame:CGRectMake(2,2,20,20)];
	[asyncImageView loadImage:[(MapInfo *)annotation picturePath]];
	annView.leftCalloutAccessoryView = asyncImageView;
	[asyncImageView release];
	UIButton *button = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
	annView.rightCalloutAccessoryView = button;
    return annView;

/*画像を配置する方法
	MKAnnotationView *annotationView;
	NSString* identifier = @"Pin";
	annotationView = (MKAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
	if(nil == annotationView) {
		annotationView = [[[MKAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:identifier] autorelease];
	}
	if([annotation isKindOfClass:[MapInfo class]]) {
//		annotationView.image = [UIImage imageNamed:@"some.png"]; //地図に表示したい画像を設定
		NSLog(@"---- >> MapInfo annotation %@",[(MapInfo *)annotation imagePath]);
		AsyncImageView *asyncImageView =[[AsyncImageView alloc] initWithFrame:CGRectMake(2,2,48,48)];
		[asyncImageView loadImage:[(MapInfo *)annotation imagePath]];
		
		[annotationView addSubview:asyncImageView];
		[asyncImageView release];
	}
	return annotationView;
*/
}


- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control{
	NSLog(@"tap tap");
	// 次の画面で画像表示またはこの画面でModalViewに画像表示
	NSLog(@"---> mapView -- > %@", [(MapInfo *)view.annotation picturePath]);
	MapInfoViewController *mapInfoViewController = [[MapInfoViewController alloc] initWithImagePath:[(MapInfo *)view.annotation picturePath]];
	mapInfoViewController.title = @"詳細画像";
	[self.navigationController pushViewController:mapInfoViewController animated:YES];
	
}

- (void)dealloc {
	[mkMapView       release];
    [super           dealloc];
}



@end

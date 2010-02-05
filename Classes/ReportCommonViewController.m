//
//  ReportCommonViewController.m
//  SCOPEProject
//
//  Created by ハイパー研 on 09/12/21.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "ReportCommonViewController.h"


@implementation ReportCommonViewController

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

// put用
- (void)report:(NSString *)key value:(NSString *)value{
	
	// indicator visible
	[UIApplication sharedApplication].networkActivityIndicatorVisible = YES;

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
	[body appendData:[[NSString stringWithFormat:@"<status><%@>%@</%@></status>",key,value,key] dataUsingEncoding:NSUTF8StringEncoding]];
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
	
	// indicator invisible
	[UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
}

@end

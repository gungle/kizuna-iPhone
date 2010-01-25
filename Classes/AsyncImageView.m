//
//  AsyncImageView.m
//  ScopeProject
//
//  Created by YOSHIDA Hiroyuki on 09/11/26.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "AsyncImageView.h"


@implementation AsyncImageView


-(void)loadImage:(NSString *)url {
	[self abort];
	imageData = [[NSMutableData alloc] initWithCapacity:0];

	NSURLRequest *request = [NSURLRequest 
							 requestWithURL:[NSURL URLWithString:url] 
							 cachePolicy:NSURLRequestUseProtocolCachePolicy
							 timeoutInterval:30.0];
	connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
	[imageData setLength:0];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)nsdata {
	[imageData appendData:nsdata];	
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
	[self abort];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
	self.contentMode = UIViewContentModeScaleAspectFit;
	self.autoresizingMask = UIViewAutoresizingFlexibleWidth || UIViewAutoresizingFlexibleHeight;		

	self.image = [UIImage imageWithData:imageData];
	
	[self abort];
}

-(void)abort{
	if(connection != nil){
		[connection cancel];
		[connection release];
		connection = nil;
	}
	if(imageData != nil){
		[imageData release];
		imageData = nil;
	}
}

- (void)dealloc {
	[connection cancel];
    [connection release];
    [imageData release];
    [super dealloc];
}
@end

//
//  TweetInfo.m
//  Cells2
//
//  Created by 菊池　達哉 on 09/12/16.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TweetInfo.h"


@implementation TweetInfo

@synthesize tweetId;
@synthesize groupId;
@synthesize parentId;
@synthesize userId;
@synthesize fullName;
@synthesize iconPath;
@synthesize tweet;
@synthesize tweetLat;	
@synthesize tweetLon;
@synthesize picturePath;
@synthesize createdAt;
@synthesize updatedAt;


- (void)dealloc {
	[tweetId        release];
	[groupId        release];
	[parentId       release];
	[userId         release];
	[fullName       release];
	[iconPath       release];
	[tweet          release];
	[tweetLat       release];
	[tweetLon       release];
	[picturePath    release];
	[createdAt      release];
	[updatedAt      release];
	[super        dealloc];
}
@end

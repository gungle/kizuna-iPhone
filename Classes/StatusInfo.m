//-------------------------------------------------------------
//
//  StatusInfo.m
//  ScopeProject
//
//  Created by YOSHIDA Hiroyuki on 09/11/20.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//
//-------------------------------------------------------------

#import "StatusInfo.h"


@implementation StatusInfo

@synthesize groupId;
@synthesize userId;
@synthesize fullName;
@synthesize fullNameKana;
@synthesize status;
@synthesize position;
@synthesize note;
@synthesize nowLat;
@synthesize nowLon;
@synthesize createdAt;
@synthesize updatedAt;
@synthesize iconPath;
@synthesize imageData;

- (void)dealloc {
	[groupId      release];
	[userId       release];
	[fullName     release];
	[fullNameKana release];
	[status       release];
	[position     release];
	[note         release];
	[nowLat       release];
	[nowLon       release];
	[createdAt    release];
	[updatedAt    release];
	[iconPath     release];
	[imageData    release];
	[super        dealloc];
}

@end

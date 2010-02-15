//
//  UserInfo.m
//  SCOPEProject
//
//  Created by YOSHIDA Hiroyuki on 09/12/18.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "UserInfo.h"


@implementation UserInfo

@synthesize groupId;
@synthesize familyId;
@synthesize userId;
@synthesize fullName;
@synthesize fullNameKana;
@synthesize address;
@synthesize birthday;
@synthesize age;
@synthesize sex;
@synthesize blood;
@synthesize tel;
@synthesize mail;
@synthesize job;
@synthesize goodField;
@synthesize medicalHistory;
@synthesize createdAt;
@synthesize updatedAt;
@synthesize iconPath;
@synthesize imageData;

- (void)dealloc {
	[groupId        release];
	[familyId       release];
	[userId         release];
	[fullName       release];
	[fullNameKana   release];
	[address        release];
	[birthday       release];
	[age            release];
	[sex            release];
	[blood          release];
	[tel            release];
	[mail           release];
	[job            release];
	[goodField      release];
	[medicalHistory release];
	[createdAt      release];
	[updatedAt      release];
	[iconPath       release];
	[imageData      release];
	[super          dealloc];
}
@end

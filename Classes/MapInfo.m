//
//  MapInfo.m
//  ScopeProject02
//
//  Created by ハイパー研 on 09/12/02.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "MapInfo.h"


@implementation MapInfo

@synthesize mapId;
@synthesize groupId;
@synthesize posTitle;
@synthesize posExplain;
@synthesize posKind;
@synthesize posLat;
@synthesize posLon;
@synthesize picturePath;
@synthesize createdAt;
@synthesize updatedAt;
@synthesize coordinate;

-(id)initWithCoordinate:(CLLocationCoordinate2D) c{
	coordinate=c;
	return self;
}

- (NSString *)subtitle{
	return posExplain;
}

- (NSString *)title{
	return posTitle;
}

-(void)setCoordinate{
	coordinate.latitude = [posLat doubleValue];	
	coordinate.longitude= [posLon doubleValue];	
}
-(void)setCoordinate:(CLLocationCoordinate2D)coordinateVal {
	coordinate = coordinateVal;
}


- (void)dealloc {
	[mapId        release];
	[groupId      release];
	[posTitle     release];
	[posExplain   release];
	[posKind      release];
	[posLat       release];
	[posLon       release];
	[picturePath  release];
	[createdAt    release];
	[updatedAt    release];
	[super        dealloc];
}
@end

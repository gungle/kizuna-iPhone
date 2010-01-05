//
//  PropertiesUtil.m
//  SCOPEProject
//
//  Created by ハイパー研 on 09/12/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "PropertiesUtil.h"


@implementation PropertiesUtil


+(NSString *)getProperties:(NSString *)key{
	NSString *scopePlist = [[NSBundle mainBundle]pathForResource:@"scope" ofType:@"plist"];
	NSDictionary *scopeDict = [NSDictionary dictionaryWithContentsOfFile:scopePlist];
	return [scopeDict objectForKey:key];
}


- (void)dealloc {
    [super dealloc];
}


@end

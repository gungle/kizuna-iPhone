//
//  LoginXmlParser.h
//  SCOPEProject
//
//  Created by YOSHIDA Hiroyuki on 09/12/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMLParser.h"

#define ELEMENT_NAME_LOGIN    @"login"
#define ELEMENT_NAME_USER     @"user"
#define ELEMENT_NAME_GROUP_ID @"group_id"
#define ELEMENT_NAME_USER_ID  @"user_id"

@interface LoginXMLParser : XMLParser {
	NSString *groupId;		 // グループID
	NSString *userId;		 // ユーザID
}

@property (nonatomic, retain) NSString *groupId;
@property (nonatomic, retain) NSString *userId;

@end

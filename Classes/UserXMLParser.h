//
//  UserXMLParser.h
//  SCOPEProject
//
//  Created by YOSHIDA Hiroyuki on 09/12/18.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMLParser.h"
#import "UserInfo.h"

#define ELEMENT_NAME_USERS           @"users"
#define ELEMENT_NAME_USER            @"user"
#define ELEMENT_NAME_ID              @"id"
#define ELEMENT_NAME_FAMILY_ID       @"family_id"
#define ELEMENT_NAME_FULL_NAME       @"full_name"
#define ELEMENT_NAME_FULL_NAME_KANA  @"full_name_kana"
#define ELEMENT_NAME_ADDRESS         @"address"
#define ELEMENT_NAME_BIRTHDAY        @"birthday"
#define ELEMENT_NAME_AGE             @"age"
#define ELEMENT_NAME_SEX             @"sex"
#define ELEMENT_NAME_BLOOD           @"blood"
#define ELEMENT_NAME_TEL             @"tel"
#define ELEMENT_NAME_MAIL            @"mail"
#define ELEMENT_NAME_JOB             @"job"
#define ELEMENT_NAME_GOOD_FIELD      @"good_field"
#define ELEMENT_NAME_MEDICAL_HISTORY @"medical_history"
#define ELEMENT_NAME_ICON_PATH       @"icon_path"
#define ELEMENT_NAME_CREATED_AT      @"created_at"
#define ELEMENT_NAME_UPDATED_AT      @"updated_at"

@interface UserXMLParser : XMLParser {
	UserInfo        *userInfo;
}

@end

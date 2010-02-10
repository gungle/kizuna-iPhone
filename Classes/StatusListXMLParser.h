//-------------------------------------------------------------
//
//  StatusListXMLParser.h
//  SCOPEroject
//
//  Created by YOSHIDA Hiroyuki on 09/11/20.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//
//-------------------------------------------------------------

#import <Foundation/Foundation.h>
#import "XMLParser.h"
#import "StatusInfo.h"

#define ELEMENT_NAME_STATUS_0        @"status"
#define ELEMENT_NAME_ID              @"id"
#define ELEMENT_NAME_USER_ID         @"user_id"
#define ELEMENT_NAME_FULL_NAME       @"full_name"
#define ELEMENT_NAME_FULL_NAME_KANA  @"full_name_kana"
#define ELEMENT_NAME_POSITION        @"position"
#define ELEMENT_NAME_STATUS          @"status"
#define ELEMENT_NAME_NOW_LAT         @"now_lat"
#define ELEMENT_NAME_NOW_LON         @"now_lon"
#define ELEMENT_NAME_PUBLIC_FLAG     @"public_flag"
#define ELEMENT_NAME_NOTE            @"note"
#define ELEMENT_NAME_ICON_PATH       @"icon_path"
#define ELEMENT_NAME_CREATED_AT      @"created_at"
#define ELEMENT_NAME_UPDATED_AT      @"updated_at"


@interface StatusListXMLParser : XMLParser {
	StatusInfo        *statusInfo;
	bool			   statusFlag;
}

@end

//
//  MapXMLParser.h
//  SCOPEProject
//
//  Created by ハイパー研 on 09/12/10.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMLParser.h"
#import "MapInfo.h"
	
#define ELEMENT_NAME_MAPS         @"masp"
#define ELEMENT_NAME_MAP          @"map"
#define ELEMENT_NAME_ID           @"id"
#define ELEMENT_NAME_GROUP_ID     @"group_id"
#define ELEMENT_NAME_POS_TITLE    @"pos_title"
#define ELEMENT_NAME_POS_EXPLAIN  @"pos_explain"
#define ELEMENT_NAME_POS_KIND     @"pos_kind"
#define ELEMENT_NAME_POS_LAT      @"pos_lat"
#define ELEMENT_NAME_POS_LON      @"pos_lon"
#define ELEMENT_NAME_PICTURE_PATH @"picture_path"
#define ELEMENT_NAME_CREATED_AT   @"created_at"
#define ELEMENT_NAME_UPDATED_AT   @"updated_at"
	
	
@interface MapXMLParser : XMLParser {
	MapInfo        *mapInfo;
}
	
@end

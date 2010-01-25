//
//  MapXMLParser.m
//  SCOPEProject
//
//  Created by YOSHIDA Hiroyuki on 09/12/10.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "MapXMLParser.h"


@implementation MapXMLParser

- (void)parseXMLFileAtURL:(NSURL *)url parseError:(NSError **)error{
	[super parseXMLFileAtURL:url parseError:error];
}

- (void)dealloc {
	[super dealloc];
}

// エレメント開始ハンドラ
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict
{
    if (qualifiedName) {
        elementName = qualifiedName;
    }
	
    if ([elementName isEqualToString:ELEMENT_NAME_MAP]) {
		// マップ情報データ生成
		mapInfo = [[MapInfo alloc] init];
	} else {		
		nodeContent = [[NSMutableString alloc] initWithCapacity:0];
		nodeName = [elementName copy];
/*
		if ([elementName isEqualToString:ELEMENT_NAME_ID]) {
		} else if ([elementName isEqualToString:ELEMENT_NAME_GROUP_ID]) {
		} else if ([elementName isEqualToString:ELEMENT_NAME_POS_TITLE]) {
		} else if ([elementName isEqualToString:ELEMENT_NAME_POS_EXPLAIN]) {
		} else if ([elementName isEqualToString:ELEMENT_NAME_POS_KIND]) {
		} else if ([elementName isEqualToString:ELEMENT_NAME_POS_LAT]) {
		} else if ([elementName isEqualToString:ELEMENT_NAME_POS_LON]) {
		} else if ([elementName isEqualToString:ELEMENT_NAME_PICTURE_PATH]) {
		} else if ([elementName isEqualToString:ELEMENT_NAME_CREATED_AT]) {
		} else if ([elementName isEqualToString:ELEMENT_NAME_UPDATED_AT]) {
		}
 */
	}
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string  
{  
//	NSLog(@"----- > %@ end",string);
    // エレメントの文字データを string で取得
	if (![nodeName isEqualToString:ELEMENT_NAME_MAPS]
		&& ![nodeName isEqualToString:ELEMENT_NAME_MAP]) {

		[nodeContent appendString:string];
	}
	
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName
{
    // エレメント終了ハンドラ
    if (qualifiedName) {
        elementName = qualifiedName;
    }
	
    if ([elementName isEqualToString:ELEMENT_NAME_MAP]) {
		[mapInfo setCoordinate];
		[items addObject:mapInfo];
		[mapInfo release];
		mapInfo = nil;
	} else {
		
		if ([elementName isEqualToString:ELEMENT_NAME_ID]) {
			[mapInfo setMapId:nodeContent];
		} else if ([elementName isEqualToString:ELEMENT_NAME_GROUP_ID]) {
			[mapInfo setGroupId:nodeContent];
		} else if ([elementName isEqualToString:ELEMENT_NAME_POS_TITLE]) {
			[mapInfo setPosTitle:nodeContent];
		} else if ([elementName isEqualToString:ELEMENT_NAME_POS_EXPLAIN]) {
			[mapInfo setPosExplain:nodeContent];
		} else if ([elementName isEqualToString:ELEMENT_NAME_POS_KIND]) {
			[mapInfo setPosKind:nodeContent];
		} else if ([elementName isEqualToString:ELEMENT_NAME_POS_LAT]) {
			[mapInfo setPosLat:nodeContent];
//			mapInfo.coordinate.latitude = (CLLocationDegrees)[nodeContent doubleValue];
		} else if ([elementName isEqualToString:ELEMENT_NAME_POS_LON]) {
			[mapInfo setPosLon:nodeContent];
//			mapInfo.coordinate.longitude = (CLLocationDegrees)[nodeContent doubleValue];
		} else if ([elementName isEqualToString:ELEMENT_NAME_PICTURE_PATH]) {
			[mapInfo setPicturePath:nodeContent];
		} else if ([elementName isEqualToString:ELEMENT_NAME_CREATED_AT]) {
			[mapInfo setCreatedAt:nodeContent];
		} else if ([elementName isEqualToString:ELEMENT_NAME_UPDATED_AT]) {
			[mapInfo setUpdatedAt:nodeContent];
		}
		[nodeContent release];
		nodeContent = nil;
	}
	[nodeName release];
	nodeName = nil;
}

@end

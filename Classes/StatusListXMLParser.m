//-------------------------------------------------------------
//
//  StatusListXMLParser.m
//  SCOPEroject
//
//  Created by YOSHIDA Hiroyuki on 09/11/20.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//
//-------------------------------------------------------------

#import "StatusListXMLParser.h"

@implementation StatusListXMLParser

- (void)parseXMLFileAtURL:(NSURL *)url parseError:(NSError **)error{
	[super parseXMLFileAtURL:url parseError:error];
	statusFlag = FALSE;
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
//	NSLog(@"----- > %@ start",elementName);

    if ([elementName isEqualToString:ELEMENT_NAME_STATUS] && !statusFlag) {
		// ステータス情報データ生成
		statusInfo = [[StatusInfo alloc] init];
		statusFlag = TRUE;
	} else {		
		nodeContent = [[NSMutableString alloc] initWithCapacity:0];
		nodeName = [elementName copy];
		if ([elementName isEqualToString:ELEMENT_NAME_ID]) {
		} else if ([elementName isEqualToString:ELEMENT_NAME_USER_ID]) {
		} else if ([elementName isEqualToString:ELEMENT_NAME_FULL_NAME]) {
		} else if ([elementName isEqualToString:ELEMENT_NAME_FULL_NAME_KANA]) {
		} else if ([elementName isEqualToString:ELEMENT_NAME_POSITION]) {
		} else if ([elementName isEqualToString:ELEMENT_NAME_STATUS] && statusFlag) {
		} else if ([elementName isEqualToString:ELEMENT_NAME_NOW_LAT]) {
		} else if ([elementName isEqualToString:ELEMENT_NAME_NOW_LON]) {
		} else if ([elementName isEqualToString:ELEMENT_NAME_NOTE]) {
		} else if ([elementName isEqualToString:ELEMENT_NAME_ICON_PATH]) {
		} else if ([elementName isEqualToString:ELEMENT_NAME_CREATED_AT]) {
		} else if ([elementName isEqualToString:ELEMENT_NAME_UPDATED_AT]) {
		}
	}
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string  
{  
//	NSLog(@"----- > %@ end",string);
    // エレメントの文字データを string で取得
	if ([nodeName isEqualToString:ELEMENT_NAME_STATUS_0] && !statusFlag) {
	} else {
		[nodeContent appendString:string];
	}

	/*
    if ([nodeName isEqualToString:ELEMENT_NAME_STATUS_0]) {
	} else if ([nodeName isEqualToString:ELEMENT_NAME_ID]) {
	} else if ([nodeName isEqualToString:ELEMENT_NAME_USER_ID]) {
	} else if ([nodeName isEqualToString:ELEMENT_NAME_FULL_NAME]) {
		[statusInfo setFullName:string];
	} else if ([nodeName isEqualToString:ELEMENT_NAME_FULL_NAME_KANA]) {
		[statusInfo setFullNameKana:string];
	} else if ([nodeName isEqualToString:ELEMENT_NAME_POSITION]) {
		[statusInfo setPosition:string];
	} else if ([nodeName isEqualToString:ELEMENT_NAME_STATUS]) {
		[statusInfo setStatus:string];
	} else if ([nodeName isEqualToString:ELEMENT_NAME_NOW_LAT]) {
		[statusInfo setNowLat:string];
	} else if ([nodeName isEqualToString:ELEMENT_NAME_NOW_LON]) {
		[statusInfo setNowLon:string];
	} else if ([nodeName isEqualToString:ELEMENT_NAME_NOTE]) {
		[statusInfo setNote:string];
	} else if ([nodeName isEqualToString:ELEMENT_NAME_ICON_PATH]) {
		[statusInfo setIconPath:string];
	} else if ([nodeName isEqualToString:ELEMENT_NAME_CREATED_AT]) {
		[statusInfo setCreatedAt:string];
	} else if ([nodeName isEqualToString:ELEMENT_NAME_UPDATED_AT]) {
		[statusInfo setUpdatedAt:string];
	}
	 */
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName
{
    // エレメント終了ハンドラ
    if (qualifiedName) {
        elementName = qualifiedName;
    }
	
//	NSLog(@"----- > %@ end",elementName);
    if ([elementName isEqualToString:ELEMENT_NAME_STATUS_0] && !statusFlag) {
		[items addObject:statusInfo];
		[statusInfo release];
		statusInfo = nil;
	} else {
		
		if ([elementName isEqualToString:ELEMENT_NAME_ID]) {
			[statusInfo setGroupId:nodeContent];
		} else if ([elementName isEqualToString:ELEMENT_NAME_USER_ID]) {
			[statusInfo setUserId:nodeContent];
		} else if ([elementName isEqualToString:ELEMENT_NAME_FULL_NAME]) {
			[statusInfo setFullName:nodeContent];
		} else if ([elementName isEqualToString:ELEMENT_NAME_FULL_NAME_KANA]) {
			[statusInfo setFullNameKana:nodeContent];
		} else if ([elementName isEqualToString:ELEMENT_NAME_POSITION]) {
			[statusInfo setPosition:nodeContent];
//			[statusInfo setPosition:@"その他"];
		} else if ([elementName isEqualToString:ELEMENT_NAME_STATUS] && statusFlag) {
			[statusInfo setStatus:nodeContent];
//			[statusInfo setStatus:@"避難中"];
			statusFlag = FALSE;
		} else if ([elementName isEqualToString:ELEMENT_NAME_NOW_LAT]) {
			[statusInfo setNowLat:nodeContent];
		} else if ([elementName isEqualToString:ELEMENT_NAME_NOW_LON]) {
			[statusInfo setNowLon:nodeContent];
		} else if ([elementName isEqualToString:ELEMENT_NAME_NOTE]) {
			[statusInfo setNote:nodeContent];
		} else if ([elementName isEqualToString:ELEMENT_NAME_ICON_PATH]) {
			[statusInfo setIconPath:nodeContent];
		} else if ([elementName isEqualToString:ELEMENT_NAME_CREATED_AT]) {
			[statusInfo setCreatedAt:nodeContent];
		} else if ([elementName isEqualToString:ELEMENT_NAME_UPDATED_AT]) {
			[statusInfo setUpdatedAt:nodeContent];
		}
		[nodeContent release];
		nodeContent = nil;
	}
	[nodeName release];
	nodeName = nil;
}

@end

//
//  UserXMLParser.m
//  SCOPEProject
//
//  Created by ハイパー研 on 09/12/18.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "UserXMLParser.h"


@implementation UserXMLParser

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
	if ([elementName isEqualToString:ELEMENT_NAME_USERS]) {
		// 何もしない
	} else if ([elementName isEqualToString:ELEMENT_NAME_USER]) {
		// ユーザ情報データ生成
		userInfo = [[UserInfo alloc] init];
	} else {		
		nodeContent = [[NSMutableString alloc] initWithCapacity:0];
		nodeName = [elementName copy];
/*
		if ([elementName isEqualToString:ELEMENT_NAME_ID]) {
		} else if ([elementName isEqualToString:ELEMENT_NAME_FAMILY_ID]) {
		} else if ([elementName isEqualToString:ELEMENT_NAME_FULL_NAME]) {
		} else if ([elementName isEqualToString:ELEMENT_NAME_FULL_NAME_KANA]) {
		} else if ([elementName isEqualToString:ELEMENT_NAME_BIRTHDAY]) {
		} else if ([elementName isEqualToString:ELEMENT_NAME_SEX]) {
		} else if ([elementName isEqualToString:ELEMENT_NAME_BLOOD]) {
		} else if ([elementName isEqualToString:ELEMENT_NAME_TEL]) {
		} else if ([elementName isEqualToString:ELEMENT_NAME_MAIL]) {
		} else if ([elementName isEqualToString:ELEMENT_NAME_JOB]) {
		} else if ([elementName isEqualToString:ELEMENT_NAME_GOOD_FIELD]) {
		} else if ([elementName isEqualToString:ELEMENT_NAME_MEDICAL_HISTORY]) {
		} else if ([elementName isEqualToString:ELEMENT_NAME_ICON_PATH]) {
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
	if (![nodeName isEqualToString:ELEMENT_NAME_USERS]
		&& ![nodeName isEqualToString:ELEMENT_NAME_USER]) {
		[nodeContent appendString:string];
	}
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName
{
    // エレメント終了ハンドラ
    if (qualifiedName) {
        elementName = qualifiedName;
    }
	
	//	NSLog(@"----- > %@ end",elementName);
    if ([elementName isEqualToString:ELEMENT_NAME_USERS]) {
	} else if ([elementName isEqualToString:ELEMENT_NAME_USER]) {
		[items addObject:userInfo];
		[userInfo release];
		userInfo = nil;
	} else {
		
		if ([elementName isEqualToString:ELEMENT_NAME_ID]) {
			[userInfo setUserId:nodeContent];
		} else if ([elementName isEqualToString:ELEMENT_NAME_FAMILY_ID]) {
			[userInfo setFamilyId:nodeContent];
		} else if ([elementName isEqualToString:ELEMENT_NAME_FULL_NAME]) {
			[userInfo setFullName:nodeContent];
		} else if ([elementName isEqualToString:ELEMENT_NAME_FULL_NAME_KANA]) {
			[userInfo setFullNameKana:nodeContent];
		} else if ([elementName isEqualToString:ELEMENT_NAME_ADDRESS]) {
			[userInfo setAddress:nodeContent];
		} else if ([elementName isEqualToString:ELEMENT_NAME_BIRTHDAY]) {
			[userInfo setBirthday:nodeContent];
		} else if ([elementName isEqualToString:ELEMENT_NAME_SEX]) {
			[userInfo setSex:nodeContent];
		} else if ([elementName isEqualToString:ELEMENT_NAME_BLOOD]) {
			[userInfo setBlood:nodeContent];
		} else if ([elementName isEqualToString:ELEMENT_NAME_TEL]) {
			[userInfo setTel:nodeContent];
		} else if ([elementName isEqualToString:ELEMENT_NAME_MAIL]) {
			[userInfo setMail:nodeContent];
		} else if ([elementName isEqualToString:ELEMENT_NAME_JOB]) {
			[userInfo setJob:nodeContent];
		} else if ([elementName isEqualToString:ELEMENT_NAME_GOOD_FIELD]) {
			[userInfo setGoodField:nodeContent];
		} else if ([elementName isEqualToString:ELEMENT_NAME_MEDICAL_HISTORY]) {
			[userInfo setMedicalHistory:nodeContent];
		} else if ([elementName isEqualToString:ELEMENT_NAME_ICON_PATH]) {
			[userInfo setIconPath:nodeContent];
		} else if ([elementName isEqualToString:ELEMENT_NAME_CREATED_AT]) {
			[userInfo setCreatedAt:nodeContent];
		} else if ([elementName isEqualToString:ELEMENT_NAME_UPDATED_AT]) {
			[userInfo setUpdatedAt:nodeContent];
		}
		[nodeContent release];
		nodeContent = nil;
	}
	[nodeName release];
	nodeName = nil;
}

@end

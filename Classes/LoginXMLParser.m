//
//  LoginXmlParser.m
//  SCOPEProject
//
//  Created by ハイパー研 on 09/12/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "LoginXMLParser.h"

@implementation LoginXMLParser

@synthesize groupId;
@synthesize userId;

- (void)dealloc {
	NSLog(@"dealloc ");
	[groupId release];
	[userId  release];
    [super   dealloc];
}

// エレメント開始ハンドラ
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict
{
    if (qualifiedName) {
        elementName = qualifiedName;
    }
	
    if ([elementName isEqualToString:ELEMENT_NAME_RESULT]
		|| [elementName isEqualToString:ELEMENT_NAME_MESSAGE]
		|| [elementName isEqualToString:ELEMENT_NAME_GROUP_ID]
		|| [elementName isEqualToString:ELEMENT_NAME_USER_ID]) {
		nodeContent = [[NSMutableString alloc] initWithCapacity:0];
	}
	nodeName = [elementName copy];
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string  
{  
    if ([nodeName isEqualToString:ELEMENT_NAME_RESULT]
		|| [nodeName isEqualToString:ELEMENT_NAME_MESSAGE]
		|| [nodeName isEqualToString:ELEMENT_NAME_GROUP_ID]
		|| [nodeName isEqualToString:ELEMENT_NAME_USER_ID]) {
		// エレメントの文字データを string で取得
		[nodeContent appendString:string];
	}
	
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName
{
    // エレメント終了ハンドラ
    if (qualifiedName) {
        elementName = qualifiedName;
    }
	
	if (![elementName isEqualToString:ELEMENT_NAME_LOGIN]
		&& ![elementName isEqualToString:ELEMENT_NAME_USER]) {

		if ([elementName isEqualToString:ELEMENT_NAME_RESULT]) {
			result = [[NSString alloc]initWithString:nodeContent];			
		} else if ([elementName isEqualToString:ELEMENT_NAME_MESSAGE]) {
			// エラーの場合
			message = [[NSString alloc]initWithString:nodeContent];
			NSLog(@"%@", message);
		} else if ([elementName isEqualToString:ELEMENT_NAME_GROUP_ID]) {
			groupId = [[NSString alloc]initWithString:nodeContent];
		} else if ([elementName isEqualToString:ELEMENT_NAME_USER_ID]) {
			userId = [[NSString alloc]initWithString:nodeContent];
		}
		[nodeContent release];
		nodeContent = nil;
	}
	
	[nodeName release];
	nodeName = nil;
}

@end

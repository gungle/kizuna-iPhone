//
//  TweetListXMLParser.m
//  SCOPEroject
//
//  Created by 菊池　達哉 on 09/12/16.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "TweetListXMLParser.h"


@implementation TweetListXMLParser

- (void)dealloc {
	[tweetInfo release];
	[super dealloc];
}


// エレメント開始ハンドラ
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict
{
//	NSLog(@"------ >>>>> didStartElement");    // エレメント開始ハンドラ  
	
    if (qualifiedName) {
        elementName = qualifiedName;
    }


    if ([elementName isEqualToString:ELEMENT_NAME_TWEET_0]) {
		// 1つのつぶやきの開始
		tweetInfo = [[TweetInfo alloc] init];
	} else {
		// タグ
		nodeContent = [[NSMutableString alloc] initWithCapacity:0];
		nodeName = [elementName copy];
	}

}

// 該当エントリ発見時の処理
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string  
{  
//	NSLog(@"------ >>>>> foundCharacters");
	
//	unichar c = [string characterAtIndex:[string length]-1];
	unichar c = [string characterAtIndex:0];	
	
	if (c != 10) {			// 超暫定処置（最初の文字が改行でなければ追記）★
//NSLog(@"------ >>>>> %@", string);
		// エレメントの文字データを string で取得
		[nodeContent appendString:string];
	}
}

// エレメント終了
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName
{
//	NSLog(@"------ >>>>> didEndElement");
	
    // エレメント終了ハンドラ
    if (qualifiedName) {
        elementName = qualifiedName;
    }
	
	if ([elementName isEqualToString:ELEMENT_NAME_TWEET_0] && tweetInfo != nil){	
												// 1つのつぶやきが終わり
		[items addObject:tweetInfo];			// itemsにデータをコピー
		[tweetInfo release];
		tweetInfo = nil;
		
	} else {									// 各タグの終了

		if ([nodeName isEqualToString:ELEMENT_NAME_ID]) {
			[tweetInfo setTweetId:nodeContent];		
		}
		else if ([nodeName isEqualToString:ELEMENT_NAME_GROUP_ID]) {
			[tweetInfo setGroupId:nodeContent];		
		}
		else if ([nodeName isEqualToString:ELEMENT_NAME_PARENT_ID]) {
			[tweetInfo setParentId:nodeContent];		
		}
		else if ([nodeName isEqualToString:ELEMENT_NAME_USER_ID]) {
			[tweetInfo setUserId:nodeContent];		
		}
		else if ([nodeName isEqualToString:ELEMENT_NAME_FULL_NAME]) {
			[tweetInfo setFullName:nodeContent];		
		}
		else if ([nodeName isEqualToString:ELEMENT_NAME_ICON_PATH]) {
			[tweetInfo setIconPath:nodeContent];		
		}
		else if ([nodeName isEqualToString:ELEMENT_NAME_TWEET_DATA]) {
			[tweetInfo setTweet:nodeContent];		
		}
		else if ([nodeName isEqualToString:ELEMENT_NAME_TWEET_LAT]) {
			[tweetInfo setTweetLat:nodeContent];		
		}
		else if ([nodeName isEqualToString:ELEMENT_NAME_TWEET_LON]) {
			[tweetInfo setTweetLon:nodeContent];		
		}
		else if ([nodeName isEqualToString:ELEMENT_NAME_PICTURE_PATH]) {
			[tweetInfo setPicturePath:nodeContent];		
		}
		else if ([nodeName isEqualToString:ELEMENT_NAME_CREATED_AT]) {
			[tweetInfo setCreatedAt:nodeContent];		
		}
		else if ([nodeName isEqualToString:ELEMENT_NAME_UPDATED_AT]) {
			[tweetInfo setUpdatedAt:nodeContent];		
		}
		
		
	}
	
	// Curentoのエレメント名を破棄
	[nodeName release];
	nodeName = nil;	

}

@end

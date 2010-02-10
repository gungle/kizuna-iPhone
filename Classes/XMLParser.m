//-------------------------------------------------------------
//
//  XMLParser.m
//  SCOPEroject
//
//  Created by YOSHIDA Hiroyuki on 09/11/20.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//
//-------------------------------------------------------------

#import "XMLParser.h"
#import "StatusInfo.h"
#import "PropertiesUtil.h"

@implementation XMLParser

@synthesize items;
@synthesize result;
@synthesize message;

- (void)dealloc {
	[items       release];
	[parser      release];
	[nodeName    release];
	[nodeContent release];
	[result      release];
	[message     release];
	[super       dealloc];
}

- (void)parseXMLFileAtURL:(NSURL *)url parseError:(NSError **)error
{
	items = [[NSMutableArray alloc] initWithCapacity:0];
	parser = [[NSXMLParser alloc] initWithContentsOfURL:url];
	[parser setDelegate:self];
	[parser setShouldProcessNamespaces:NO];
	[parser setShouldReportNamespacePrefixes:NO];
	[parser setShouldResolveExternalEntities:NO];
	[parser parse];
	NSError *parseError = [parser parserError];
	if (parseError && error) {
		*error = parseError;
	}
//	[parser release];
	
}

- (void)parserDidStartDocument:(NSXMLParser *)parser
{
	// 解析開始時に実行する処理
}

- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName attributes:(NSDictionary *)attributeDict
{
    // エレメント開始ハンドラ
    if ([elementName isEqualToString:ELEMENT_NAME_RESULT]) {
		// 実行結果
	} else if ([elementName isEqualToString:ELEMENT_NAME_MESSAGE]) {
		// メッセージ
	}
	nodeName = elementName;
//	NSLog(@"----- > %@ start",elementName);

}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qualifiedName
{
    // エレメント終了ハンドラ
    if ([elementName isEqualToString:ELEMENT_NAME_RESULT]) {
		// 実行結果
	} else if ([elementName isEqualToString:ELEMENT_NAME_MESSAGE]) {
		// メッセージ
	}
//	NSLog(@"----- > %@ end",elementName);
}
	

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string  
{  
    // エレメントの文字データを string で取得  
    if ([nodeName isEqualToString:ELEMENT_NAME_RESULT]) {
		// 実行結果
	} else if ([nodeName isEqualToString:ELEMENT_NAME_MESSAGE]) {
		// メッセージ
	}
//	NSLog(@"----- > %@ end",nodeName);
}

- (void)parserDidEndDocument:(NSXMLParser *)parser
{
	// 解析終了時に実行する処理
}


//- (void)authenticate:(NSString *)loginId password:(NSString *)password {
- (void)authenticate {
	static NSString* const BOUNDARY = @"scopeabcdefghijk";

	NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
	
	// ログインID、パスワード取得
	NSString *loginId = [userDefaults stringForKey:@"login_id_preference"];
	NSString *password = [userDefaults stringForKey:@"password_preference"];
//	NSLog(@"ログインID　= %@",loginId);
//	NSLog(@"パスワード = %@",password);
	
	// グループID、ユーザID取得・設定
	NSString *url = [[NSString alloc]initWithFormat:@"%@%@",
					 [PropertiesUtil getProperties:@"SERVER"], 
					 [PropertiesUtil getProperties:@"API_KEY_LOGIN"]
					 ];

	NSMutableURLRequest *request = [[[NSMutableURLRequest alloc] init] autorelease];	
	[request setURL:[NSURL URLWithString:url]];
	[request setHTTPMethod:@"POST"];

	NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@",BOUNDARY];	
	[request addValue:contentType forHTTPHeaderField: @"Content-Type"];

	NSMutableData *body = [NSMutableData data];
	// login=ログインID
	[body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",BOUNDARY] dataUsingEncoding:NSUTF8StringEncoding]];
	[body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"login\"\r\n\r\n%@", loginId] dataUsingEncoding:NSUTF8StringEncoding]];
//	[body appendData:[[NSString stringWithString:@"Content-Type: text/plain;charset=utf8\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
//	[body appendData:[[NSString stringWithString:loginId] dataUsingEncoding:NSUTF8StringEncoding]];
	[body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",BOUNDARY] dataUsingEncoding:NSUTF8StringEncoding]];
	// password=パスワード
	[body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",BOUNDARY] dataUsingEncoding:NSUTF8StringEncoding]];
	[body appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"password\"\r\n\r\n%@", password] dataUsingEncoding:NSUTF8StringEncoding]];
//	[body appendData:[[NSString stringWithString:@"Content-Type: text/plain;charset=utf8\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
//	[body appendData:[[NSString stringWithString:password] dataUsingEncoding:NSUTF8StringEncoding]];
	[body appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",BOUNDARY] dataUsingEncoding:NSUTF8StringEncoding]];

	[request setHTTPBody:body];
	
	// URLコネクションを作る
	[NSURLConnection connectionWithRequest:request delegate:self];

}

@end

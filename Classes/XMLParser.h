//-------------------------------------------------------------
//
//  XMLParser.h
//  SCOPEroject
//
//  Created by YOSHIDA Hiroyuki on 09/11/20.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//
//-------------------------------------------------------------

#import <Foundation/Foundation.h>

#define ELEMENT_NAME_RESULT   @"result"
#define ELEMENT_NAME_MESSAGE  @"message"


@interface XMLParser : NSObject {
	NSMutableArray  *items;
	NSXMLParser     *parser;
	NSString        *nodeName;
	NSMutableString *nodeContent;
	
	NSString        *result;
	NSString        *message;
	// TODO
	bool			noteFlag;
}

@property (nonatomic, retain, readonly) NSMutableArray *items;

@property (nonatomic, retain, readonly) NSString *result;
@property (nonatomic, retain, readonly) NSString *message;

- (void)parseXMLFileAtURL:(NSURL *)url parseError:(NSError **)error;
//- (void)authenticate:(NSString *)loginId password:(NSString *)password;
- (void)authenticate;

@end

//
//  TweetListXMLParser.h
//  SCOPEroject
//
//  Created by 菊池　達哉 on 09/12/16.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMLParser.h"
#import "TweetInfo.h"


#define ELEMENT_NAME_TWEET_0        @"tweet"
#define ELEMENT_NAME_ID				@"id"
#define ELEMENT_NAME_GROUP_ID       @"group_id"
#define ELEMENT_NAME_PARENT_ID      @"parent_id"
#define ELEMENT_NAME_USER_ID		@"user_id"
#define ELEMENT_NAME_FULL_NAME      @"full_name"
#define ELEMENT_NAME_ICON_PATH      @"icon_path"
#define ELEMENT_NAME_TWEET_DATA     @"tweet_data"
#define ELEMENT_NAME_TWEET_LAT      @"tweet_lat"
#define ELEMENT_NAME_TWEET_LON      @"tweet_lon"
#define ELEMENT_NAME_PICTURE_PATH   @"picture_path"
#define ELEMENT_NAME_CREATED_AT     @"created_at"
#define ELEMENT_NAME_UPDATED_AT     @"updated_at"


@interface TweetListXMLParser : XMLParser {
	TweetInfo		*tweetInfo;
}

@end

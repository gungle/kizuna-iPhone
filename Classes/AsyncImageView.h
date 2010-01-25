//
//  AsyncImageView.h
//  ScopeProject
//
//  Created by YOSHIDA Hiroyuki on 09/11/26.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface AsyncImageView : UIImageView {
@private
	NSURLConnection *connection;
	NSMutableData   *imageData;
}

-(void)loadImage:(NSString *)url;
-(void)abort;

@end

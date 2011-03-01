//
//  Score.h
//  DaD_test2
//
//  Created by tobi on 3/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Score : NSObject<NSCoding> {
	NSInteger points;
	NSString *player;
	NSInteger gameMode;
}

@property (nonatomic) NSInteger points;
@property (nonatomic) NSInteger gameMode;
@property (nonatomic, retain) NSString* player;

-(void)encodeWithCoder:(NSCoder *)coder;
-(id)initWithCoder:(NSCoder *)coder;

@end

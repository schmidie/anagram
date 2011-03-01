//
//  Score.m
//  DaD_test2
//
//  Created by tobi on 3/1/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Score.h"


@implementation Score

@synthesize points;
@synthesize player;
@synthesize gameMode;

-(void)encodeWithCoder:(NSCoder *)coder{
//	[super encodeWithCoder:coder];
	[coder encodeInteger:points forKey:@"punkte"];
	[coder encodeInteger:gameMode forKey:@"modus"];
	[coder encodeObject:player forKey:@"spieler"];	
}
-(id)initWithCoder:(NSCoder *)coder{
//	self = [super initWithCoder:coder];
	points = [coder decodeIntegerForKey:@"punkte"];
	gameMode = [coder decodeIntegerForKey:@"modus"];
	player = [[coder decodeObjectForKey:@"spieler"]retain];
	return self;
}

-(void) dealloc{
	[player release];
	[super dealloc];
}
@end

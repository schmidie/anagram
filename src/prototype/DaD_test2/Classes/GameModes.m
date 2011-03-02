//
//  GameModes.m
//  DaD_test2
//
//  Created by tobi on 3/2/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "GameModes.h"

@implementation GameModes


+(NSString*) getGameModeName:(NSInteger) withID{
	switch (withID) {
		case TRAINING:
			return @"Training";
		case TIMEATTACK:
			return @"Gegen die Zeit";
	}
	return @"";
}
@end

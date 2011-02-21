//
//  GameController.m
//  DaD_test2
//
//  Created by Dominik Sacha on 19.02.11.
//  Copyright 2011 HTWG Konstanz. All rights reserved.
//

#import "GameController.h"


@implementation GameController

-(id) initWithGameModel:(GameModel*)model{
	gameModel = model;
	
	return self;
}
-(void) startNewGame{
	NSLog(@"start game!");
	
}

-(NSString*) getCurrentWord{
	/*
	NSMutableString * randamString = [NSMutableString stringWithCapacity:[text length]];
	//NSMutableString * tmp = [NSMutableString stringWithCapacity:[text length]];
	int leng = [text length];
	
	for(int i = 0; i < leng; i++){
		
		char *c = [text characterAtIndex:rand()%[text length]];
		[randamString appendFormat:@"%c" , c];
		
		//[text replaceOccurrencesOfString:@"p" 
		//					  withString:@"" options:NSCaseInsensitiveSearch 
		//						   range:(NSMakeRange(0, [text length]))];
		
	}
	 */
	
	return @"padre";
}

-(Status*) getStatus{
	Status *myStatus = [[Status alloc] init];
	//[myStatus setSolvedWords:[model get...]]
	//[myStatus setSolvedWords:5];
	//[myStatus setTimeRemaining:89];
	//[myStatus setLifesRemaining:3];
	//[myStatus setCurrentGameMode:1];
	
	return myStatus;
}

-(Boolean) checkSolution: (NSString *) text{
	
	NSLog(text);
	NSLog([gameModel currentWord]);
	
	return [text isEqualToString:[gameModel currentWord]];
}

@end

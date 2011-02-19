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
	
}

-(NSString*) getCurrentWord{
	return @"friedrichshafen";
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

-(Boolean) checkSolution{
	return false;
}

@end

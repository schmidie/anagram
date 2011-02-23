//
//  GameController.m
//  DaD_test2
//
//  Created by Dominik Sacha on 19.02.11.
//  Copyright 2011 HTWG Konstanz. All rights reserved.
//

#import "GameController.h"
#import "DataHandler.h"


@implementation GameController

-(id) initWithGameModel:(GameModel*)model{
	gameModel = model;
	return self;
}
-(void) startNewGame{
	NSLog(@"start game!");
	//[gameModel setInGame:Yes];
	
}

-(NSMutableString*) getCurrentWord{
	
	//load word 
	//get a new DataHandler
	DataHandler* datahandler = [[DataHandler alloc] init];

	NSString * originalWord = datahandler.getWordFromFile;
	NSLog(originalWord);

	//TODO
	//NSArray * wordsMock = [[NSArray alloc] initWithObjects:@"padre",@"madre",@"fratello",@"figlio",
	//					   @"sorella",@"zia",@"nonna",@"nipote",nil];
	//NSString * originalWord = [wordsMock objectAtIndex:(rand()%([wordsMock count]-1))];
	
	NSMutableString * randomString = [NSMutableString stringWithCapacity:[originalWord length]];
	NSMutableString * word = [NSMutableString stringWithString:originalWord];
	
	for(int i = 0; i < [originalWord length]; i++){
		
		//NSLog(word);
		//NSLog(randomString);
		int randPos = 0;
		if(([word length]-1) > 0)
			randPos = (rand()%([word length]-1));
		char *c = [word characterAtIndex:(int)randPos];
		[randomString appendFormat:@"%c",c];
		
		//delete the charecter in the word
		[word deleteCharactersInRange:NSMakeRange(randPos,1)];
	}
	//NSLog(word);
	//NSLog(randomString);
	[gameModel setCurrentWord:[NSString stringWithString:originalWord]];
	return [NSString stringWithString:randomString];
}

-(Status*) getStatus{
	Status *myStatus = [[Status alloc] init];
	//[myStatus setSolvedWords:[model get...]]
	[myStatus setSolvedWords:1];
	[myStatus setSolvedWords:5];
	[myStatus setTimeRemaining:89];
	[myStatus setLifesRemaining:3];
	[myStatus setCurrentGameMode:1];
	
	return myStatus;
}

-(Boolean) checkSolution: (NSString *) text{
	
	NSLog(text);
	NSLog([gameModel currentWord]);
	
	return [text isEqualToString:[gameModel currentWord]];
}

@end

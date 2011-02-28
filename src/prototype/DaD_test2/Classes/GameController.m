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

@synthesize gameTimer;


-(id) initWithGameModel:(GameModel*)model{
	gameModel = model;
	
	[gameModel setCurrentWord:[self getNextWord]];
	
	return self;
}


-(void) tick:(NSTimer*) theTimer{
	
	if([gameModel timeRemaining]>0){
		int i = [gameModel timeRemaining];
		[gameModel setTimeRemaining:(i-1)];
	}
	else if([gameModel timeRemaining]==0 && [gameModel lifesRemaining] > 0){
		// loosing a life ! -> reset the time for the new life
		int i = [gameModel lifesRemaining];
		[gameModel setLifesRemaining:(i-1)];
		// TODO define global variable for time ...
		[gameModel setTimeRemaining:60];
	}
	else if([gameModel timeRemaining]==0 && [gameModel lifesRemaining] == 0){
		//no time and no lifes ->gameover !
		NSLog(@"GameOveruuuuuuu!!");
	}

}


-(void) startNewGame{
	NSLog(@"start game!");
	
	//set-up our gameTimer 
	gameTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self 
											   selector:@selector(tick:) 
											   userInfo:nil repeats:YES];
	[gameTimer fire];
	
	
	[gameModel setTimeRemaining:60];
	[gameModel setLifesRemaining:3];
	[gameModel setSolvedWords:0];
	
	//[gameModel setInGame:Yes];
	
}

-(NSMutableString*) getNextWord {
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
	[gameModel setCurrentWord:originalWord];
	[gameModel setTimeRemaining:60];

	return [NSString stringWithString:randomString];
}

-(void) removeLife{
	int i = [gameModel lifesRemaining];
	if(i>0){
		[gameModel setLifesRemaining:(i-1)];
		[gameModel setTimeRemaining:60];
	}
	else {
		[gameModel setTimeRemaining:0];
	}

}


-(Status*) getStatus{
	Status *myStatus = [[Status alloc] init];
	//[myStatus setSolvedWords:[model get...]]
	//[myStatus setSolvedWords:1];
	[myStatus setSolvedWords:[gameModel solvedWords]];
	[myStatus setTimeRemaining:[gameModel timeRemaining]];
	[myStatus setCurrentWord:[gameModel currentWord]];
	[myStatus setLifesRemaining:[gameModel lifesRemaining]];
	[myStatus setCurrentGameMode:1];
	
	return myStatus;
}

-(Boolean) checkSolution: (NSString *) text{
	
	NSLog(text);
	NSLog([gameModel currentWord]);
	Boolean solved = [text isEqualToString:[gameModel currentWord]];
	if(solved){
		int i = [gameModel solvedWords];
		[gameModel setSolvedWords:(i+1)];
				//TODO: write to file ....
		
	}
	return solved;
}

@end

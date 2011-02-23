//
//  DataHandler.m
//  DaD_test2
//
//  Created by Dominik Sacha on 22.02.11.
//  Copyright 2011 HTWG Konstanz. All rights reserved.
//

#import "DataHandler.h"


@implementation DataHandler

-(id) init {
	
	wordsFilePath = @"Words";
	statusFilePath = @"LastGameStatus";
	return self;
}

-(NSString*) getWordFromFile {
	
	NSString *filePath = [[NSBundle mainBundle] pathForResource:wordsFilePath ofType:@"txt"];
	
	NSData *fileData = [NSData dataWithContentsOfFile:filePath];
	NSString* words = [[NSString alloc] initWithData:fileData encoding:NSASCIIStringEncoding];
	
	NSArray *lines = [words componentsSeparatedByString:@"\n"]; // each line, adjust character for line endings
	
	//Get a Random word:
	int randPos = 0;
	randPos = (rand()%([lines count]-1));
	NSString *newWord = [lines objectAtIndex:randPos];
	
	
	return newWord;
}

@end

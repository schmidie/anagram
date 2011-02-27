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
	
	NSArray *p = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); 
	NSString *filePath = [NSString stringWithFormat:@"%@/%@",[p objectAtIndex:0],@"Words.txt"];
	NSString *srcPath = [[NSBundle mainBundle] pathForResource:wordsFilePath ofType:@"txt"];
	
	if (![[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
		
		[[NSFileManager defaultManager] copyItemAtPath: srcPath toPath:filePath error:NULL];
	}
	//
	
	NSData *fileData = [NSData dataWithContentsOfFile:filePath];
	NSString* words = [[NSString alloc] initWithData:fileData encoding:NSASCIIStringEncoding];
	
	NSMutableArray *lines = [words componentsSeparatedByString:@"\n"]; // each line, adjust character for line endings
	
	//Get a Random word:
	int randPos = 0;
	randPos = (rand()%([lines count]-1));
	NSString *newWord = [[NSString alloc] initWithString:[lines objectAtIndex:randPos]];
	NSMutableString *hashed = [[NSMutableString alloc] initWithString: @"#"];
	[hashed appendString:newWord];
	[lines replaceObjectAtIndex:randPos withObject:hashed];
	NSLog([lines objectAtIndex:randPos]);
	[hashed release];
	
	NSMutableString *newStr = [[NSMutableString alloc] init];
	for (NSString *s in lines) {
		[newStr appendString:s];
		int i = [lines count];
		if(![s isEqual:[lines objectAtIndex:(i-1)]])
			[newStr appendString:@"\n"];
	}

	
	BOOL statu = [newStr writeToFile:filePath atomically:YES];
	
	return newWord;
}

@end

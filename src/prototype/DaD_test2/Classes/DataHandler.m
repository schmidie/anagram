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
	
	//Pfade setzen
	NSArray *p = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES); 
	NSString *filePath = [NSString stringWithFormat:@"%@/%@",[p objectAtIndex:0],@"Words.txt"];
	NSString *srcPath = [[NSBundle mainBundle] pathForResource:wordsFilePath ofType:@"txt"];
	
	//Wenn keine Wortdatei im appducumentsordner angelegt wurde: anlegen!
	if (![[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
		
		[[NSFileManager defaultManager] copyItemAtPath: srcPath toPath:filePath error:NULL];
	}
	
	//Wortdatei auslesen
	NSData *fileData = [NSData dataWithContentsOfFile:filePath];
	NSString* words = [[NSString alloc] initWithData:fileData encoding:NSASCIIStringEncoding];
	
	//Woerter in aarz speichern
	NSMutableArray *lines = [words componentsSeparatedByString:@"\n"]; // each line, adjust character for line endings
	
	//nur unbenutzte Woerter benutzen
	NSMutableArray *unusedWords = [[NSMutableArray alloc]init];
	for (NSString *word in lines) {
		if (![word hasPrefix:@"#"]) {
			[unusedWords addObject:word];
		}
	}
	
	//wenn keine woerter mehr uebrug sind: neue liste
	if ([unusedWords count] == 0) {
		int c = 0;
		NSMutableArray *temp = [[NSMutableArray alloc]init];
		for (NSString *word in lines) {	
			[temp insertObject:[word substringFromIndex:1] atIndex:c];
			c++;
		}
		lines = temp;
		unusedWords = temp;
	}
	
	//Get a Random word:
	int randPos = 0;
	randPos = (rand()%([unusedWords count]));
	
	//kennzeichnen des benutzten wortes
	NSString *newWord = [[NSString alloc] initWithString:[unusedWords objectAtIndex:randPos]];
	NSMutableString *hashed = [[NSMutableString alloc] initWithString: @"#"];
	[hashed appendString:newWord];
	
	int count = 0;
	int found = 0;
	for (NSString* word in lines) {
		if (word == newWord) {
			found = count;
		}
		count = count+1;
	}
	
	[lines replaceObjectAtIndex:found withObject:hashed];
	[hashed release];
	
	//rausschreiben der neuen Wortliste
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

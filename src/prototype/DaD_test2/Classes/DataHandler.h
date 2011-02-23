//
//  DataHandler.h
//  DaD_test2
//
//  Created by Dominik Sacha on 22.02.11.
//  Copyright 2011 HTWG Konstanz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Status.h"

@interface DataHandler : NSObject {
	NSString * statusFilePath;
	NSString * wordsFilePath;
}
-(NSString*) getWordFromFile;
-(Status*) getLastGameStatus;
-(void) writeGameStatusToFile:(Status*) status;

@end

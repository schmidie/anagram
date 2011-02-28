//
//  Status.h
//  DaD_test2
//
//  Created by Dominik Sacha on 19.02.11.
//  Copyright 2011 HTWG Konstanz. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Status : NSObject {
	
	int lifesRemaining;
	int timeRemaining;
	int solvedWords;
	int currentGameMode;
	
	NSString *currentWord;
	
}

@property(nonatomic)int lifesRemaining;
@property(nonatomic)int timeRemaining;
@property(nonatomic)int solvedWords;
@property(nonatomic)int currentGameMode;

@property(nonatomic,retain)NSString * currentWord;

@end

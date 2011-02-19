//
//  Status.h
//  DaD_test2
//
//  Created by Dominik Sacha on 19.02.11.
//  Copyright 2011 HTWG Konstanz. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Status : NSObject {
	
	NSInteger * lifesRemaining;
	NSInteger * timeRemaining;
	NSInteger * solvedWords;
	NSInteger * currentGameMode;
	
}

@property(nonatomic)NSInteger * lifesRemaining;
@property(nonatomic)NSInteger * timeRemaining;
@property(nonatomic)NSInteger * solvedWords;
@property(nonatomic)NSInteger * currentGameMode;

@end

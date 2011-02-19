//
//  GameController.h
//  DaD_test2
//
//  Created by Dominik Sacha on 19.02.11.
//  Copyright 2011 HTWG Konstanz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameModel.h"
#import "Status.h"


@interface GameController : NSObject {
		
}

-(id) initWithGameModel:(GameModel*)model;
-(void) startNewGame;
-(NSString*) getCurrentWord;
-(Status*) getStatus;
-(Boolean) checkSolution;





@end

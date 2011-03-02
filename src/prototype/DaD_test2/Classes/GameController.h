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
	
	GameModel * gameModel;
	NSTimer *gameTimer;
	
}

//@property (nonatomic, retain) GameModel gameModel;
@property (nonatomic, retain) NSTimer *gameTimer;

-(id) initWithGameModel:(GameModel*)model;
-(void) startNewGame;
-(Status*) getStatus;
-(Boolean) checkSolution:(NSString*) text;
-(void)tick:(NSTimer *)theTimer;
-(NSArray*) getHighscores:(NSInteger) withMode;
-(void) addNewHighscore:(NSString *) withName:(NSInteger) andScore;
-(void) changeModus:(NSInteger)modus;
-(NSMutableString*) getNextWord;
-(void) removeLife;

@end

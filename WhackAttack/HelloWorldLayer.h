//
//  HelloWorldLayer.h
//  WhackAttack
//
//  Created by Benjamin Lui on 11/29/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//


// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface HelloWorldLayer : CCLayer
{
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;
-(void) initWithHoles:(int)numHoles;
-(NSMutableArray *) randomPositions:(int)numHoles;
-(int) randomXPositionAtCount:(int)counter;
-(int) randomYPosition;


@end

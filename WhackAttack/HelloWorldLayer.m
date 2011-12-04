//
//  HelloWorldLayer.m
//  WhackAttack
//
//  Created by Benjamin Lui on 11/29/11.
//  Copyright __MyCompanyName__ 2011. All rights reserved.
//


// Import the interfaces
#import "HelloWorldLayer.h"

NSMutableArray *holes;
NSMutableArray *sprites; 

// HelloWorldLayer implementation
@implementation HelloWorldLayer

+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	HelloWorldLayer *layer = [HelloWorldLayer node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
		[self initWithHoles:10];
	}
	return self;
}

// on "init" you need to initialize your instance
-(void) initWithHoles:(int)numHoles
{
  CCSprite *hole;
  holes = [[NSMutableArray alloc] init];
  for (int i = 0; i < numHoles; i++) {
    [holes addObject:[CCSprite spriteWithFile: @"hole.png"]];
    hole = (CCSprite*)[holes lastObject];
    hole.position = ccp([self randomXPositionAtCount:i], [self randomYPosition]);
    [self addChild:hole];
  }
}
                           
-(int) randomXPositionAtCount:(int)counter
{
  int randX;
  switch (counter % 4) {
    case 0:
      randX = arc4random() % 120 + 10;
      break;
    case 1:
      randX = arc4random() % 120 + 130;
      break;
    case 2:
      randX = arc4random() % 120 + 250;
      break;
    case 3:
      randX = arc4random() % 120 + 370;
      break;
    default:
      break;
  }
  return randX;
}

-(int) randomYPosition
{
  return arc4random() % 320;
}

// on "dealloc" you need to release all your retained objects
- (void) dealloc
{
	// in case you have something to dealloc, do it in this method
	// in this particular example nothing needs to be released.
	// cocos2d will automatically release all the children (Label)
	
	// don't forget to call "super dealloc"
	[super dealloc];
}
@end

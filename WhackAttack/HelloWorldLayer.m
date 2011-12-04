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
    [self schedule:@selector(tryPop:) interval:0.5];
	}
	return self;
}

// on "init" you need to initialize your instance
-(void) initWithHoles:(int)numHoles
{
  CCSprite *hole;
  holes = [[NSMutableArray alloc] init];
  sprites = [[NSMutableArray alloc] init];
  for (int i = 0; i < numHoles; i++) {
    [holes addObject:[CCSprite spriteWithFile: @"hole.png"]];
    [sprites addObject:[CCSprite spriteWithFile: @"chipmunk.png"]];
    hole = (CCSprite*)[holes lastObject];
    hole.position = ccp([self randomXPositionAtCount:i], [self randomYPosition]);
    [self addChild:hole];
  }
}
                           
-(int) randomXPositionAtCount:(int)counter
{
  int xPos;
  switch (counter % 4) {
    case 0:
      xPos = arc4random() % 120 + 10;
      break;
    case 1:
      xPos = arc4random() % 120 + 130;
      break;
    case 2:
      xPos = arc4random() % 120 + 250;
      break;
    case 3:
      xPos = arc4random() % 120 + 370;
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

-(void) tryPop
{
  for (CCSprite *sprite in sprites) {
    if (arc4random() % 3 == 0) {
      if (sprite.numberOfRunningActions == 0) {
        [self spritePopup:sprite];
      }
    }
  }
}

-(void) spritePopup:(CCSprite*) sprite
{
  id wait2seconds = [CCDelayTime actionWithDuration:2];
  id waitRandomTime = [CCDelayTime actionWithDuration:arc4random()%3];
  
  id hideAction = [CCHide action];
  id showAction = [CCShow action];
  id sequence = [CCSequence actions: wait2seconds,hideAction,waitRandomTime,showAction,nil];
  
  
  [sprite runAction: sequence];
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

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
		[self initWithHoles:3];
    
	}
	return self;
}

// on "init" you need to initialize your instance
-(id) initWithHoles:(int)numHoles
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super" return value
	if( (self=[super init])) {
    CCSprite *hole;
		for (int i = 0; i < numHoles; i++) {
      [holes addObject:[CCSprite spriteWithFile: @"hole.png"]];
      hole = (CCSprite*)[holes lastObject];
      hole.position = ccp( 50, 100 );
      [self addChild:hole];
    }
    
	}
	return self;
}

-(NSArray *) randomPosition:(int)numHoles
{
  
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

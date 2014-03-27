//
//  Grid.h
//  GameOfLife
//
//  Created by Yasyf Mohamedali on 2014-03-26.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "CCSprite.h"
#import "Creature.h"

@interface Grid : CCSprite

- (void)setupGrid;

- (Creature *)creatureForTouchPosition:(CGPoint)touchPosition;

@end

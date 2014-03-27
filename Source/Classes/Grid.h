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

@property (nonatomic) NSInteger generation;
@property (nonatomic) NSInteger alive;

+ (NSSet *)getNeighboringCellsForPoint:(CGPoint)p;

- (void)setupGrid;
- (void)evolveStep;

- (void)countNeighbors;
- (void)updateCreatures;

- (Creature *)creatureForTouchPosition:(CGPoint)touchPosition;

@end

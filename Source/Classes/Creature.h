//
//  Creature.h
//  GameOfLife
//
//  Created by Yasyf Mohamedali on 2014-03-26.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "CCSprite.h"

@interface Creature : CCSprite

@property (nonatomic) BOOL isAlive;
@property (nonatomic) NSInteger livingNeighbors;

@end

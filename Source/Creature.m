//
//  Creature.m
//  GameOfLife
//
//  Created by Yasyf Mohamedali on 2014-03-26.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Creature.h"

@implementation Creature

- (id)init
{
    self = [super initWithImageNamed:@"GameOfLifeAssets/Assets/bubble.png"];
    
    if (self) {
        self.isAlive = FALSE;
    }
    
    return self;
}

- (void)setIsAlive:(BOOL)isAlive
{
    _isAlive = isAlive;
    self.visible = _isAlive;
}

@end

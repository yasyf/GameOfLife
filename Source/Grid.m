//
//  Grid.m
//  GameOfLife
//
//  Created by Yasyf Mohamedali on 2014-03-26.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "Grid.h"
#import "Creature.h"

static const int ROWS = 8;
static const int COLS = 10;

@implementation Grid
{
 
    NSMutableArray *_grid;
    float _cellWidth;
    float _cellHeight;
    int _generation;
    int _population;
    
}

- (void)onEnter
{
    [self setupGrid];
}

- (void)setupGrid
{
    _cellHeight = self.contentSize.height / ROWS;
    _cellWidth = self.contentSize.width / COLS;
    
    float x = 0;
    float y = 0;
    
    _grid = [NSMutableArray array];
    
    for (int i = 0; i < ROWS; i++){
        _grid[i] = [NSMutableArray array];
        y = i * _cellHeight;
        
        for (int j = 0; j < COLS; j++){
            x = j * _cellWidth;
            
            Creature *creature = [[Creature alloc] init];
            creature.anchorPoint = ccp(0, 0);
            creature.position = ccp(x, y);
            
            [self addChild:creature];
            _grid[i][j] = creature;
            
        }
    }
    
}

@end

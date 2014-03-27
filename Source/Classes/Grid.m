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
}

- (id)init
{
    if (self = [super init]) {
        self.userInteractionEnabled = TRUE;
    }
    return self;
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

- (void)evolveStep
{
    [self countNeighbors];
    [self updateCreatures];
    
    _generation++;
}

+ (NSSet *)getNeighboringCellsForPoint:(CGPoint) p
{
    NSMutableSet *neighboringCells = [NSMutableSet set];
    for (int i = -1; i <= 1; i++) {
        for (int j = -1; j <= 1; j++) {
            if (i != 0 || j != 0) {
                [neighboringCells addObject:[NSValue valueWithCGPoint:ccp(p.x + i, p.y + j)]];
            }
        }
    }
    return neighboringCells;
}

- (void)countNeighbors
{
    for (int i = 0; i < [_grid count]; i++) {
        for (int j = 0; j < [_grid[i] count]; j++) {
            Creature *creature = _grid[i][j];
            creature.livingNeighbors = 0;
            for (NSValue *p in [Grid getNeighboringCellsForPoint: ccp(i, j)]) {
                CGPoint point = p.CGPointValue;
                if (point.x >= 0 && point.x < ROWS && point.y >= 0 && point.y < COLS){
                    Creature *neighbor = _grid[(int)point.x][(int)point.y];
                    if (neighbor.isAlive) {
                        creature.livingNeighbors += 1;
                    }
                }
            }
            
        }
    }
}

- (void)updateCreatures
{
    _alive = 0;
    for (int i = 0; i < [_grid count]; i++) {
        for (int j = 0; j< [_grid[i] count]; j++) {
            Creature *creature = _grid[i][j];
            if (creature.livingNeighbors == 3 && !creature.isAlive) {
                creature.isAlive = TRUE;
            }
            else if ((creature.livingNeighbors <= 1 || creature.livingNeighbors >= 4) && creature.isAlive){
                creature.isAlive = FALSE;
            }
            if (creature.isAlive) {
                _alive++;
            }
        }
    }
}

- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    CGPoint touchLocation = [touch locationInNode:self];
    Creature *creature = [self creatureForTouchPosition:touchLocation];
    creature.isAlive = !creature.isAlive;
}

- (Creature *)creatureForTouchPosition:(CGPoint)touchPosition
{
    int col = (int)(touchPosition.x/_cellWidth);
    int row = (int)(touchPosition.y/_cellHeight);
    return _grid[row][col];
}


@end

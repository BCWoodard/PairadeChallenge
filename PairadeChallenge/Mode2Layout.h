//
//  Mode2Layout.h
//  PairadeChallenge
//
//  Created by Brad Woodard on 7/27/16.
//  Copyright © 2016 elementC. All rights reserved.
//

#import <UIKit/UIKit.h>

// Cell types and their configuration
// in the collectionView
//    +-------------------+
//    |           |       |
//    |           |   B   |
//    |           |       |
//    |     A     +-------+
//    |           |       |
//    |           |   C   |
//    |           |       |
//    +-----------+-------+
//    |       |           |
//    |   B   |           |
//    |       |           |
//    +-------+     A     |
//    |       |           |
//    |   C   |           |
//    |       |           |
//    +-------+-----------+

typedef enum LayoutType_e
{
    LayoutTypeA,
    LayoutTypeB,
    LayoutTypeC,
    LayoutTypeD,
    LayoutTypeE,
    LayoutTypeF,
} LayoutType;

static const int kCellsPerRow = 6;

@interface Mode2Layout : UICollectionViewLayout

@property UIView *layoutView;

@end

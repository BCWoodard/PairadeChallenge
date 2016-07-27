//
//  Mode2Layout.m
//  PairadeChallenge
//
//  Created by Brad Woodard on 7/27/16.
//  Copyright © 2016 elementC. All rights reserved.
//

#import "Mode2Layout.h"

@interface Mode2Layout()
@property NSInteger totalCells;
@end

@implementation Mode2Layout

- (id)init {
    self = [super init];
    if (self) {
        [self initialize];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if( self )
    {
        [self initialize];
    }
    return self;
}

- (void)initialize
{
    self.layoutView = [[[NSBundle mainBundle] loadNibNamed:@"Mode2Layout" owner:self options:nil] objectAtIndex:0];
}

- (CGSize)collectionViewContentSize {
    if ([self.collectionView numberOfItemsInSection:0] == 0)
        return CGSizeZero;
    
    CGFloat rowWidth = [self rowWidth];
    CGFloat rowHeight = [self rowHeight];
    self.totalCells = [self.collectionView numberOfItemsInSection:0];
    
    CGFloat contentHeight = (rowHeight/kCellsPerRow * (self.totalCells + (kCellsPerRow/2)) - (self.totalCells % (int)(kCellsPerRow/2)));
    CGSize contentSize = CGSizeMake(rowWidth, contentHeight);
    
    return contentSize;
}

- (CGRect)frameForLayoutType:(LayoutType)type {
    UIView *cell = [self.layoutView.subviews objectAtIndex:type];
    return cell.frame;
}

- (LayoutType)layoutTypeForIndexPath:(NSIndexPath *)indexPath {
    return indexPath.row % kCellsPerRow;
}

- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect {
    NSMutableArray *array = [NSMutableArray new];
    
    for (int i = 0; i < self.totalCells; i++) {
        UICollectionViewLayoutAttributes *attributes = [self layoutAttributesForItemAtIndexPath:[NSIndexPath indexPathForRow:i inSection:0]];
        if (CGRectIntersectsRect(attributes.frame, rect))
            [array addObject:attributes];
    }
    
    return [NSArray arrayWithArray:array];
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGRect frame = [self frameForLayoutType:[self layoutTypeForIndexPath:indexPath]];
    
    long row = indexPath.row / kCellsPerRow;
    frame.origin.y += row * [self rowHeight];
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attributes.frame = frame;
    
    return attributes;
}

- (CGFloat)rowWidth {
    return self.layoutView.frame.size.width;
}

- (CGFloat)rowHeight {
    return self.layoutView.frame.size.height;
}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return NO;
}
@end

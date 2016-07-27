//
//  Mode1FlowLayout.m
//  PairadeChallenge
//
//  Created by Brad Woodard on 7/27/16.
//  Copyright © 2016 elementC. All rights reserved.
//

#import "Mode1FlowLayout.h"

@implementation Mode1FlowLayout

- (void)prepareLayout {
    self.minimumLineSpacing = 10.0;
    self.minimumInteritemSpacing = 10.0;
    self.scrollDirection = UICollectionViewScrollDirectionVertical;
}

- (CGSize)itemSize {
    
    // Quick Adjustment for two column layout
    // NSInteger numberOfColumns = 2;
    // CGFloat itemWidth = (CGRectGetWidth(self.collectionView.frame) - self.minimumInteritemSpacing)/numberOfColumns;
    // return CGSizeMake(itemWidth, itemWidth);

    // Cell is frame width and 290.0 high
    return CGSizeMake(CGRectGetWidth(self.collectionView.frame), 290.0);

}

- (BOOL)shouldInvalidateLayoutForBoundsChange:(CGRect)newBounds {
    return NO;
}

@end

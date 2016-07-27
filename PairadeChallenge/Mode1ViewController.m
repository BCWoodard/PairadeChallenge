//
//  Mode1ViewController.m
//  PairadeChallenge
//
//  Created by Brad Woodard on 7/26/16.
//  Copyright © 2016 elementC. All rights reserved.
//

#import "Mode1ViewController.h"
#import "UIImageView+WebCache.h"
#import "Mode1Cell.h"

@interface Mode1ViewController () <UICollectionViewDelegate, UICollectionViewDataSource> {
    NSArray *imageUrls;
    __weak IBOutlet UICollectionView *imagesCollectionView;
}

@end

@implementation Mode1ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:NSStringFromClass([self class])];
}


#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _incomingImageUrls.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"Mode1Cell";
    
    Mode1Cell *cell = (Mode1Cell *)[collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    NSURL *imageUrl = [NSURL URLWithString:[_incomingImageUrls objectAtIndex:indexPath.row]];
    cell.backgroundColor = [UIColor blueColor];
    [cell.imageView sd_setImageWithURL:imageUrl];
    [cell.imageView sd_setImageWithURL:imageUrl placeholderImage:[UIImage imageNamed:@"Pairade_Logo"]];
    
    return cell;
}

#pragma mark - LayoutSubviews
- (void)viewWillLayoutSubviews;
{
    [super viewWillLayoutSubviews];
    UICollectionViewFlowLayout *flowLayout = (id)imagesCollectionView.collectionViewLayout;
    
    if (UIInterfaceOrientationIsLandscape(UIApplication.sharedApplication.statusBarOrientation)) {
        flowLayout.itemSize = CGSizeMake(self.view.frame.size.width, 170.0);
    } else {
        flowLayout.itemSize = CGSizeMake(self.view.frame.size.width, 290.0);
    }
    
    // Force the elements to get laid out again with the new size.
    // If I don't add the comment, I always forget to add the line
    [flowLayout invalidateLayout];
}


#pragma mark - Cleanup
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

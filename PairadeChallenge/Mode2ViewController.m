//
//  Mode2ViewController.m
//  PairadeChallenge
//
//  Created by Brad Woodard on 7/26/16.
//  Copyright © 2016 elementC. All rights reserved.
//

#import "Mode2ViewController.h"
#import "UIImageView+WebCache.h"
#import "Mode2Layout.h"
#import "Mode2Cell.h"

@interface Mode2ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) Mode2Layout *flowLayout;

@end

@implementation Mode2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationItem setTitle:NSStringFromClass([self class])];
    [self.collectionView setBackgroundColor:[UIColor whiteColor]];
    
    UINib *cellNib = [UINib nibWithNibName:@"Mode2Cell" bundle:nil];
    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:@"A"];
    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:@"B"];
    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:@"C"];
    
    self.flowLayout = (Mode2Layout *)self.collectionView.collectionViewLayout;

}


#pragma mark - UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _incomingImageUrls.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    Mode2Cell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[self reuseIdentifierForCellWithIndexPath:indexPath] forIndexPath:indexPath];
    cell.backgroundColor = [UIColor yellowColor];
    NSURL *imageUrl = [NSURL URLWithString:[_incomingImageUrls objectAtIndex:indexPath.row]];
    [cell.imageView sd_setImageWithURL:imageUrl placeholderImage:[UIImage imageNamed:@"Pairade_Logo"]];
    
    return cell;
}

-(NSString*)reuseIdentifierForCellWithIndexPath:(NSIndexPath*)indexPath
{
    NSArray* cells = @[@"A",@"B",@"C",@"B",@"C",@"A"];
    return [cells objectAtIndex:(indexPath.row % kCellsPerRow)];
}

- (void)viewWillLayoutSubviews;
{
    [super viewWillLayoutSubviews];
    Mode2Layout *flowLayout = (Mode2Layout *)self.collectionView.collectionViewLayout;

    CGRect frame = flowLayout.layoutView.frame;
    if (UIInterfaceOrientationIsLandscape(UIApplication.sharedApplication.statusBarOrientation)) {
        frame = CGRectMake(0.0, 0.0, self.view.bounds.size.height, self.view.bounds.size.width);
        //flowLayout.layoutView.frame = frame;
        self.collectionView.frame = frame;
    } else {
        frame = CGRectMake(0.0, 0.0, self.view.bounds.size.width, self.view.bounds.size.height);
        //flowLayout.layoutView.frame = frame;
        self.collectionView.frame = frame;
    }
    
    [flowLayout invalidateLayout]; //force the elements to get laid out again with the new size
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end

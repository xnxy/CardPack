//
//  CardPackCell.m
//  CardPack
//
//  Created by dev on 2017/11/13.
//  Copyright © 2017年 dev. All rights reserved.
//

#import "CardPackCell.h"
#import "HJCarouselViewLayout.h"

@implementation HorizontalCollectionView

@end

@implementation CardPackCell

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        HJCarouselViewLayout *layout = [[HJCarouselViewLayout alloc] initWithAnim:HJCarouselAnimCarousel];
        layout.itemSize = CGSizeMake(kWidth(610), kWidth(680));
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        HorizontalCollectionView *collectionViw = [[HorizontalCollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];

        collectionViw.backgroundColor   = [UIColor clearColor];
        collectionViw.bounces           = NO;
        collectionViw.showsHorizontalScrollIndicator    = NO;
        collectionViw.showsVerticalScrollIndicator      = NO;
        
        [self addSubview:collectionViw];
        
        self.horizontalCollectionView = collectionViw;
        
        [collectionViw registerClass:NSClassFromString(@"HorizontalCell")
          forCellWithReuseIdentifier:HorizontalCollectionViewCellIdentifier];
        
        //layout
        [collectionViw makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        
        self.horizontalCollectionViewDelegateWithIndexPath = ^(id<UICollectionViewDataSource,UICollectionViewDelegate> delegate, NSIndexPath *indexPath) {
            collectionViw.delegate = delegate;
            collectionViw.dataSource = delegate;
            collectionViw.indexPath = indexPath;
            [collectionViw reloadData];
        };
        
    }
    return self;
}

@end

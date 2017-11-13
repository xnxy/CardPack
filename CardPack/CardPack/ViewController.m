//
//  ViewController.m
//  CardPack
//
//  Created by dev on 2017/11/11.
//  Copyright © 2017年 dev. All rights reserved.
//

#import "ViewController.h"
#import "CardPackCell.h"
#import "HJCarouselViewLayout.h"
#import "HorizontalCell.h"

@interface ViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *collectionView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self setupCollectionView];
    
}

- (void)setupCollectionView{
    
    HJCarouselViewLayout *layout = [[HJCarouselViewLayout alloc] initWithAnim:HJCarouselAnimCarousel];
    layout.itemSize = CGSizeMake(kSCREEN_WIDTH, kSCREEN_WIDTH);
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    
    UICollectionView *collectionViw = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    collectionViw.delegate          = self;
    collectionViw.dataSource        = self;
    collectionViw.backgroundColor   = [UIColor whiteColor];
    collectionViw.bounces           = NO;
    collectionViw.showsHorizontalScrollIndicator    = NO;
    collectionViw.showsVerticalScrollIndicator      = NO;
    [self.view addSubview:collectionViw];
    
    self.collectionView = collectionViw;
    
    [collectionViw registerClass:NSClassFromString(@"CardPackCell") forCellWithReuseIdentifier:UICollectionViewCellIdentifier0];
    
    //layout
    [collectionViw makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(self.view);
        make.centerX.equalTo(self.view);
        make.bottom.equalTo(self.view.bottom);
        make.width.equalTo(kSCREEN_WIDTH - kWidth(40));
        make.height.equalTo(kSCREEN_WIDTH + kWidth(40));
    }];
    
    

}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section;{
    
    if ([collectionView isKindOfClass:[HorizontalCollectionView class]]) {
        return 3;
    }
    
    return 10;
}

static NSString* UICollectionViewCellIdentifier0 = @"UICollectionViewCellIdentifier0";
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([collectionView isKindOfClass:[HorizontalCollectionView class]]) {
        HorizontalCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:HorizontalCollectionViewCellIdentifier forIndexPath:indexPath];
        return cell;
    }
    
    CardPackCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:UICollectionViewCellIdentifier0 forIndexPath:indexPath];
    
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (![collectionView isKindOfClass:[HorizontalCollectionView class]]) {
        CardPackCell *cardPackCell = (CardPackCell *)cell;
        cardPackCell.horizontalCollectionViewDelegateWithIndexPath(self, indexPath);
    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

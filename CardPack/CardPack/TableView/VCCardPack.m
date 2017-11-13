//
//  VCCardPack.m
//  CardPack
//
//  Created by dev on 2017/11/11.
//  Copyright © 2017年 dev. All rights reserved.
//

#import "VCCardPack.h"
#import "CardPackCell.h"

@interface VCCardPack ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation VCCardPack

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupTableView];
    
}


- (void)setupTableView{
    
    UITableView *tableView = [UITableView customTableViewWithFrame:CGRectZero
                                                             style:UITableViewStylePlain
                                                    separatorColor:[UIColor clearColor]
                                      estimatedSectionHeaderHeight:0
                                      estimatedSectionFooterHeight:0];
    tableView.delegate      = self;
    tableView.dataSource    = self;
    tableView.pagingEnabled = YES;
//    tableView.showsVerticalScrollIndicator = NO;
    
    self.tableView          = tableView;
    
    [self.view addSubview:tableView];
    
    //layout
    [tableView makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.width.height.equalTo(kSCREEN_WIDTH - 20);
    }];
    
    [tableView registerClass:NSClassFromString(@"CardPackCell") forCellReuseIdentifier:TableViewCellIdentifier0];
    
}

#pragma mark ---
#pragma mark --- dataSource ---
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

static NSString* TableViewCellIdentifier0 = @"TableViewCellIdentifier0";
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CardPackCell *cell = [tableView dequeueReusableCellWithIdentifier:TableViewCellIdentifier0];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return kSCREEN_WIDTH - 20;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

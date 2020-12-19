//
//  TestCollectViewController.m
//  testDHFunction
//
//  Created by admin on 2020/12/17.
//

#import "TestCollectViewController.h"

@interface TestCollectViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic, strong)UICollectionView *collectView;

@end

@implementation TestCollectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
}

-(void)createUI
{
//    UICollectionViewLayout *layout = [UICollectionViewLayout alloc]init
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    
//    flowLayout.headerReferenceSize = CGSizeMake(SCREENWIDTH, 30);
    self.collectView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    [self.view addSubview:self.collectView];
    self.collectView.delegate = self;
    self.collectView.dataSource = self;
}



@end

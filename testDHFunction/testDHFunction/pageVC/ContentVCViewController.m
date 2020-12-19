//
//  ContentVCViewController.m
//  testDHFunction
//
//  Created by admin on 2020/12/18.
//

#import "ContentVCViewController.h"

@interface ContentVCViewController ()<UITableViewDelegate, UITableViewDataSource>
@property(nonatomic, strong)UITableView *tableview;
@property(nonatomic, strong)NSArray *dataList;

@end

@implementation ContentVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configData];
    [self createUI];
//    [self scrollToBottom];
}

+(instancetype)factory_newVCWithIndex:(NSInteger)index
{
    ContentVCViewController *vc = [ContentVCViewController new];
    UILabel *indexLab = [[UILabel alloc]initWithFrame:CGRectMake(100, 150, 100, 50)];
    indexLab.text = [NSString stringWithFormat:@"这是第%ld页",(long)index];
    indexLab.backgroundColor = [UIColor orangeColor];
    vc.vcIndex = index;
    [vc.view addSubview:indexLab];
    return vc;
}

-(void)configData
{
    self.dataList = @[@1,@2,@1,@2,@1,@2,@1,@2,@1];
}
-(void)createUI
{
    self.tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:self.tableview];
    self.tableview.bounces = NO;
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    self.tableview.estimatedRowHeight = 0;
    self.tableview.estimatedSectionHeaderHeight = 0;
    self.tableview.estimatedSectionFooterHeight = 0;
    [self.tableview registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    
}

-(void)scrollToindexPage:(NSInteger)index
{
//    NSLog(@"")
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    CGFloat yyy = height *index;
    NSLog(@"scrollIndex=%ld yyy=%f",index,yyy);
    [self.tableview setContentOffset:CGPointMake(0, yyy) animated:NO];
}

-(void)scrollToBottom
{
    NSLog(@"scrollToBottom");
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.dataList.count - 1 inSection:0];
    NSLog(@"indexPath=%@",indexPath);
//    [self.tableview scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:NO];
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    CGFloat yyy = height *(self.dataList.count-1);
    [self.tableview setContentOffset:CGPointMake(0, yyy) animated:NO];
}

#pragma mark xxxx
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"xxxxxxxx%ld",indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [UIScreen mainScreen].bounds.size.height;
}

@end

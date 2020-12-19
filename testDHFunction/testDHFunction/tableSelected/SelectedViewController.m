//
//  SelectedViewController.m
//  testDHFunction
//
//  Created by admin on 2020/12/15.
//

#import "SelectedViewController.h"
#import "SelectedTableViewCell.h"


@interface SelectedViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic, strong)UITableView *tableview;
@property(nonatomic, strong)NSArray *arr;

@end

@implementation SelectedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
}

-(void)createUI
{
    self.arr = @[@"水平翻页",@"竖直翻页",@"仿真翻页"];
    self.tableview = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
    [self.view addSubview:self.tableview];
    self.tableview.delegate = self;
    self.tableview.dataSource = self;
    self.tableview.tableFooterView = [UIView new];
    [self.tableview registerClass:[SelectedTableViewCell class] forCellReuseIdentifier:@"selectedCell"];
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SelectedTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"selectedCell" forIndexPath:indexPath];
    if (!cell) {
        cell = [[SelectedTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"selectedCell"];
    }
    cell.selectionStyle = 0;
    cell.lab.text = self.arr[indexPath.row];
    cell.imageV.hidden = YES;
    if (indexPath.row == 0) {
        cell.imageV.hidden = NO;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSIndexPath *path = [NSIndexPath indexPathForRow:0 inSection:0];
    SelectedTableViewCell *firCell = [tableView cellForRowAtIndexPath:path];
    firCell.imageV.hidden = YES;
    
    SelectedTableViewCell *currentCell = (SelectedTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    currentCell.imageV.hidden = NO;
}

- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    SelectedTableViewCell *currentCell = (SelectedTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    currentCell.imageV.hidden = YES;
    

}


@end

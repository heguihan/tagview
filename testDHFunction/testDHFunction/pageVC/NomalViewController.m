//
//  NomalViewController.m
//  testDHFunction
//
//  Created by admin on 2020/12/19.
//

#import "NomalViewController.h"

@interface NomalViewController ()

@end

@implementation NomalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

+(instancetype)factory_newNomalVCWithIndex:(NSInteger)index
{
    NomalViewController *nomal = [[NomalViewController alloc]init];
    UILabel *indexLab = [[UILabel alloc]initWithFrame:CGRectMake(100, 150, 100, 50)];
    indexLab.text = [NSString stringWithFormat:@"这是第%ld页",(long)index];
    indexLab.backgroundColor = [UIColor greenColor];
    nomal.vcIndex = index;
    [nomal.view addSubview:indexLab];
    return nomal;
}

@end

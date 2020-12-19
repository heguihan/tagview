//
//  PagexViewController.m
//  testDHFunction
//
//  Created by admin on 2020/12/18.
//

#import "PagexViewController.h"
#import "ContentVCViewController.h"
#import "NomalViewController.h"

@interface PagexViewController ()<UIPageViewControllerDelegate, UIPageViewControllerDataSource>
@property (nonatomic, strong) UIPageViewController *pageViewController;
@property(nonatomic, assign) NSInteger currentPageType;
@property(nonatomic, assign) NSInteger currentPageIndex;

@end

@implementation PagexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
}

-(void)createUI
{
    self.currentPageType = 0;
//    UIViewController *firVC = [self getViewCOntrollerxx];

    [self addPageVV];
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 300, 100, 50)];
    [btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    btn.backgroundColor = [UIColor greenColor];
}

-(void)addPageVV
{
    if (self.currentPageType == 1) {
        ContentVCViewController *firVC = [ContentVCViewController factory_newVCWithIndex:1];
        [firVC scrollToindexPage:self.currentPageIndex];
        [self.pageViewController setViewControllers:@[firVC] direction:1 animated:YES completion:nil];
    }else{
        NomalViewController *nomalVc = [NomalViewController factory_newNomalVCWithIndex:1];
        [self.pageViewController setViewControllers:@[nomalVc] direction:0 animated:YES completion:nil];
    }
    
    self.pageViewController.view.frame = self.view.bounds;
    
    [self addChildViewController:self.pageViewController];
    [self.view addSubview:self.pageViewController.view];
    
}


#pragma mark 返回上一个ViewController对象

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController {
    
    ContentVCViewController *vc = (ContentVCViewController *)viewController;
    NSUInteger index = vc.vcIndex;
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    index--;
    // 返回的ViewController，将被添加到相应的UIPageViewController对象上。
    // UIPageViewController对象会根据UIPageViewControllerDataSource协议方法,自动来维护次序
    // 不用我们去操心每个ViewController的顺序问题
    self.currentPageIndex = index;
    if (self.currentPageType == 0) {
        NomalViewController *nomal = [NomalViewController factory_newNomalVCWithIndex:index];
        return nomal;
    }
    
    
    ContentVCViewController *tvc =[ContentVCViewController factory_newVCWithIndex:index];
    [tvc scrollToBottom];
    return tvc;
    
    
}

#pragma mark 返回下一个ViewController对象

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController {
    ContentVCViewController *vc = (ContentVCViewController *)viewController;
    NSUInteger index = vc.vcIndex;
    if (index == NSNotFound) {
        return nil;
    }
    index++;
    self.currentPageIndex = index;
    if (self.currentPageType == 0) {
        NomalViewController *nomal = [NomalViewController factory_newNomalVCWithIndex:index];
        return nomal;
    }
    return [ContentVCViewController factory_newVCWithIndex:index];
    
    
}



-(void)click
{
    NSLog(@"点击index=%ld",self.currentPageIndex);
    self.currentPageType = 1;
    self.pageViewController = nil;
    [self addPageVV];
}

-(UIPageViewController *)pageViewController
{
    if (!_pageViewController) {
        _pageViewController = [[UIPageViewController alloc]initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:self.currentPageType options:nil];
        _pageViewController.delegate = self;
        _pageViewController.dataSource = self;
    }
    return _pageViewController;
}


-(UIViewController *)getViewCOntrollerxx
{
    UIViewController *vc = [[UIViewController alloc]init];
    vc.view.backgroundColor = [UIColor redColor];
    return vc;
}



@end

//
//  ContentVCViewController.h
//  testDHFunction
//
//  Created by admin on 2020/12/18.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ContentVCViewController : UIViewController
@property(nonatomic, assign)NSInteger vcIndex;
+(instancetype)factory_newVCWithIndex:(NSInteger)index;
-(void)scrollToindexPage:(NSInteger)index;
-(void)scrollToBottom;
@end

NS_ASSUME_NONNULL_END

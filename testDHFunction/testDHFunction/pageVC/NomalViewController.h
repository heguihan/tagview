//
//  NomalViewController.h
//  testDHFunction
//
//  Created by admin on 2020/12/19.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NomalViewController : UIViewController
@property(nonatomic, assign)NSInteger vcIndex;
+(instancetype)factory_newNomalVCWithIndex:(NSInteger)index;
@end

NS_ASSUME_NONNULL_END

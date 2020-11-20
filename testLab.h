//
//  testLab.h
//  Test130Function
//
//  Created by ysh on 2020/11/20.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef enum
{
    VerticalAlignmentTop = 0, // default
    VerticalAlignmentMiddle,
    VerticalAlignmentBottom,
} VerticalAlignment;


@interface testLab : UILabel
@property(nonatomic,assign)VerticalAlignment verticalAlignment;
@end

NS_ASSUME_NONNULL_END

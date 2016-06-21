//
//  UIViewController+Presenter.h
//  RuntimePractice_Demo
//
//  Created by admin on 16/6/21.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^RetryHandler)();


@interface UIViewController (Presenter)

/**
 *  加载视图
 */
- (void)startLoading;

/**
 *  停止加载并消失
 */
- (void)stopLoading;

/**
 *  空白页面
 */
- (void)showBlankView:(UIView *)view message:(NSString *)message;

/**
 *  销毁空白视图
 */
- (void)hideBlankView;

/**
 *  显示错误提示页面
 */
- (void)showFailureViewAndRecallHanlde:(RetryHandler)callBack
                           inContainer:(UIView *)view;

/**
 *  销毁错误提示页面
 */
- (void)hideFailureView;
@end

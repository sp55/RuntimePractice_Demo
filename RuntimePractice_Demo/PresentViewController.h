//
//  PresentViewController.h
//  RuntimePractice_Demo
//
//  Created by admin on 16/6/21.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    ShowTypeLoading,
    ShowTypeLoadingAndBlank,
    ShowTypeLoadingAndFaiture
}ShowType;


@interface PresentViewController : UIViewController

@property (assign, nonatomic) ShowType showType;
@end

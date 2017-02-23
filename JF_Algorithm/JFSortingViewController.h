//
//  JFSortingViewController.h
//  JF_Algorithm
//
//  Created by linjianfang on 2017/1/22.
//  Copyright © 2017年 linjianfang. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, SortType) {
    buddleSort,
    quickSort,
    selectSort,
    inserSort,
    shellSort
};
@interface JFSortingViewController : UIViewController
@property(nonatomic,assign)SortType sortType;
@property(nonatomic,strong)NSString *algorithmString;

@end

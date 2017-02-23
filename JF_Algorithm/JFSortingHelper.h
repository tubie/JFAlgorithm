//
//  JFSortingHelper.h
//  JF_Algorithm
//
//  Created by linjianfang on 2017/1/23.
//  Copyright © 2017年 linjianfang. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface JFSortingHelper : NSObject

+ (instancetype)sharedInstance;

/**
 *
 *冒泡排序
 *
 ******/
- (void)buddleSort:(NSMutableArray *)array;



/**
 *
 *快速排序
 *
 ******/
-(void)quickSortWithArray:(NSMutableArray *)array;



/**
 *
 *选择排序
 *
 ******/
- (void)selectSort:(NSMutableArray *)array;


/**
 *
 *插入排序
 *
 ******/
- (void)inserSort:(NSMutableArray *)array;


/**
 *
 *希尔排序,初始的dk值为array.count/2
 *
 ******/
- (void)ShellSort:(NSMutableArray *)array dk:(int)dk;


//排序后的数组
@property(nonatomic,strong)NSMutableArray *finalArray;


@end

//
//  JFSortingViewController.m
//  JF_Algorithm
//
//  Created by linjianfang on 2017/1/22.
//  Copyright © 2017年 linjianfang. All rights reserved.
//

#import "JFSortingViewController.h"
#define JFRandomData [NSString stringWithFormat:@"%d", arc4random_uniform(10)]
@interface JFSortingViewController ()
@property(nonatomic, strong) UILabel *showNumberLabel;
@property(nonatomic, strong) UILabel *sortedNumberLabel;

@property(nonatomic, strong) UIButton *creatNumberBtn;
@property(nonatomic, strong) UIButton *sortNumberBtn;

/** 用来显示的假数据 */
@property (strong, nonatomic) NSMutableArray *data;


@end

@implementation JFSortingViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = self.algorithmString;
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.showNumberLabel];
    [self.view addSubview:self.creatNumberBtn];
    [self.view addSubview:self.sortNumberBtn];
    [self.view addSubview:self.sortedNumberLabel];
    [self initData];
}

-(void)initData{
    self.data = [NSMutableArray array];
    [self.data removeAllObjects];
    for (int i = 0; i<9; i++) {
        [self.data addObject:JFRandomData];
    }
   NSString *string = [self.data componentsJoinedByString:@",  "];
    self.showNumberLabel.text = string;

}
-(UILabel *)showNumberLabel{
    if (!_showNumberLabel) {
        _showNumberLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 100, self.view.bounds.size.width, 100)];
        _showNumberLabel.backgroundColor = [UIColor lightGrayColor];
        _showNumberLabel.numberOfLines = 0;
    }
    return _showNumberLabel;
}

-(UILabel *)sortedNumberLabel{
    if (!_sortedNumberLabel) {
        _sortedNumberLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.showNumberLabel.frame.origin.y+self.showNumberLabel.frame.size.height +10, self.view.bounds.size.width, 100)];
        _sortedNumberLabel.backgroundColor = [UIColor lightGrayColor];
        _sortedNumberLabel.numberOfLines = 0;
    }
    return _sortedNumberLabel;
}


-(UIButton *)creatNumberBtn{
    if (!_creatNumberBtn) {
        _creatNumberBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _creatNumberBtn.frame = CGRectMake(10, self.sortedNumberLabel.frame.origin.y + self.sortedNumberLabel.frame.size.height+ 10, (self.view.bounds.size.width-30)/2, 44);
        _creatNumberBtn.backgroundColor = [UIColor lightGrayColor];
        [_creatNumberBtn setTitle:@"生成随机数" forState:UIControlStateNormal];
        [_creatNumberBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        _creatNumberBtn.tag = 98;
    }
    return _creatNumberBtn;
}

-(UIButton *)sortNumberBtn{
    if (!_sortNumberBtn) {
        _sortNumberBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _sortNumberBtn.frame = CGRectMake(self.creatNumberBtn.frame.origin.x + self.creatNumberBtn.frame.size.width+ 10, self.sortedNumberLabel.frame.origin.y + self.sortedNumberLabel.frame.size.height+ 10, (self.view.bounds.size.width-30)/2, 44);
        _sortNumberBtn.backgroundColor = [UIColor lightGrayColor];
        [_sortNumberBtn setTitle:self.algorithmString forState:UIControlStateNormal];
        [_sortNumberBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        _sortNumberBtn.tag = 99;

    }
    return _sortNumberBtn;
}


-(void)btnClick:(UIButton *)button{
    if (button.tag == 98) {
        [self initData];
    }else{
//        [self buddleSort:self.data];
//        [self quickSortWithArray:self.data];
        [self selectSort:self.data];
    }

}
/**
 *
 *冒泡排序
 *
 *
 *
 ******/
- (void)buddleSort:(NSMutableArray *)array
{
    if(array == nil || array.count == 0){
        return;
    }
    for (int i = 1; i < array.count; i++) {
        for (int j = 0; j < array.count - i; j++) {
            if ([array[j] compare:array[j+1]] == NSOrderedDescending) {
                [array exchangeObjectAtIndex:j withObjectAtIndex:j+1];
            }
        }
    }
    NSString *string = [array componentsJoinedByString:@",  "];
    self.sortedNumberLabel.text = string;
}
/**
 *
 *快速排序
 *
 *
 *
 ******/
-(void)quickSortWithArray:(NSArray *)aData{
    NSMutableArray *data = [[NSMutableArray alloc] initWithArray:aData];
    [self quickSortWithArray:data left:0 right:[aData count]-1];
    NSString *string = [data componentsJoinedByString:@",  "];
    self.sortedNumberLabel.text = string;
//    NSLog(@"快速排序后的结果：%@",[data description]);
    
}

-(void)quickSortWithArray:(NSMutableArray *)aData left:(NSInteger)left right:(NSInteger)right{
    if (right > left) {
        NSInteger i = left;
        NSInteger j = right + 1;
        while (true) {
            while (i+1 < [aData count] && [aData objectAtIndex:++i] < [aData objectAtIndex:left]) ;
            while (j-1 > -1 && [aData objectAtIndex:--j] > [aData objectAtIndex:left]) ;
            if (i >= j) {
                break;
            }
            [self swapWithData:aData index1:i index2:j];
        }
        [self swapWithData:aData index1:left index2:j];
        [self quickSortWithArray:aData left:left right:j-1];
        [self quickSortWithArray:aData left:j+1 right:right];
    }
}
-(void)swapWithData:(NSMutableArray *)aData index1:(NSInteger)index1 index2:(NSInteger)index2{
    NSNumber *tmp = [aData objectAtIndex:index1];
    [aData replaceObjectAtIndex:index1 withObject:[aData objectAtIndex:index2]];
    [aData replaceObjectAtIndex:index2 withObject:tmp];
}

/**
 *
 *选择排序
 *
 *
 *
 ******/
- (void)selectSort:(NSMutableArray *)array
{
    if(array == nil || array.count == 0){
        return;
    }
    
    int min_index;
    for (int i = 0; i < array.count; i++) {
        min_index = i;
        for (int j = i + 1; j<array.count; j++) {
            if ([array[j] compare:array[min_index]] == NSOrderedAscending) {
                [array exchangeObjectAtIndex:j withObjectAtIndex:min_index];
            }
            
        }
    }
    NSString *string = [array componentsJoinedByString:@",  "];
    self.sortedNumberLabel.text = string;
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

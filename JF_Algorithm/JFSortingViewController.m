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
        [self buddleSort:self.data];
    
    }

}

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

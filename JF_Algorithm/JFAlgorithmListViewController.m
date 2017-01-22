//
//  JFAlgorithmListViewController.m
//  JF_Algorithm
//
//  Created by linjianfang on 2017/1/18.
//  Copyright © 2017年 linjianfang. All rights reserved.
//

#import "JFAlgorithmListViewController.h"
#import "JFSortingViewController.h"

@interface JFAlgorithmListViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView *jfTableView;
@property(nonatomic,strong)NSArray *algorithmArray;

@end

@implementation JFAlgorithmListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"算法列表";
    [self.view addSubview:self.jfTableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  self.algorithmArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
        cell.accessoryType= UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = self.algorithmArray [indexPath.row];

    }
    return cell;
}



-(UITableView *)jfTableView{
    if (!_jfTableView) {
        _jfTableView = [[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
        _jfTableView.dataSource = self;
        _jfTableView.delegate = self;
    }
    return _jfTableView;
}

-(NSArray *)algorithmArray{
    if (!_algorithmArray) {
        _algorithmArray = @[@"冒泡排序",@"快速排序",@"选择排序",@"插入排序",@"希尔排序"];
    }
    return _algorithmArray;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    JFSortingViewController *sortVC = [[JFSortingViewController alloc]init];
    sortVC.algorithmString = self.algorithmArray[indexPath.row];
    [self.navigationController pushViewController:sortVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end

# JFAlgorithm
基础算法iOS实现
# 冒泡排序

```
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

```

# 快速排序

```
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

```
# 选择排序

```
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
```

# 插入排序
```
- (void)inserSort:(NSMutableArray *)array
{
    if(array == nil || array.count == 0){
        return;
    }
    
    for (int i = 0; i < array.count; i++) {
        NSNumber *temp = array[i];
        int j = i-1;
        
        while (j >= 0 && [array[j] compare:temp] == NSOrderedDescending) {
            [array replaceObjectAtIndex:j+1 withObject:array[j]];
            j--;
            
        }
        
        [array replaceObjectAtIndex:j+1 withObject:temp];
    }
    NSString *string = [array componentsJoinedByString:@",  "];
    self.sortedNumberLabel.text = string;

    
}
```

# 希尔排序
```
- (void)ShellSort:(NSMutableArray *)array dk:(int)dk
{
    
    if(array == nil || array.count == 0||dk>=array.count){
        return;
    }
    
    for (int i = 0; i < array.count; i ++) {
        NSNumber *temp = array[i];
        int j = i - dk;
        
        //若第i个元素大于i-1元素，直接插入。小于的话，移动有序表后插入
        while (j >= 0 && [array[j] compare:temp] == NSOrderedDescending) {
            [array replaceObjectAtIndex:j+dk withObject:array[j]];
            j-=dk;
        }
        [array replaceObjectAtIndex:j+dk withObject:temp];
        
    }
    
    while (dk>=1) {
        dk = dk/2;
        [self ShellSort:array dk:dk];
    }
    
    NSString *string = [array componentsJoinedByString:@",  "];
    self.sortedNumberLabel.text = string;

}
```


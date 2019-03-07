//
//  ViewController.m
//  AlgorithmDemo
//
//  Created by 王泽龙 on 2019/3/6.
//  Copyright © 2019 王泽龙. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *tempArr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSArray *array = @[@(6), @(1), @(2), @(7), @(9), @(3), @(4), @(5), @(10), @(8)];
    NSMutableArray *arr = [NSMutableArray arrayWithArray:array];

    // 选择排序
//    [self selectSort:arr];

    // 快速排序
//    [self quickSortArray:arr withLeftIndex:0 andRightIndex:arr.count - 1];
//    NSLog(@"%@",arr);
//
//    // 字符串逆序输出 better late then never - never then late better
//    [self reverseString];
//
//    // 归并排序
//    [self mergeSortArray:arr lowIndex:0 highIndex:arr.count - 1];
//    NSLog(@"%@",arr);
//
    // 冒泡排序
    [self maopao:arr];
    
    // url 拼接
//    [self urlAppend]
}

-(NSMutableArray *)tempArr {
    if (_tempArr == nil) {
        _tempArr = [NSMutableArray array];
    }
    return _tempArr;
}

#pragma mark ---------------------字符串逆序输出 better late then never - never then late better
/**
 字符串逆序输出 better late then never - never then late better
 */
- (void)reverseString {
    
    NSString *str = @"better late then never";
    NSArray *arr = [str componentsSeparatedByString:@" "];
    NSArray *reversedArray = [[arr reverseObjectEnumerator] allObjects];
    
    NSMutableArray *newArray = [NSMutableArray arrayWithArray:reversedArray];
    NSMutableString *reverseStr = [NSMutableString new];
    
    [newArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if (idx != 0 && idx != reversedArray.count) {
            [reverseStr appendString:@" "];
        }
        
        [reverseStr appendString:obj];
    }];
    
    NSLog(@"reverseStr=%@, reverseStrLength=%ld", reverseStr, reverseStr.length);
}

#pragma mark ---------------------归并排序

/**
 归并排序
 该方法的基本思想是：
 1.分解：将待排序的问题分解成大小大致相等的两部分。
 2.求解子问题：用归并排序的方法对两个子问题进行递归排序。
 3.合并(merge)：将排好序的有序子序列进行合并，得到符合要求的子序列。
 */
- (void)mergeSortArray:(NSMutableArray *)array lowIndex:(NSInteger)lowIndex highIndex:(NSInteger)highIndex {
    if (lowIndex >= highIndex) {
        return;
    }
    NSInteger midIndex = lowIndex + (highIndex - lowIndex) / 2;
    [self mergeSortArray:array lowIndex:lowIndex highIndex:midIndex];
    [self mergeSortArray:array lowIndex:midIndex + 1 highIndex:highIndex];
    [self mergeArray:array lowIndex:lowIndex midIndex:midIndex highIndex:highIndex];
}

- (void)mergeArray:(NSMutableArray *)array lowIndex:(NSInteger)lowIndex midIndex:(NSInteger)midIndex highIndex:(NSInteger)highIndex {
    for (NSInteger i = lowIndex; i <= highIndex; i ++) {
        self.tempArr[i] = array[i];
    }
    
    NSInteger k = lowIndex;
    NSInteger l = midIndex + 1;
    for (NSInteger j = lowIndex; j <= highIndex; j ++) {
        if (l > highIndex) {
            array[j] = self.tempArr[k];
            k++;
        } else if (k > midIndex) {
            array[j] = self.tempArr[l];
            l++;
        } else if ([self.tempArr[k] integerValue] > [self.tempArr[l] integerValue]) {
            array[j] = self.tempArr[l];
            l++;
        } else {
            array[j] = self.tempArr[k];
            k++;
        }
    }
}

#pragma mark --------------------- 选择排序
/**
 选择排序：
    选择排序的工作原理是每一次从待排序的数据元素中选出最小（或最大）的一个元素，存放在序列的起始位置，直到全部待排序的数据元素排完。
    对以下一组数据进行升序排序（选择排序）。
 */
- (void)selectSort:(NSMutableArray *)array {
    
    if (array.count < 1) {
        return;
    }
    
    for (int i = 0; i < array.count - 1; i++) {
        for (int j = i + 1; j < array.count; j++) {
            if ([array[i] integerValue] > [array[j] integerValue]) {
                NSNumber *temp = array[i];
                array[i] = array[j];
                array[j] = temp;
            }
        }
    }
    
    for (int i = 0; i < array.count; i++) {
        NSLog(@"%@ ", array[i]);
    }
}

#pragma mark --------------------- 冒泡排序
/**
 冒泡排序的基本思想：
 从无序序列头部开始，进行两两比较，根据大小交换位置，直到最后将最大（小）的数据元素交换到了无序队列的队尾，
 从而成为有序序列的一部分；下一次继续这个过程，直到所有数据元素都排好序。
 */
- (void)maopao:(NSMutableArray *)array {
    
    if (array.count < 1) {
        return;
    }
    // @[@(6), @(1), @(2), @(7), @(9), @(3), @(4), @(5), @(10), @(8)]
    //遍历`数组的个数`次
    /*
     i = 0 的时候，j的相邻两个位置都要比较排一下位置：
     j = 0 的时候：arr_M = 41235
     j = 1 的时候：arr_M = 42135
     j = 2 的时候：arr_M = 42315
     j = 3 的时候：arr_M = 42351
     
     i = 1;
     ……  ……
     */
    for (int i = 0; i < array.count; i++) {
        
        //遍历数组的每一个`索引`（不包括最后一个,因为比较的是j+1）
        for (int j = 0; j < array.count - 1; j++) {
            
            //根据索引的`相邻两位`进行`比较`
            if (array[j] < array[j+1]) {
                [array exchangeObjectAtIndex:j withObjectAtIndex:j+1];
            }
        }
    }
    NSLog(@"%@", array);
}

#pragma mark --------------------- 快速排序：
/**
 快速排序：
 分别从初始序列“6 1 2 7 9 3 4 5 10 8”两端开始“探测”。先从右往左找一个小于 6 的数，再从左往右找一个大于 6 的数，然后交换他们。这里可以用两个变量 i 和 j，分别指向序列最左边和最右边。我们为这两个变量起个好听的名字“哨兵 i”和“哨兵 j”。刚开始的时候让哨兵 i 指向序列的最左边（即 i=1），指向数字 6。让哨兵 j 指向序列的最右边（即 j=10），指向数字 8。
 首先哨兵 j 开始出动。因为此处设置的基准数是最左边的数，所以需要让哨兵 j 先出动，这一点非常重要（请自己想一想为什么）。哨兵 j 一步一步地向左挪动（即 j--），直到找到一个小于 6 的数停下来。接下来哨兵 i 再一步一步向右挪动（即 i++），直到找到一个数大于 6 的数停下来。最后哨兵 j 停在了数字 5 面前，哨兵 i 停在了数字 7 面前。
 */
- (void)quickSortArray:(NSMutableArray *)array withLeftIndex:(NSInteger)leftIndex andRightIndex:(NSInteger)rightIndex {
    
    if (leftIndex >= rightIndex) {//如果数组长度为0或1时返回
        return ;
    }
    
    NSInteger i = leftIndex;
    NSInteger j = rightIndex;
    //记录比较基准数
    NSInteger key = [array[i] integerValue];
    // @(6), @(1), @(2), @(7), @(9), @(3), @(4), @(5), @(10), @(8)
    while (i < j) {
        /**** 首先从右边j开始查找比基准数小的值 ***/
        while (i < j && [array[j] integerValue] >= key) {//如果比基准数大，继续查找
            j--;
        }
        //如果比基准数小，则将查找到的小值调换到i的位置
        array[i] = array[j];
        
        /**** 当在右边查找到一个比基准数小的值时，就从i开始往后找比基准数大的值 ***/
        while (i < j && [array[i] integerValue] <= key) {//如果比基准数小，继续查找
            i++;
        }
        //如果比基准数大，则将查找到的大值调换到j的位置
        array[j] = array[i];
        
    }
    
    //将基准数放到正确位置
    array[i] = @(key);
    
    /**** 递归排序 ***/
    //排序基准数左边的
    [self quickSortArray:array withLeftIndex:leftIndex andRightIndex:i - 1];
    //排序基准数右边的
    [self quickSortArray:array withLeftIndex:i + 1 andRightIndex:rightIndex];
}


#pragma mark --------------------- url拼接
- (void)urlAppend {
    
    NSString *a = @"http://www.baidu.com/aa/ccc/dd/gg.html#!/main_l1";
    NSString *b = @"http://www.baidu.com/aa/ccc/dd/gg.html?a=1#!/main_l1";
    NSString *c = @"http://www.baidu.com/aa/ccc/dd/gg.html?b=2&#!/main_l1";
    NSString *d = @"http://www.baidu.com/aa/ccc/dd/gg.html?inviteUid=10010#!/main_l1";
    NSString *e = @"http://www.baidu.com/aa/ccc/dd/gg.html?a=1&inviteUid=10010#!/main_l1";
    NSString *f = @"http://www.baidu.com/aa/ccc/dd/gg.html?#!/main_l1?bb=123";
    NSMutableArray *urlarray = [NSMutableArray array];
    [urlarray addObject:a];
    [urlarray addObject:b];
    [urlarray addObject:c];
    [urlarray addObject:d];
    [urlarray addObject:e];
    [urlarray addObject:f];
    
    for (NSString *url in urlarray) {
        NSString *newUrl =  [self conponenetUrl:url];
        NSLog(@"%@", newUrl);
    }
}

- (NSString *)conponenetUrl:(NSString *)urlString {
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSString *query = url.query;
    NSURLComponents *components = [NSURLComponents new];
    // 与H5约定 需要拼接某些参数aaa=cc
    if (query) {
        query = [NSString stringWithFormat:@"%@&%@", url.query, @"aaa=cc"];
    } else {
        query = @"aaa=cc";
    }
    [components setScheme:url.scheme];
    [components setHost:url.host];
    [components setQuery:query];
    [components setFragment:url.fragment];
    [components setPath:url.path];
    
    return components.URL.absoluteString;
    
}
@end

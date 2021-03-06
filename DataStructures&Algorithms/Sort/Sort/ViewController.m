//
//  ViewController.m
//  Sort
//
//  Created by le on 2018/7/11.
//  Copyright © 2018年 le. All rights reserved.
//

#import "ViewController.h"
#import "LinkList.h"
#import "LinkListNode.swift"
#import "TestViewController.h"
#import "PBPerson.h"
#import <objc/runtime.h>


//哈希表、数组方式
struct DataItem {
    int data;
    int key;
};

struct DataItem *hashArray[20];
struct DataItem *dummyItem;
struct DataItem *item;

int hashCode(int key) {
    return key % 20;
}

struct DataItem *searchHashArray(int key) {
    int hashIndex = hashCode(key);
    while (hashArray[hashIndex] != NULL) {
        if (hashArray[hashIndex] ->key == key) {
            return hashArray[hashIndex];
        }
        ++hashIndex;
        hashIndex %= 20;
    }
    return NULL;
}

void inseartHashArray(int key, int data) {
    struct DataItem *item = (struct DataItem *)malloc(sizeof(struct DataItem));
    item ->data = data;
    item ->key = key;

    int hashIndex = hashCode(key);
    while (hashArray[hashIndex] != NULL && hashArray[hashIndex] ->key != -1) {
        ++hashIndex;
        hashIndex %= 20;
    }
    hashArray[hashIndex] = item;
}

struct DataItem *deleteHashArray(struct DataItem *item) {
    int key = item ->key;
    int hashIndex = hashCode(key);
    while (hashArray[hashIndex] != NULL) {
        if (hashArray[hashIndex] ->key == key) {
            struct DataItem *temp = hashArray[hashIndex];
            hashArray[hashIndex] = dummyItem;
            return temp;
        }
        ++hashIndex;
        hashIndex %= 20;
    }
    return NULL;
}

void displayHashArray() {
    int i = 0;
    for (i = 0; i<20; i++) {
        if (hashArray[i] != NULL) {
            printf("(%d,%d)",hashArray[i]->key,hashArray[i]->data);
        }else {
            printf(" ~ ");
        }
    }
    printf("\n");
}

@interface ViewController ()

@property (nonatomic, copy) NSString *target;
@property (nonatomic, strong) NSMutableString *test;

@end

@implementation ViewController


void printString(NSString *a) {
    NSLog(@"string=%@ %p classs: %@",a,a,[a class]);
}


- (void)viewDidLoad {
    [super viewDidLoad];


    self.test = [NSMutableString string];
    [self.test appendString:@"haha"];


    dummyItem = (struct DataItem *)malloc(sizeof(struct DataItem));
    dummyItem ->data = -1;
    dummyItem ->key = -1;
    inseartHashArray(1, 20);
    inseartHashArray(2, 70);
    inseartHashArray(42, 80);
    inseartHashArray(4, 25);
    inseartHashArray(12, 44);
    inseartHashArray(14, 32);
    inseartHashArray(17, 11);
    inseartHashArray(13, 78);
    inseartHashArray(37, 97);
    inseartHashArray(38, 97);
    inseartHashArray(39, 97);
    inseartHashArray(40, 97);
    inseartHashArray(41, 97);
    inseartHashArray(42, 97);
    inseartHashArray(42, 97);
//    inseartHashArray(44, 97);
//    inseartHashArray(43, 97);
//    inseartHashArray(45, 97);
//    inseartHashArray(46, 97);
//    inseartHashArray(47, 97);
//    inseartHashArray(48, 97);
//    inseartHashArray(49, 97);
//    inseartHashArray(50, 97);
//    inseartHashArray(51, 97);
//    inseartHashArray(52, 97);
    displayHashArray();

    item = searchHashArray(37);


//    PBPerson *person = [[PBPerson alloc]initWithFirstName:@"a" lastName:@"b"];
//
//
//
//    self.view.backgroundColor = [UIColor whiteColor];
//
//
//    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
//    btn.frame = CGRectMake(100, 100, 100, 30);
//    btn.backgroundColor = [UIColor redColor];
//    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn];
//
//    NSTimer *timer = [NSTimer timerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        NSLog(@"123");
//    }];
//
//    int x = 10;
//    x ++;
//    先加x的值，然后将x的值再加1
//    11 10
//    ++x 先将x加1，再加值
//    12

//    int d = (x++) + (++x) + (x++);
    //10 + 12 + 12
    //
    
//    NSString *text = @"sssssss";
//    text = [text stringByReplacingOccurrencesOfString:@"\\n" withString:@"/n"];
//    NSLog(@"%@",text);
    
    NSString *cs = @"Const";
    printString(cs);
    printString([cs mutableCopy]);
    printString([[cs mutableCopy] copy]);
    
    
    NSMutableArray *xx = [NSMutableArray arrayWithArray:@[@(2),@(4),@(9),@(3),@(9)]];
    NSMutableArray *bb = [NSMutableArray arrayWithArray:@[@(2),@(4),@(9),@(3),@(9)]];
    
    NSInteger count = 0;
    for (NSInteger i = xx.count - 1; i >= 0; i--) {
        count ++;
        if ([xx[i] integerValue] == 9) {
            xx[i] = [NSNumber numberWithInteger:0];
        }else {
            NSInteger z = [xx[i] integerValue];
            z ++ ;
            xx[i] = [NSNumber numberWithInteger:z];
            NSLog(@"我还在执行 %ld",count);
        }
    }
    NSLog(@"哈哈哈哈 %@",xx);
    
    count = 0;
    for (NSInteger i = bb.count - 1; i >= 0; i--) {
        count ++;
        if ([bb[i] integerValue] == 9) {
            bb[i] = [NSNumber numberWithInteger:0];
        }else {
            NSInteger z = [bb[i] integerValue];
            z ++ ;
            bb[i] = [NSNumber numberWithInteger:z];
            NSLog(@"我还想执行 %ld",count);
            break;
        }
    }
    NSLog(@"哈哈哈哈 %@",bb);
    
    
    NSString *a = @"a";
    NSString *b = [[a mutableCopy] copy];
    
    NSLog(@"%p %p %@",a,b,object_getClass(b));
    
    
    
    NSArray *data = @[@(2),@(2),@(1)];
    int xxxx = [self findMutableInArray:data];
    
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(16.72, 7.22)];
    [path addLineToPoint:CGPointMake(3.29, 20.83)];
    [path addLineToPoint:CGPointMake(0.4, 18.05)];
    [path addLineToPoint:CGPointMake(18.8, -0.47)];
    [path addLineToPoint:CGPointMake(37.21, 18.05)];
    [path addLineToPoint:CGPointMake(34.31, 20.83)];
    [path addLineToPoint:CGPointMake(20.88, 7.22)];
    [path addLineToPoint:CGPointMake(20.88, 42.18)];
    [path addLineToPoint:CGPointMake(16.72, 42.18)];
    [path addLineToPoint:CGPointMake(16.72, 7.22)];
    [path closePath];
    path.lineWidth = 1;
    [[UIColor redColor] setStroke];
    [path stroke];
//    [self.view addSubview:path];
    
    
//    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_main_queue());
////    dispatch_source_set_timer(timer, dispatch_time(DISPATCH_TIME_NOW, <#int64_t delta#>), <#uint64_t interval#>, <#uint64_t leeway#>)
//
//    dispatch_queue_t queue = dispatch_queue_create("com.YiYou.test", DISPATCH_QUEUE_CONCURRENT);
//    for (NSInteger i = 0; i< 100000; i++) {
//        dispatch_async(queue, ^{
//            self.target = [NSString stringWithFormat:@"ddds %ld",i];
//        });
//    }
    
//    dispatch_queue_t serialDispatchQueue = dispatch_queue_create("com.test.queue", NULL);
//
//    dispatch_set_target_queue(dispatch_get_main_queue(), serialDispatchQueue);
    dispatch_queue_t queue = dispatch_get_main_queue();
//    dispatch_sync(queue, ^{
//        dispatch_async(queue, ^{
//            NSLog(@"hello");
//        });
//    });
    
//    NSMutableArray *dataxx = [NSMutableArray arrayWithCapacity:1];
//    for (NSInteger i = 0; i<100000; i++) {
//        dispatch_async(queue, ^{
//            [dataxx addObject:[NSNumber numberWithInteger:i]];
//        });
//    }
    
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)btnClick {
    TestViewController *vc = [[TestViewController alloc]init];
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (int)findMutableInArray:(NSArray *)data {
    int result = 0;
    for (int i = 0; i<data.count; i++) {
        int number = [data[i] intValue];
        result ^= number;
    }
    return result;
}

/*
 运算符
 =  简单赋值运算符
 +=  加且赋值运算符
 -=  减且赋值运算符
 *=  乘且赋值运算符
 /=  除且赋值运算符
 %=  求模且赋值运算符
 <<=  左移且赋值运算符
 >>=  右移且赋值运算符
 &=   按位与且赋值运算符
 ^=   按位异且赋值运算符
 |=   按位或且赋值运算符
 
 
 */


@end

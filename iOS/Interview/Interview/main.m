//
//  main.m
//  Interview
//
//  Created by le on 2018/10/16.
//  Copyright © 2018年 le. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <malloc/malloc.h>
#import <objc/runtime.h>
#import "Block.h"

//
//static int a;//静态全局变量
//int c ;//全局变量

//void (^blk1)(void) = ^{printf("Global Block\n");};
//typedef int(^blkt)(int);
//blkt func(int rate) {
//    return ^(int count) {
//        return rate * 2;
//    };
//}




int main(int argc, const char * argv[]) {
    @autoreleasepool {
<<<<<<< HEAD
        // insert code here...

        void (^blk)(void) = ^{
            printf("Block\n");
        };
        blk();
=======
        
//        static int b; //静态变量
//
//        __block int val = 10;
//        __block int sss = 10;
//        const char *fmt = "Val = %d\n";
//        NSMutableArray *array = [NSMutableArray array];
//        void (^blk)(void) = ^{
//            val = 1;
//            sss = 20;
//        };
//        void (^blk1)(void) = ^ {
//            val = 2;
//        };
//        blk();
//        blk1();
//        blkt(2);
        
//        blk1();
        
        
        Block *blcok = [[Block alloc] init];
        void (^blk3)(void) = ^{
            NSLog(@"%@",blcok);
        };
        blk3();
        
//        __block int val = 0;
//        void (^blk)(void) = [^{
//                                 val++;
//                            }copy];
//        val++;
//        blk();
//        NSLog(@"val = %d",val);
//
//        id __strong array = [[NSMutableArray alloc]init];
//        void (^blk2)(id object) = [^(id obj){
//            [array addObject:obj];
//            NSLog(@"array count = %ld",[array count]);
//        } copy];
//        NSObject *obj = [[NSObject alloc] init];
//        NSObject *obj1 = [[NSObject alloc] init];
//        NSObject *obj2 = [[NSObject alloc] init];
//        blk2(obj);
//        blk2(obj1);
//        blk2(obj2);
>>>>>>> 91b7ca732413d4ab6088eee2bcb8c9c0c9f8aaa3
    }
    return 0;
}



//id __attribute__((objc_ownership(strong))) obj = ((NSObject *(*)(id, SEL))(void *)objc_msgSend)((id)((NSObject *(*)(id, SEL))(void *)objc_msgSend)((id)objc_getClass("NSObject"), sel_registerName("alloc")), sel_registerName("init"));

//
//void (*blk)(void) = ((void (*)())&__main_block_impl_0((void *)__main_block_func_0, &__main_block_desc_0_DATA));
//((void (*)(__block_impl *))((__block_impl *)blk)->FuncPtr)((__block_impl *)blk);
/*
struct __block_impl {
    void *isa;
    int Flags;
    int Reserved;
    void *FuncPtr;
};
 
 struct __main_block_impl_0 {
     struct __block_impl impl;
     struct __main_block_desc_0* Desc;
     //const char *fmt; //block中使用的变量
     //int val; block中使用的变量
     //NSMutableArray *array; //block中使用的变量
     __main_block_impl_0(void *fp, struct __main_block_desc_0 *desc, int flags=0) {
     impl.isa = &_NSConcreteStackBlock;
     impl.Flags = flags;
     impl.FuncPtr = fp;
     Desc = desc;
 }
 };
 static void __main_block_func_0(struct __main_block_impl_0 *__cself) {
     printf("Block\n");
 }
 
 static struct __main_block_desc_0 {
     size_t reserved;
     size_t Block_size;
 } __main_block_desc_0_DATA = { 0, sizeof(struct __main_block_impl_0)};
 
 
 
 __block 标识符
 struct __Block_byref_val_0 {
     void *__isa;
     __Block_byref_val_0 *__forwarding;
     int __flags;
     int __size;
     int val;
 };
 
 struct __main_block_impl_0 {
         struct __block_impl impl;
         struct __main_block_desc_0* Desc;
         const char *fmt;
         __Block_byref_val_0 *val; // by ref
         __main_block_impl_0(void *fp, struct __main_block_desc_0 *desc, const char *_fmt, __Block_byref_val_0 *_val, int flags=0) : fmt(_fmt), val(_val->__forwarding) {
         impl.isa = &_NSConcreteStackBlock;
         impl.Flags = flags;
         impl.FuncPtr = fp;
         Desc = desc;
    }
 };
 
 */

//
//  AppDelegate.h
//  MVVMTest
//
//  Created by le on 2018/12/7.
//  Copyright © 2018 le. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) PXAPIHelper *apiHelper;

+ (AppDelegate *)app;

@end


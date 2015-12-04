//
//  AppDelegate.h
//  iWeather
//
//  Created by HeBin on 15/11/30.
//  Copyright © 2015年 Myzle. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CityListViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) CityListViewController *cityListViewController;

@end


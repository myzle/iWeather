//
//  AddCityViewController.h
//  iWeather
//
//  Created by HeBin on 15/12/9.
//  Copyright © 2015年 Myzle. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ReturnTextBlock)(NSString *showText);

@interface AddCityViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *addCityName;
@property (nonatomic, copy) ReturnTextBlock returnTextBlock;

- (void)returnText:(ReturnTextBlock)block;

@end

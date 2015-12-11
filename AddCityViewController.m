//
//  AddCityViewController.m
//  iWeather
//
//  Created by HeBin on 15/12/9.
//  Copyright © 2015年 Myzle. All rights reserved.
//

#import "AddCityViewController.h"


@interface AddCityViewController ()

@end

@implementation AddCityViewController
- (IBAction)closeView:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)returnText:(ReturnTextBlock)block
{
    self.returnTextBlock = block;
}

- (void)viewWillDisappear:(BOOL)animated
{
    if (self.returnTextBlock != nil) {
        self.returnTextBlock(self.addCityName.text);
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.addCityName becomeFirstResponder];
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

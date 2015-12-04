//
//  CityListViewController.m
//  iWeather
//
//  Created by HeBin on 15/12/1.
//  Copyright © 2015年 Myzle. All rights reserved.
//

#import "CityListViewController.h"
#import "WeatherDataCell.h"
#import "CityData.h"
#import "WeatherDetailViewController.h"

static NSString * const WeatherDataCellIdentifier = @"WeatherDataCell";

@interface CityListViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
//@property (nonatomic, copy) NSMutableArray *cityList;

@end

@implementation CityListViewController
{
    NSMutableArray *_cityList;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    
    UINib *cellNib = [UINib nibWithNibName:WeatherDataCellIdentifier bundle:nil];
    
    [self.tableView registerNib:cellNib forCellReuseIdentifier:WeatherDataCellIdentifier];
    _cityList = [[NSMutableArray alloc] initWithCapacity:100];
    
    CityData *data = [[CityData alloc] initWithCityName:@"北京" andCityID:@"101010100"];
    
    [_cityList addObject:data];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - TableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_cityList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WeatherDataCell *cell = [self.tableView dequeueReusableCellWithIdentifier:WeatherDataCellIdentifier];
    
    CityData *data = _cityList[indexPath.row];
    cell.cityNameLabel.text = data.cityName;
    
    return cell;
}

#pragma mark - TableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    WeatherDetailViewController *controller = [[WeatherDetailViewController alloc] initWithNibName:@"WeatherDetailViewController" bundle:nil];
    
    CityData *data = _cityList[indexPath.row];
    
    controller.cityName = data.cityName;
    
    [self presentViewController:controller animated:YES completion:nil];
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

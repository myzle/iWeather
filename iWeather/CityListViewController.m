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
#import "AddCityViewController.h"

static NSString * const WeatherDataCellIdentifier = @"WeatherDataCell";

@interface CityListViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UIButton *addCityButton;

@end

@implementation CityListViewController
{
    NSMutableArray *_cityList;
    NSString *_newCityName;
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
    
    //Initial array _cityList to store cityname, _newCityName to store the city name returned from the other view
    _cityList = [[NSMutableArray alloc] initWithCapacity:100];
    _newCityName = nil;
    
    //Add default city
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

//Enable swap to delete
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    [_cityList removeObjectAtIndex:indexPath.row];
    
    NSArray *indexPaths = @[indexPath];
    [self.tableView deleteRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Add new city function

- (IBAction)addNewCity:(id)sender {
    AddCityViewController *controller = [[AddCityViewController alloc] init];
    
    [controller returnText:^(NSString *showText) {
        _newCityName = showText;
        CityData *newCity = [[CityData alloc] initWithCityName:_newCityName andCityID:@""];
        NSInteger newCityIndex = [_cityList count];
        [_cityList addObject:newCity];
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:newCityIndex inSection:0];
        NSArray *indexPaths = @[indexPath];
        [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
    }];
    
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

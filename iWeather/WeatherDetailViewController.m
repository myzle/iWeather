//
//  WeatherDetailViewController.m
//  iWeather
//
//  Created by HeBin on 15/12/1.
//  Copyright © 2015年 Myzle. All rights reserved.
//

#import "WeatherDetailViewController.h"

@interface WeatherDetailViewController ()
@property (weak, nonatomic) IBOutlet UILabel *temp;
//@property (nonatomic, copy) void (^ updateUIBlock) (NSMutableDictionary*);
@property (weak, nonatomic) IBOutlet UILabel *windPower;
@property (weak, nonatomic) IBOutlet UILabel *city;
@property (weak, nonatomic) IBOutlet UILabel *highTemp;
@property (weak, nonatomic) IBOutlet UILabel *weather;
@property (weak, nonatomic) IBOutlet UILabel *windDirection;
@property (weak, nonatomic) IBOutlet UILabel *lowTemp;

@end

@implementation WeatherDetailViewController
{
    NSMutableDictionary *_weatherData;
}

- (IBAction)dismissView:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _weatherData = [[NSMutableDictionary alloc] init];
    [self fetchWeatherData: self.cityName];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)fetchWeatherData:(NSString *)cityName
{
    NSDictionary *headers = @{ @"accept": @"application/json",
                               @"content-type": @"application/json",
                               @"apix-key": @"d6e7a6148fcd46f0557fc0671ccd55f2" };
    NSString *escapedURLString = [cityName stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *urlString = [NSString stringWithFormat:@"http://a.apix.cn/apixlife/weather/weather?cityname=%@", escapedURLString];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]
                                                           cachePolicy:NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval:10.0];
    [request setHTTPMethod:@"GET"];
    [request setAllHTTPHeaderFields:headers];
    
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request
                                                completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                    NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
                                                    _weatherData = jsonObject[@"data"];
                                                    
                                                    dispatch_async(dispatch_get_main_queue(), ^{
                                                        self.temp.text = _weatherData[@"temp"];
                                                        self.windPower.text = _weatherData[@"wind_power"];
                                                        self.city.text = _weatherData[@"city"];
                                                        self.highTemp.text = _weatherData[@"high_temp"];
                                                        self.weather.text = _weatherData[@"weather"];
                                                        self.lowTemp.text = _weatherData[@"low_temp"];
                                                        self.windDirection.text = _weatherData[@"wind_direction"];
                                                    });
                                                    
                                                    if (error) {
                                                        NSLog(@"%@", error);
                                                    } else {
                                                        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *) response;
                                                        NSLog(@"%@", httpResponse);
                                                    }
                                                }];
    
    [dataTask resume];
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

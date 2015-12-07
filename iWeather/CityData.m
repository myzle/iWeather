//
//  CityData.m
//  iWeather
//
//  Created by HeBin on 15/12/1.
//  Copyright © 2015年 Myzle. All rights reserved.
//

#import "CityData.h"

@implementation CityData

- (instancetype)initWithCityName:(NSString *)cityName andCityID:(NSString *)cityID
{
    self = [super init];
    
    if(self) {
        self.cityID = cityID;
        self.cityName = cityName;
    }
    
    return self;
}

@end

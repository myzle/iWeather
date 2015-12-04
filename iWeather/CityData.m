//
//  CityData.m
//  iWeather
//
//  Created by HeBin on 15/12/1.
//  Copyright © 2015年 Myzle. All rights reserved.
//

#import "CityData.h"

@implementation CityData

- (instancetype)initWithCityName:(NSString *)name andCityID:(NSString *)id
{
    self = [super init];
    
    if(self) {
        self.cityID = id;
        self.cityName = name;
    }
    
    return self;
}

@end

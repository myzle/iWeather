//
//  CityData.h
//  iWeather
//
//  Created by HeBin on 15/12/1.
//  Copyright © 2015年 Myzle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CityData : NSObject

@property (nonatomic, copy) NSString *cityID;
@property (nonatomic, copy) NSString *cityName;

- (instancetype)initWithCityName: (NSString *)cityName andCityID: (NSString *)cityID;

@end

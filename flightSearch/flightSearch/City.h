//
//  City.h
//  flightSearch
//
//  Created by 5vi5t on 13.10.2020.
//

#import <MapKit/MapKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface City : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *timezone;
@property (nonatomic, strong) NSDictionary *translations;
@property (nonatomic, copy) NSString *countryCode;
@property (nonatomic, copy) NSString *code;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END

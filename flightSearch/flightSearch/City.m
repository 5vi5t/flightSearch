//
//  City.m
//  flightSearch
//
//  Created by 5vi5t on 13.10.2020.
//

#import "City.h"

@implementation City

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
  if (self = [super init]) {
    self.timezone = dictionary[@"time_zone"];
    self.translations = dictionary[@"name_translations"];
    self.name = dictionary[@"name"];
    self.countryCode = dictionary[@"country_code"];
    self.code = dictionary[@"code"];
    NSDictionary *coords = dictionary[@"coordinates"];
    if (coords && ![coords isEqual:[NSNull null]]) {
      NSNumber *lon = coords[@"lon"];
      NSNumber *lat = coords[@"lat"];
      if (lon && ![lon isEqual:[NSNull null]] && lat && ![lat isEqual:[NSNull null]]) {
        self.coordinate = CLLocationCoordinate2DMake(lat.doubleValue, lon.doubleValue);
      }
    }
  }
  return self;
}


@end

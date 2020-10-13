//
//  Country.m
//  flightSearch
//
//  Created by 5vi5t on 13.10.2020.
//

#import "Country.h"

@implementation Country

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
  if (self = [super init]) {
    self.currency = dictionary[@"currency"];
    self.translations = dictionary[@"name_translations"];
    self.name = dictionary[@"name"];
    self.code = dictionary[@"code"];
  }
  return self;
}

@end

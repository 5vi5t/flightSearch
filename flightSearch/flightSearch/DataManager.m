//
//  DataManager.m
//  flightSearch
//
//  Created by 5vi5t on 13.10.2020.
//

#import "DataManager.h"

@interface DataManager ()

@property (nonatomic, strong) NSArray *countries;
@property (nonatomic, strong) NSArray *cities;
@property (nonatomic, strong) NSArray *airports;

@end

@implementation DataManager

+ (instancetype)sharedInstance {
  static DataManager *instance;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    instance = [DataManager new];
  });
  return instance;
}

- (void)loadData {
  dispatch_async(dispatch_get_global_queue(QOS_CLASS_UTILITY, 0), ^{
    NSArray *countriesJsonArray = [self arrayFromFile:@"countries" ofType:@"json"];
    self.countries = [self createObjectsFromArray:countriesJsonArray withType: DataSourceTypeCountry];
    
    NSArray *citiesJsonArray = [self arrayFromFile:@"cities" ofType:@"json"];
    self.cities = [self createObjectsFromArray:citiesJsonArray withType: DataSourceTypeCity];
    
    NSArray *airportsJsonArray = [self arrayFromFile:@"airports" ofType:@"json"];
    self.airports = [self createObjectsFromArray:airportsJsonArray withType: DataSourceTypeAirport];
    
    dispatch_async(dispatch_get_main_queue(), ^{
      [[NSNotificationCenter defaultCenter] postNotificationName:kDataManagerLoadDataDidComplete object:nil];
    });
    NSLog(@"Data loading completed.");
  });
}

- (NSArray *)createObjectsFromArray:(NSArray *)jsonArray withType:(DataSourceType)type {
  NSMutableArray *results = [NSMutableArray new];
  for (NSDictionary *jsonObject in jsonArray) {
    switch (type) {
      case DataSourceTypeCountry: {
        Country *country = [[Country alloc] initWithDictionary: jsonObject];
        [results addObject: country];
        break;
      }
      case DataSourceTypeCity: {
        City *city = [[City alloc] initWithDictionary: jsonObject];
        [results addObject: city];
        break;
      }
      case DataSourceTypeAirport: {
        Airport *airport = [[Airport alloc] initWithDictionary: jsonObject];
        [results addObject: airport];
        break;
      }
    }
  }
  
  return results;
}

- (NSArray *)arrayFromFile:(NSString *)file ofType:(NSString *)type {
  NSString *path = [[NSBundle mainBundle] pathForResource:file ofType:type];
  NSData *data = [NSData dataWithContentsOfFile:path];
  return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
}

//- (NSArray *)countries {
//  return _countries;
//}
//
//- (NSArray *)cities {
//  return _cities;
//}
//
//- (NSArray *)airports {
//  return _airports;
//}

@end

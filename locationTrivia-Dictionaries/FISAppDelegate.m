//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    NSDictionary *empireState = @{ @"name"      : @"Empire State Building",
                     @"latitude"  : @23.432 ,
                     @"longitude" : @-34.34
                     };
    
    NSDictionary *location1 = @{ @"name"      : @"The Flatiron School",
                   @"latitude"  : @34.432 ,
                   @"longitude" : @-23.67
                   };
    
    NSDictionary *location2 = @{ @"name"      : @"Statue Of Liberty",
                   @"latitude"  : @78.34 ,
                   @"longitude" : @92.42
                   };
    
    NSArray *locations = @[ empireState, location1, location2 ];
    NSInteger length = 100;
    CGFloat latitude = 0.1f;
    CGFloat longitude = 0.2f;
    NSString *name = @"Empire State Building";

    NSString *results1 = [self stringByTruncatingNameOfLocation:locations[0] toLength:length];
    NSLog(@"stringByTruncatingNameOfLocation %@", results1);
    
    NSDictionary *results2 = [self dictionaryForLocationWithName:name latitude:latitude longitude:longitude];
    NSLog(@"dictionaryForLocationWithName %@", results2);
    
    NSArray *results3 = [self namesOfLocations:locations];
    NSLog(@"namesOfLocations %@", results3);
    
    BOOL results4 = [self dictionaryIsValidLocation:locations[0]];
    NSLog(@"dictionaryIsValidLocation %d", results4);
    
    NSDictionary *results5 = [self locationNamed:name inLocations:locations];
    NSLog(@"locationNamed %@", results5);

    return YES;
}

- (NSString *)stringByTruncatingNameOfLocation:(NSDictionary *)location toLength:(NSUInteger)length{
    NSString *results = @"";
    if(length <= [location[@"name"] length]){
        results = [location[@"name"] substringToIndex:length];
    } else {
        results = location[@"name"];
    }
    return results;
}
- (NSDictionary *)dictionaryForLocationWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude{
    
    // return values as numbers
    NSNumber *nLatitude = [NSNumber numberWithDouble:latitude];
    NSNumber *nLongitude = [NSNumber numberWithDouble:longitude];
    NSDictionary *results = @{ @"name" : name, @"latitude" : nLatitude, @"longitude" : nLongitude };
    return results;
}
- (NSArray *) namesOfLocations:(NSArray *)locations{
    NSMutableArray *results = [[NSMutableArray alloc] init];
    for (NSDictionary *location in locations){
        [results addObject:location[@"name"]];
    }
    return results;
}
- (BOOL) dictionaryIsValidLocation:(NSDictionary *)location{
    //verify the labels of the keys
    BOOL results = false;
    NSArray *keys = [location allKeys];
    
    if([keys[0] isEqual:@"name"] && [keys[1] isEqual:@"longitude"] && [keys[2] isEqual:@"latitude"]){
        results = true;
    }
        
    return results;
}
- (NSDictionary *) locationNamed:(NSString *)name inLocations:(NSArray *)locations{
    NSDictionary *results = @{};
    for (NSDictionary *location in locations){
        NSString *givenName = location[@"name"];
        if([givenName isEqual:name]){
            results = location;
            break;
        } else {
            results = nil;
        }
    }
    return results;
}

@end

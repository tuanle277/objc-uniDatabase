#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface University : NSObject {
    int world_rank;
    NSString *institution;
    NSString *country;
    NSString *national_rank;
}

@property int world_rank;
@property NSString *institution;
@property NSString *country;
@property int national_rank;

- (id) initWithId: (int) world_rank andName: (NSString *) institution andCountry: (NSString *) country andRank: (int) national_rank;

@end


NS_ASSUME_NONNULL_END

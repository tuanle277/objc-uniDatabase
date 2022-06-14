#import "university.h"

@implementation University

@synthesize world_rank = _world_rank;
@synthesize institution = _institution;
@synthesize country = _country;
@synthesize national_rank = _national_rank;

- (id) initWithId:(int) world_rank andName:(NSString *)institution andCountry:(NSString *)country andRank:(int)national_rank{
    if (self == [super init]) {
        self.world_rank = world_rank;
        self.institution = institution;
        self.country = country;
        self.national_rank = national_rank;
    }
    return self;
}

//- (void) dealloc {
//    self.institution = nil;
//    self.country = nil;
//    [super dealloc];
//}

@end

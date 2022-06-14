#import <Foundation/Foundation.h>
#import <sqlite3.h>

NS_ASSUME_NONNULL_BEGIN

@interface UniversityDatabase : NSObject {
    sqlite3 *_database;
}

+ (UniversityDatabase *) database;
- (NSArray*) universities;
@end

NS_ASSUME_NONNULL_END

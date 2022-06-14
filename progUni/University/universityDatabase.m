#import "universityDatabase.h"
#import "university.h"

@implementation UniversityDatabase

static UniversityDatabase *_database;

+ (UniversityDatabase *) database {
    if (_database == nil){
        _database = [[UniversityDatabase alloc] init];
        NSLog(@"database initialized... %@", _database);
    }
    return _database;
}

- (id)init {
    NSLog (@"init...");
    if ((self = [super init])) {
        // take file sqlite3 as database
        NSString *sqLiteDb = [[NSBundle mainBundle] pathForResource:@"uniData"
            ofType:@"sqlite3"];
        
        // check if there is a problem
        if (sqlite3_open([sqLiteDb UTF8String], &_database) != SQLITE_OK) {
            NSLog(@"Failed to open database!");
        }
    }
    return self;
}

- (NSArray *) universities {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    NSString *query = @"SELECT world_rank, institution, country, national_rank FROM uniData";
    sqlite3_stmt *statement;
    
    if (sqlite3_prepare_v2(_database, [query UTF8String], -1, &statement, nil)
            == SQLITE_OK) {
            while (sqlite3_step(statement) == SQLITE_ROW) {
                //get data from database
                int world_rank = sqlite3_column_int(statement, 1);
                char *nameChars = (char *) sqlite3_column_text(statement, 2);
                char *countryChars = (char *) sqlite3_column_text(statement, 3);
                int national_rank = sqlite3_column_int(statement, 4);
                
                // convert from UTF-8 to NSString
                NSString *institution = [[NSString alloc] initWithUTF8String:nameChars];
                NSString *country = [[NSString alloc] initWithUTF8String:countryChars];
                
                University *university = [[University alloc] initWithId:world_rank andName:institution andCountry:country andRank: national_rank];
                NSLog (@"something added %@", university);
                [array addObject:university];
            }
        sqlite3_finalize(statement);
        sqlite3_close(_database);
    }
    return array;
}



@end

#import "Cell.h"
#import "university.h"

@interface Cell()
@property (strong, nonatomic) NSIndexPath *indexPath;
@end

@implementation Cell

//like constructor but assign model's properties into cell's properties
-(void) setUp: (University* )university withIndexPath: (NSIndexPath *) indexPath {
    self.nameeLabel.text =  university.institution;
    self.countryLabel.text = [NSString stringWithFormat: @"Country: %@", university.country];
    self.nRankLabel.text = [NSString stringWithFormat: @"National rank: %d", university.national_rank];
    self.wRankLabel.text = [NSString stringWithFormat: @"National rank: %d", university.world_rank];
    self.indexPath = indexPath;
}

- (IBAction)logInfoBtn:(UIButton *)sender {
    [self.delegate logInfo:self withIndexPath:self.indexPath];
}


+(NSString *)identifier {
    return @"Cell";
}


@end

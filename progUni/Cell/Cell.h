#import <UIKit/UIKit.h>
#import "university.h"

NS_ASSUME_NONNULL_BEGIN

@protocol tableCellDelegate;

@interface Cell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameeLabel;
@property (weak, nonatomic) IBOutlet UILabel *countryLabel;
@property (weak, nonatomic) IBOutlet UILabel *nRankLabel;
@property (weak, nonatomic) IBOutlet UILabel *wRankLabel;

@property (assign, nonatomic) id <tableCellDelegate> delegate;

-(void) setUp: (University *)university withIndexPath: (nonnull NSIndexPath *) indexPath;
+ (NSString *)identifier;
@end

@protocol tableCellDelegate <NSObject>

-(void)logInfo: (Cell *) cell withIndexPath: (NSIndexPath *) indexPath;
@end

NS_ASSUME_NONNULL_END

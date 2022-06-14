#import <UIKit/UIKit.h>
#import "Cell.h"

@interface ViewController : UIViewController <UITableViewDataSource, UITableViewDelegate, tableCellDelegate>
@property (weak, atomic) IBOutlet UITableView *tableView;

@end


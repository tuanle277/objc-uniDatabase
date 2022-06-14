#import "ViewController.h"
#import "university.h"
#import "universityDatabase.h"

@interface ViewController ()

@end

@implementation ViewController {
    NSArray *datas;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configData];
    [self configTable];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section

{
    return [datas count];
}

- (void)configData {
    datas = [UniversityDatabase database].universities;
    NSLog (@"this is size of array %ld", [datas count]);
}

- (void)configTable {
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    [self.tableView registerNib:[UINib nibWithNibName: Cell.identifier bundle:nil] forCellReuseIdentifier:Cell.identifier];
    self.tableView.rowHeight = 130;
    self.tableView.estimatedRowHeight = 130;
}

- (Cell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    Cell *cell = [tableView dequeueReusableCellWithIdentifier: Cell.identifier];
    University *data = datas[indexPath.row];
    [cell setUp:data withIndexPath:indexPath];
    cell.delegate = self;
    return cell;
}

#pragma mark tableCellDelegate
- (void) logInfo:(Cell *)cell withIndexPath:(NSIndexPath *)indexPath {
    University *item = datas[indexPath.row];
    NSLog ( @"world rank: %d, institution: %@, country: %@, national Rank: %d", item.world_rank, item.institution, item.country, item.national_rank);
}


//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return UITableViewAutomaticDimension;
//}


//- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (editingStyle == UITableViewCellEditingStyleDelete) {
//        [datas removeObjectAtIndex:indexPath.row];
//        [self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
//    }
//}


@end

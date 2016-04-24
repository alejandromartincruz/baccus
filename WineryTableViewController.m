//
//  WineryTableViewController.m
//  Baccus
//
//  Created by Alejandro Martin on 25/3/16.
//  Copyright © 2016 AlejandroMartin. All rights reserved.
//

#import "WineryTableViewController.h"
#import "WineViewController.h"

@interface WineryTableViewController ()

@end

@implementation WineryTableViewController

-(id) initWithModel: (wineryModel *) aModel
              style:(UITableViewStyle) aStyle {
    
    if (self = [super initWithStyle: aStyle]) {
        _model = aModel;
        self.title =@"Baccus";
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.5
                                                                           green:0
                                                                            blue:0.13
                                                                           alpha:1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

-(NSString *) tableView:(UITableView *)tableView
titleForHeaderInSection:(NSInteger)section {
    if (section == RED_WINE_SECTION) {
        return @"Red Wines";
    } else if (section == WHITE_WINE_SECTION) {
        return @"White whines";
    } else {
        return @"Other wines";
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // return the number of sections
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
    if (section == RED_WINE_SECTION) {
        return self.model.redWineCount;
    } else if (section == WHITE_WINE_SECTION) {
        return self.model.whiteWineCount;
    } else {
        return self.model.otherWineCount;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView 
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        // made a new hardcoded cell
        cell = [[UITableViewCell alloc] initWithStyle: UITableViewCellStyleSubtitle
                                  reuseIdentifier: CellIdentifier];
    }
    
    WineModel *wine = nil;
    
    // find which wine (model) is coming
    
    if (indexPath.section == RED_WINE_SECTION) {
        wine = [self.model redWineAtIndex:indexPath.row];
    } else if (indexPath.section == WHITE_WINE_SECTION) {
        wine = [self.model whiteWineAtIndex:indexPath.row];
    } else {
        wine = [self.model otherWineAtIndex:indexPath.row];
    }
    
    // sync cell (view) with model (wine)
    cell.imageView.image = wine.photo;
    cell.textLabel.text = wine.name;
    cell.detailTextLabel.text = wine.wineCompanyName;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Table view delegate

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // from inside a navigation controller
    
    // find out the wine that is coming
    WineModel *wine = nil;
    
    if (indexPath.section == RED_WINE_SECTION) {
        wine = [self.model redWineAtIndex:indexPath.row];
    } else if (indexPath.section == WHITE_WINE_SECTION) {
        wine = [self.model whiteWineAtIndex:indexPath.row];
    } else {
        wine = [self.model otherWineAtIndex:indexPath.row];
    }
   
    
    [self.delegate WineryTableViewController:self
                               didSelectWine:wine];
    
    //Notification
    NSNotification *n = [NSNotification notificationWithName:NEW_WINE_NOTIFICATION_NAME
                                                      object:self
                                                    userInfo:@{WINE_KEY: wine}];
    
    [[NSNotificationCenter defaultCenter] postNotification:n];
}

@end

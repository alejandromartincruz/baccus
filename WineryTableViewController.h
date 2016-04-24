//
//  WineryTableViewController.h
//  Baccus
//
//  Created by Alejandro Martin on 25/3/16.
//  Copyright © 2016 AlejandroMartin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "wineryModel.h"
#import "WineModel.h"

#define RED_WINE_SECTION 0
#define WHITE_WINE_SECTION 1
#define OTHER_WINE_SECTION 2

#define NEW_WINE_NOTIFICATION_NAME @"newWine"
#define WINE_KEY @"wine"

@class WineryTableViewController;

@protocol WineryTableViewControllerDelegate <NSObject>

-(void) WineryTableViewController: (WineryTableViewController *) aWineryVC
                    didSelectWine: (WineModel *) aWine;

@end

@interface WineryTableViewController : UITableViewController

@property (strong, nonatomic) wineryModel *model;
@property (weak, nonatomic) id<WineryTableViewControllerDelegate> delegate;

-(id) initWithModel: (wineryModel *) aModel
              style:(UITableViewStyle) aStyle;

@end
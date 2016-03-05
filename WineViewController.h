//
//  WineViewController.h
//  Baccus
//
//  Created by Alejandro Martin on 5/3/16.
//  Copyright © 2016 AlejandroMartin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WineModel.h"

@interface WineViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *WineryNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UILabel *originLabel;
@property (weak, nonatomic) IBOutlet UILabel *grapesLabel;
@property (weak, nonatomic) IBOutlet UILabel *notesLabel;

@property (weak, nonatomic) IBOutlet UIImageView *photoView;

@property (strong, nonatomic) IBOutletCollection(UIImageView) NSArray *ratingViews;

@property (strong, nonatomic) WineModel *model;

-(id) initWithModel: (WineModel *) aModel;

-(IBAction)displayWeb:(id)sender;

@end

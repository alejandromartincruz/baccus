//
//  WineViewController.m
//  Baccus
//
//  Created by Alejandro Martin on 5/3/16.
//  Copyright © 2016 AlejandroMartin. All rights reserved.
//

#import "WineViewController.h"
#import "WebViewController.h"

@interface WineViewController ()

@end

@implementation WineViewController

-(id) initWithModel: (WineModel *) aModel{
    if (self = [super initWithNibName:nil
                               bundle:nil]) {
        _model = aModel;
        
        self.title = aModel.name;
    }
    
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

// sincroniza modelo y vista
- (void) viewWillAppear:(BOOL)animated {
    self.edgesForExtendedLayout =UIRectEdgeNone;
    [super viewWillAppear:animated];
    
    [self syncModelWithView];
    
    if (self.splitViewController.displayMode == UISplitViewControllerDisplayModePrimaryHidden) {
        self.navigationItem.rightBarButtonItem = self.splitViewController.displayModeButtonItem;
    }
    
    
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.5
                                                                           green:0
                                                                            blue:0.13
                                                                           alpha:1];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

-(IBAction)displayWeb:(id)sender {
    //NSLog(@"Go to %@", self.model.wineCompanyWeb);
    
    //Crear webVC
    WebViewController *webVC = [[WebViewController alloc] initWithModel:self.model];
    
    // push al combinador
    [self.navigationController pushViewController:webVC
                                         animated:YES];
}

#pragma mark - Utils

-(void) syncModelWithView {
    self.nameLabel.text = self.model.name;
    self.typeLabel.text = self.model.type;
    self.originLabel.text = self.model.origin;
    self.notesLabel.text = self.model.notes;
    self.WineryNameLabel.text = self.model.wineCompanyName;
    self.photoView.image = self.model.photo;
    self.grapesLabel.text = [self arrayToString: self.model.grapes];
    
    [self displayRating: self.model.rating];
    
    [self.notesLabel setNumberOfLines:0];
}

-(NSString *) arrayToString: (NSArray *) anArray {
    NSString *repr = nil;
    
    if ([anArray count] == 1) {
        repr = [@"100% " stringByAppendingString:[anArray lastObject]];
    } else {
        repr = [[anArray componentsJoinedByString:@", "] stringByAppendingString:@"."];
    }
    return repr;
}

-(void) displayRating: (int) aRating {
    [self clearRatings];
    
    UIImage *glass = [UIImage imageNamed:@"splitView_score_glass"];
    
    for (int i = 0; i < aRating; i++) {
        [[self.ratingViews objectAtIndex:i]setImage:glass];
    }
}

-(void) clearRatings {
    for (UIImageView *imgView in self.ratingViews) {
        imgView.image = nil;
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UISplitViewControllerDelegate

-(void) splitViewController:(UISplitViewController *)svc
    willChangeToDisplayMode:(UISplitViewControllerDisplayMode)displayMode {
    
    if (displayMode == UISplitViewControllerDisplayModePrimaryHidden) {
        self.navigationItem.rightBarButtonItem = svc.displayModeButtonItem;
    }
    
    if (displayMode == UISplitViewControllerDisplayModeAllVisible) {
        self.navigationItem.rightBarButtonItem = nil;
    }
}


#pragma mark - WineryTableViewControllerDelegate

-(void) WineryTableViewController:(WineryTableViewController *)aWineryVC
                    didSelectWine:(WineModel *)aWine {
    
    self.model =aWine;
    self.title = aWine.name;
    
    [self syncModelWithView];

}

@end

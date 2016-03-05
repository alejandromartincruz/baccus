//
//  WebViewController.h
//  Baccus
//
//  Created by Alejandro Martin on 5/3/16.
//  Copyright © 2016 AlejandroMartin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WineModel.h"

@interface WebViewController : UIViewController <UIWebViewDelegate>

@property (strong, nonatomic) WineModel *model;
@property (weak, nonatomic) IBOutlet UIWebView *browser;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityView;

-(id) initWithModel: (WineModel *) aModel;

@end

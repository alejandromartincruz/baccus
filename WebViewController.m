//
//  WebViewController.m
//  Baccus
//
//  Created by Alejandro Martin on 5/3/16.
//  Copyright © 2016 AlejandroMartin. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

-(id) initWithModel: (WineModel *) aModel {
    if (self = [super initWithNibName:nil
                               bundle:nil]) {
        _model = aModel;
    }
    
    return self;
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self displayURL: self.model.wineCompanyWeb];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIWebViewDelegate

-(void) webViewDidFinishLoad:(UIWebView *)webView {
    [self.activityView stopAnimating];
    [self.activityView setHidden:YES];
}

#pragma mark - Utils

-(void) displayURL: (NSURL *) aURL {
    
    self.browser.delegate = self;
    self.activityView.hidden = NO;
    [self.activityView startAnimating];
    [self.browser loadRequest:[NSURLRequest requestWithURL:aURL]];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

//
//  WebViewController.m
//  Baccus
//
//  Created by Alejandro Martin on 5/3/16.
//  Copyright © 2016 AlejandroMartin. All rights reserved.
//

#import "WebViewController.h"
#import "WineryTableViewController.h"

@interface WebViewController ()

@end

@implementation WebViewController

-(id) initWithModel: (WineModel *) aModel {
    if (self = [super initWithNibName:nil
                               bundle:nil]) {
        _model = aModel;
        
        self.title = @"Web";
    }
    
    return self;
}

- (void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self displayURL: self.model.wineCompanyWeb];
    
    // subscribe notiications
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver: self
               selector:@selector(wineDidChange:)
                   name:NEW_WINE_NOTIFICATION_NAME
                 object:nil];
}

- (void) wineDidChange: (NSNotification*) notification {
    NSDictionary *dict = [notification userInfo];
    
    WineModel *newWine = [dict objectForKey:WINE_KEY];
    
    //update model
    
    self.model = newWine;
    [self displayURL:self.model.wineCompanyWeb];
}

- (void) viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear: animated];
    
    // unsubscribe notifications
    [[NSNotificationCenter defaultCenter] removeObserver:self];
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

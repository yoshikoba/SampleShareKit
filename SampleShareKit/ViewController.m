//
//  ViewController.m
//  SampleShareKit
//
//  Created by kazukoba on 2013/11/04.
//  Copyright (c) 2013年 WalterAlex. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)openActionSheet:(id)sender {
    [self showShareKitActionSheet];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showShareKitActionSheet
{
    // シェアするURL
    NSURL *url = [NSURL URLWithString:@"http://getsharekit.com"];
    SHKItem *item = [SHKItem URL:url title:@"ShareKit is Awsome!" contentType:SHKURLContentTypeWebpage];
    
    // ShareKit用のアクションシート
    SHKActionSheet *actionSheet = [SHKActionSheet actionSheetForItem:item];
    
    // ShareKit を表示するルートビューコントローラ
    // ※ 通常はShareKitが自動的にビューコントローラを検出するが、表示されないこともあるため、確実性のために明示。
    [SHK setRootViewController:self];
    
    // ShareKit用アクションシートを表示
    [actionSheet showInView:self.view];
    
    // ツールバーから表示する場合
    //[actionSheet showFromToolbar:self.parentViewController.navigationController.toolbar];
}

#pragma mark --
#pragma mark Delegate Methods
- (void)sharerStartedSending:(SHKSharer *)sharer
{
    
	NSLog(@"HELLLLLO");
}

- (void)sharerFinishedSending:(SHKSharer *)sharer
{
    NSLog(@"dialogdidcomplete");
  /*  if ([sharer isKindOfClass:[SHKFacebook class]]) {
        NSLog(@"facebook");
        NSDictionary *facebookUserInfo = [[NSUserDefaults standardUserDefaults] objectForKey:@"kSHKFacebookUserInfo"];
        NSLog(@"facebookUserInfo is %@",facebookUserInfo);
    }else{
        NSLog(@"Twitter");
        NSDictionary *twitterUserInfo = [[NSUserDefaults standardUserDefaults] objectForKey:@"kSHKTwitterUserInfo"];
        NSLog(@"twitterUserInfo is %@",twitterUserInfo);
    }
   */
}

- (void)sharer:(SHKSharer *)sharer failedWithError:(NSError *)error shouldRelogin:(BOOL)shouldRelogin
{
    NSLog(@"sharer Failed");
}

- (void)sharerCancelledSending:(SHKSharer *)sharer
{
    NSLog(@"sharer Canceled");
}

- (void)sharerShowOtherAuthorizationErrorAlert:(SHKSharer *)sharer{
    NSLog(@"sharerShowOtherAuthorizationError");
}

- (void)sharerShowBadCredentialsAlert:(SHKSharer *)sharer{
    NSLog(@"sharerShowBadCredentialsAlert");
}

@end

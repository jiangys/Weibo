//
//  OAuthViewController.m
//  Weibo
//
//  Created by jiangys on 15/10/17.
//  Copyright © 2015年 Jiangys. All rights reserved.
//

#import "OAuthViewController.h"
#import "Const.h"
#import "HttpTool.h"
#import "MBProgressHUD+YS.h"
#import "Account.h"
#import "AccountTool.h"

@interface OAuthViewController() <UIWebViewDelegate>

@end

@implementation OAuthViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1.创建一个webView
    UIWebView *webView=[[UIWebView alloc] init];
    webView.frame=self.view.bounds;
    webView.delegate=self;
    [self.view addSubview:webView];
    
    // 2.用webView加载新浪登录页面
    NSString *urlStr=[NSString stringWithFormat:@"https://api.weibo.com/oauth2/authorize?client_id=%@&redirect_uri=%@",AppKey,RedirectURI];
    NSURLRequest *requestUrl=[NSURLRequest requestWithURL:[NSURL URLWithString:urlStr]];
    [webView loadRequest:requestUrl];
}

#pragma mark - webView代理方法
-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [MBProgressHUD showMessage:@"正在加载..."];
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [MBProgressHUD hideHUD];
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [MBProgressHUD hideHUD];
}

/**
 *  监听所有跳转方法
 */
-(BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
    NSString *url=request.URL.absoluteString;
    NSRange range=[url rangeOfString:@"code="];
    if (range.length != 0) {
        // 截取code=后面的参数值
        NSUInteger fromIndex=NSMaxRange(range);
        NSString *code=[url substringFromIndex:fromIndex];
        
        // 利用code换取一个accessToken
        [self accessTokenWithCode:code];
        
        // 禁止加载回调地址
        return NO;
    }
    
    return true;
}

/**
 *  获取token
 *
 *  @param code 授权码
 */
- (void)accessTokenWithCode:(NSString *)code
{
    NSMutableDictionary *params=[NSMutableDictionary dictionary];
    params[@"client_id"] = AppKey;
    params[@"client_secret"] = AppSecret;
    params[@"grant_type"] = @"authorization_code";
    params[@"redirect_uri"] = RedirectURI;
    params[@"code"] = code;
    
    [HttpTool post:@"https://api.weibo.com/oauth2/access_token" params:params success:^(id json)
     {
         [MBProgressHUD hideHUD];
         
         // 将返回的账号字典数据 --> 模型，存进沙盒
         Account *account = [Account accountWithDict:json];
         
         // 存储账号信息
         [AccountTool saveAccount:account];
         
         // 切换窗口的根控制器
         UIWindow *window = [UIApplication sharedApplication].keyWindow;
         [window switchRootViewController];
         
     }failure:^(NSError *error) {
         [MBProgressHUD hideHUD];
         YSLog(@"--MBProgressHUD_error--%@",error);
     }];
}


@end

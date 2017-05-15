//
//  ViewController.m
//  Info
//
//  Created by Michel de Sousa Carvalho on 13/05/17.
//  Copyright © 2017 Michel de Sousa Carvalho. All rights reserved.
//

#import "ViewController.h"
#import "HTTPRequest.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    [HTTPRequest makeGETRequestToURL:URLRequest withCompletionHandler:^(id result, NSError *error) {
        NSLog(@"%@", result);
    }];
    
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end

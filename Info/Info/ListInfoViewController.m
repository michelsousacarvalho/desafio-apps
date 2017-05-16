//
//  ListInfoViewController.m
//  Info
//
//  Created by Michel de Sousa Carvalho on 14/05/17.
//  Copyright © 2017 Michel de Sousa Carvalho. All rights reserved.
//

#import "ListInfoViewController.h"
#import "Reachability.h"
#import "News+CoreDataClass.h"
#import "Image+CoreDataClass.h"
#import "CoverCell.h"
#import "NewsCell.h"
#import "NewsImageCell.h"
#import "ImageCache.h"
#import "NewsRequest.h"
#import "ShowInfoViewController.h"

@interface ListInfoViewController ()
@property (nonatomic, strong) NSArray *allNews;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ListInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [NewsRequest requestNewsAndSaveCoreDataWithCompletion:^{
        self.allNews = [News getAllNews];
        [self.tableView reloadData];
    }];
    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationItem.title  = OGLOBO;
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationItem.title = @"";
}



#pragma mark - UITableViewDataSource
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.allNews.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    News *news = [self.allNews objectAtIndex:indexPath.row];
    
    if(indexPath.row == 0){
        CoverCell *cell = [self.tableView dequeueReusableCellWithIdentifier:coverCellIdentifies];
        cell.author.text = [news.editoria uppercaseString];
        
        cell.titleNews.text = news.titulo;
        if(news.image){
            ImageCache *imageCache = [ImageCache sharedInstance];
            [imageCache.imageRequest fetchImageWithUrl:news.image.urlImage andNameImage:news.titulo withcompletionBlock:^(UIImage *image) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    cell.image.image = image;
                });
            }];
        
        }
        return cell;
    }
    
    
    if(news.image){
       NewsImageCell *cell = [self.tableView dequeueReusableCellWithIdentifier:imageCellIdentifier];
        cell.titleNews.text = news.titulo;
        cell.editoria.text = [news.editoria uppercaseString];
        
        ImageCache *imageCache = [ImageCache sharedInstance];
        [imageCache.imageRequest fetchImageWithUrl:news.image.urlImage andNameImage:news.titulo withcompletionBlock:^(UIImage *image) {
            dispatch_async(dispatch_get_main_queue(), ^{
                cell.imageNews.image = image;
            });
        }];
        
        return cell;
    } else {
        NewsCell *cell = [self.tableView dequeueReusableCellWithIdentifier:newsCellIdentifier];
        cell.titleNews.text = news.titulo;
        cell.editoria.text = [news.editoria uppercaseString];
        return cell;
    }
}

#pragma mark - UITableViewDelegate
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    News *news = [self.allNews objectAtIndex:indexPath.row];
    if(indexPath.row == 0){
        return 200;
    } else if(news.image){
        return 80;
    } else {
        return 70;
    }
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    News *news = [self.allNews objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:segueShowNews sender:news];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:segueShowNews]){
        ShowInfoViewController *showVC = [segue destinationViewController];
        showVC.newsSelected = sender;
    }
    
}


@end

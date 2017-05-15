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

@interface ListInfoViewController ()
@property (nonatomic, strong) NSArray *allNews;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ListInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.allNews = [News getAllNews];

    
    
}



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.allNews.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    News *news = [self.allNews objectAtIndex:indexPath.row];
    
    
    if(news.image){
       NewsImageCell *cell = [self.tableView dequeueReusableCellWithIdentifier:imageCellIdentifier];
        cell.titleNews.text = news.titulo;
        cell.editoria.text = news.editoria;
        
        ImageCache *imageCache = [ImageCache sharedInstance];
        [imageCache.imageRequest fetchImageWithUrl:news.image.urlImage andNameImage:news.image.urlImage withcompletionBlock:^(UIImage *image) {
            dispatch_async(dispatch_get_main_queue(), ^{
                cell.imageNews.image = image;
            });
        }];
        
        return cell;
    } else {
        NewsCell *cell = [self.tableView dequeueReusableCellWithIdentifier:newsCellIdentifier];
        cell.titleNews.text = news.titulo;
        cell.editoria.text = news.editoria;
        return cell;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

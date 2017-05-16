//
//  ShowInfoViewController.m
//  Info
//
//  Created by Michel de Sousa Carvalho on 15/05/17.
//  Copyright © 2017 Michel de Sousa Carvalho. All rights reserved.
//

#import "ShowInfoViewController.h"
#import "ImageCache.h"
#import "Image+CoreDataClass.h"
#import "NSDate+FormattedDate.h"

@interface ShowInfoViewController ()
@property (weak, nonatomic) IBOutlet UILabel *titleNews;
@property (weak, nonatomic) IBOutlet UILabel *subtitle;
@property (weak, nonatomic) IBOutlet UILabel *author;
@property (weak, nonatomic) IBOutlet UILabel *datePublish;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UILabel *textNews;
@property (weak, nonatomic) IBOutlet UILabel *labelPor;
@property (weak, nonatomic) IBOutlet UILabel *subtitleImage;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightImage;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *heightView;

@end

@implementation ShowInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.titleNews.text = self.newsSelected.titulo;
    self.subtitle.text = self.newsSelected.subtitulo;
    if(!self.newsSelected.autor){
        self.labelPor.hidden = true;
    } else {
        self.labelPor.hidden = false;
        self.author.text = self.newsSelected.autor;
    }
    
    self.datePublish.text =  [NSDate formatDate:self.newsSelected.dataPublicacao withFormat:formatDatePublish];
    self.textNews.text = self.newsSelected.texto;
    
    if(self.newsSelected.image){
    ImageCache *imageCache = [ImageCache sharedInstance];
    [imageCache.imageRequest fetchImageWithUrl:self.newsSelected.image.urlImage andNameImage:self.newsSelected.titulo withcompletionBlock:^(UIImage *image) {
        dispatch_async(dispatch_get_main_queue(), ^{
            self.imageView.image = image;
        });
    }];
        if(self.newsSelected.image.legenda){
            self.subtitleImage.text = self.newsSelected.image.legenda;
            self.subtitleImage.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5f];
        }
        
    } else {
        self.heightView.constant = self.heightView.constant - self.heightImage.constant;
        self.heightImage.constant = 10;
    }
    
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationItem.title = self.newsSelected.editoria;
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

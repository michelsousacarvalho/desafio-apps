//
//  NewsImageCell.h
//  Info
//
//  Created by Michel de Sousa Carvalho on 15/05/17.
//  Copyright © 2017 Michel de Sousa Carvalho. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsImageCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageNews;
@property (weak, nonatomic) IBOutlet UILabel *editoria;
@property (weak, nonatomic) IBOutlet UILabel *titleNews;


@end

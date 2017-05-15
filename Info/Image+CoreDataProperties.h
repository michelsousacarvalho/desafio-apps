//
//  Image+CoreDataProperties.h
//  Info
//
//  Created by Michel de Sousa Carvalho on 15/05/17.
//  Copyright © 2017 Michel de Sousa Carvalho. All rights reserved.
//

#import "Image+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface Image (CoreDataProperties)

+ (NSFetchRequest<Image *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *urlImage;
@property (nullable, nonatomic, copy) NSString *legenda;
@property (nullable, nonatomic, retain) News *info;

@end

NS_ASSUME_NONNULL_END

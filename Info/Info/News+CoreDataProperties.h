//
//  News+CoreDataProperties.h
//  Info
//
//  Created by Michel de Sousa Carvalho on 15/05/17.
//  Copyright © 2017 Michel de Sousa Carvalho. All rights reserved.
//

#import "News+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface News (CoreDataProperties)

+ (NSFetchRequest<News *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *titulo;
@property (nullable, nonatomic, copy) NSString *subtitulo;
@property (nullable, nonatomic, copy) NSString *texto;
@property (nullable, nonatomic, copy) NSString *editoria;
@property (nullable, nonatomic, copy) NSString *autor;
@property (nullable, nonatomic, copy) NSString *dataPublicacao;
@property (nullable, nonatomic, retain) Image *image;

@end

NS_ASSUME_NONNULL_END

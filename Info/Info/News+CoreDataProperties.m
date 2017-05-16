//
//  News+CoreDataProperties.m
//  Info
//
//  Created by Michel de Sousa Carvalho on 15/05/17.
//  Copyright © 2017 Michel de Sousa Carvalho. All rights reserved.
//

#import "News+CoreDataProperties.h"

@implementation News (CoreDataProperties)

+ (NSFetchRequest<News *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"News"];
}

@dynamic titulo;
@dynamic subtitulo;
@dynamic texto;
@dynamic editoria;
@dynamic autor;
@dynamic dataPublicacao;
@dynamic image;

@end

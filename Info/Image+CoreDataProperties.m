//
//  Image+CoreDataProperties.m
//  Info
//
//  Created by Michel de Sousa Carvalho on 15/05/17.
//  Copyright © 2017 Michel de Sousa Carvalho. All rights reserved.
//

#import "Image+CoreDataProperties.h"

@implementation Image (CoreDataProperties)

+ (NSFetchRequest<Image *> *)fetchRequest {
	return [[NSFetchRequest alloc] initWithEntityName:@"Image"];
}

@dynamic urlImage;
@dynamic legenda;
@dynamic info;

@end

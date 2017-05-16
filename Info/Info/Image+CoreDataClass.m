//
//  Image+CoreDataClass.m
//  Info
//
//  Created by Michel de Sousa Carvalho on 15/05/17.
//  Copyright © 2017 Michel de Sousa Carvalho. All rights reserved.
//

#import "Image+CoreDataClass.h"
#import "News+CoreDataClass.h"
#import "DataStore.h"

@implementation Image

+(Image *) createImage {
    Image *image = (Image*) [[DataStore sharedManager] createObjectWithEntityName:EntityImage];
    return image;
}


@end

//
//  Image+CoreDataClass.h
//  Info
//
//  Created by Michel de Sousa Carvalho on 15/05/17.
//  Copyright © 2017 Michel de Sousa Carvalho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class News;

NS_ASSUME_NONNULL_BEGIN

@interface Image : NSManagedObject

+(Image *) createImage;

@end

NS_ASSUME_NONNULL_END

#import "Image+CoreDataProperties.h"

//
//  News+CoreDataClass.m
//  Info
//
//  Created by Michel de Sousa Carvalho on 15/05/17.
//  Copyright © 2017 Michel de Sousa Carvalho. All rights reserved.
//

#import "News+CoreDataClass.h"
#import "Image+CoreDataClass.h"
#import "DataStore.h"

@implementation News


+(NSUInteger)countNews {
    return [[DataStore sharedManager] countObjectsForEntity:EntityNews];
}


+(BOOL) verifyExistNewsWithTitle:(NSString *) title {
    if( [[DataStore sharedManager] loadObjectsForEntity:EntityNews withValue:title forAttribute:@"titulo"].count > 0 ){
        return true;
    } else {
        return false;
    }
}


+(News *) createNews {
    News *news = (News*) [[DataStore sharedManager] createObjectWithEntityName:EntityNews];
    
    return news;
}

+(void) saveNews:(News*) news {
    NSError *error;
    [[[DataStore sharedManager] managedObjectContext] save:&error];
}


+(NSArray *) getAllNews {
    NSMutableArray *allNews = [[DataStore sharedManager] loadObjectsForEntity:EntityNews withParameterDictionary:nil];
    return allNews;
}



@end

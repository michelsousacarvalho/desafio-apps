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


+(News *) createNews {
    News *news = (News*) [[DataStore sharedManager] createObjectWithEntityName:EntityNews];
    
    return news;
}

+(void) saveNews:(News*) news {
    [[DataStore sharedManager] updateManagedObject:news];
}


+(NSArray *) getAllNews {
    NSMutableArray *allNews = [[DataStore sharedManager] loadObjectsForEntity:EntityNews withParameterDictionary:nil];
    return allNews;
}



@end

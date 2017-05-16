//
//  News+CoreDataClass.h
//  Info
//
//  Created by Michel de Sousa Carvalho on 15/05/17.
//  Copyright © 2017 Michel de Sousa Carvalho. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Image;

NS_ASSUME_NONNULL_BEGIN

@interface News : NSManagedObject

/**
 @brief Retorna quantidade de noticias que contém no core data
 **/
+(NSUInteger)countNews;

/**
 @brief Cria nova notícia
 **/
+(News *) createNews;

/**
 @brief Salva News no Core data
 **/
+(void) saveNews:(News*) news;

/**
 @brief Faz request de todas as News no Core data
 **/

+(NSArray *) getAllNews;

@end

NS_ASSUME_NONNULL_END

#import "News+CoreDataProperties.h"

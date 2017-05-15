//
//  ImageRequest.h
//  Info
//
//  Created by Michel de Sousa Carvalho on 15/05/17.
//  Copyright © 2017 Michel de Sousa Carvalho. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^ImageRequestBlock)(UIImage* image);

@interface ImageRequest : NSObject

@property (nonatomic, strong) NSMutableDictionary *imagesCache;
@property (nonatomic, strong) NSMutableDictionary *operationCache;
@property (nonatomic, strong) NSOperationQueue *queue;

-(void) fetchImageWithUrl:(NSString *)url andNameImage:(NSString*)nameImage withcompletionBlock:(ImageRequestBlock)completionBlock;
-(void) cancelImageDownloadWithURL:(NSString *)url withCompletionBlock:(void (^)(void))completionBlock;

@end

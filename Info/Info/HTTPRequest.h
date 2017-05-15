//
//  HTTPRequest.h
//  Info
//
//  Created by Michel de Sousa Carvalho on 13/05/17.
//  Copyright © 2017 Michel de Sousa Carvalho. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTTPRequest : NSObject


+(void) makeGETRequestToURL: (NSString *)urlString
                   withCompletionHandler:(void (^)(id result, NSError *error))completion;


@end

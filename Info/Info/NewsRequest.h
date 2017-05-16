//
//  NewsRequest.h
//  Info
//
//  Created by Michel de Sousa Carvalho on 15/05/17.
//  Copyright © 2017 Michel de Sousa Carvalho. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsRequest : NSObject

/**
 @brief Faz request de noticias e salva no core data com completion quando termina de fazer as operacoes
 **/
+(void) requestNewsAndSaveCoreDataWithCompletion:(void (^) (void)) completion;

@end

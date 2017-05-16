//
//  NewsRequest.m
//  Info
//
//  Created by Michel de Sousa Carvalho on 15/05/17.
//  Copyright © 2017 Michel de Sousa Carvalho. All rights reserved.
//

#import "NewsRequest.h"
#import "HTTPRequest.h"
#import "News+CoreDataClass.h"
#import "Image+CoreDataClass.h"

@implementation NewsRequest


+(void) requestNewsAndSaveCoreDataWithCompletion:(void (^) (void)) completion {
 
    if([News countNews] == 0) {
        [HTTPRequest makeGETRequestToURL:URLRequest withCompletionHandler:^(id result, NSError *error) {
            if(result){
                NSDictionary *infos = [result objectAtIndex:0];
                NSArray *conteudos = [infos objectForKey:@"conteudos"];
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    
                    for (NSDictionary *dict in conteudos) {
                        News *news = [News createNews];
                        news.titulo = [dict objectForKey:@"titulo"];
                        news.subtitulo = [dict objectForKey:@"subTitulo"];
                        news.texto = [dict objectForKey:@"texto"];
                        news.editoria = [[dict objectForKey:@"secao"] objectForKey:@"nome"];
                        news.dataPublicacao = [dict objectForKey:@"publicadoEm"];
                        NSArray *autores = [dict objectForKey:@"autores"];
                        if(autores.count > 0){
                            news.autor = [autores objectAtIndex:0];
                        }
                        NSArray *imagens = [dict objectForKey:@"imagens"];
                        if(imagens.count > 0){
                            Image *image = [Image createImage];
                            image.urlImage = [[imagens objectAtIndex:0] objectForKey:@"url"];
                            image.legenda = [[imagens objectAtIndex:0] objectForKey:@"legenda"];
                            news.image = image;
                        }
                        
                        [News saveNews:news];
                    }
                    completion();
                });
            }
        }];
        
    } else {
        completion();
    }
    
}


+(void) requestNewsBackgroundFetch:(void(^) (BOOL newData)) completion {
    [HTTPRequest makeGETRequestToURL:URLRequest withCompletionHandler:^(id result, NSError *error) {
        if(result){
            NSDictionary *infos = [result objectAtIndex:0];
            NSArray *conteudos = [infos objectForKey:@"conteudos"];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                
                BOOL createNewData = false;
                for (NSDictionary *dict in conteudos) {
                    
                    if(![News verifyExistNewsWithTitle:[dict objectForKey:@"titulo"]]){
                        News *news = [News createNews];
                        news.titulo = [dict objectForKey:@"titulo"];
                        news.subtitulo = [dict objectForKey:@"subTitulo"];
                        news.texto = [dict objectForKey:@"texto"];
                        news.editoria = [[dict objectForKey:@"secao"] objectForKey:@"nome"];
                        news.dataPublicacao = [dict objectForKey:@"publicadoEm"];
                        NSArray *autores = [dict objectForKey:@"autores"];
                        if(autores.count > 0){
                            news.autor = [autores objectAtIndex:0];
                        }
                        NSArray *imagens = [dict objectForKey:@"imagens"];
                        if(imagens.count > 0){
                            Image *image = [Image createImage];
                            image.urlImage = [[imagens objectAtIndex:0] objectForKey:@"url"];
                            image.legenda = [[imagens objectAtIndex:0] objectForKey:@"legenda"];
                            news.image = image;
                        }
                        
                        [News saveNews:news];
                        createNewData = true;
                    }
                }
                completion(createNewData);
            });
        }
    }];

}


@end

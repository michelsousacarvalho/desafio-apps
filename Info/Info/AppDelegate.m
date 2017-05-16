//
//  AppDelegate.m
//  Info
//
//  Created by Michel de Sousa Carvalho on 13/05/17.
//  Copyright © 2017 Michel de Sousa Carvalho. All rights reserved.
//

#import "AppDelegate.h"
#import "HTTPRequest.h"
#import "Reachability.h"
#import "News+CoreDataClass.h"
#import "Image+CoreDataClass.h"


@interface AppDelegate ()

@property (nonatomic, strong) Reachability *reachability;

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(checkForReachability)
                                                 name: kReachabilityChangedNotification
                                               object:nil];
    
    
    self.reachability = [Reachability reachabilityForInternetConnection];
    [self.reachability startNotifier];


    
    
    return YES;
}

-(void) checkForReachability {
    NetworkStatus status = [self.reachability currentReachabilityStatus];
    
    if(status == NotReachable){
        NSLog(@"Sem internet");
        // Mostrar View sem internet
        
        
    } else {
        NSLog(@"Com internet");
    }
    
    
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

-(void) application:(UIApplication *)application performFetchWithCompletionHandler:(void (^)(UIBackgroundFetchResult))completionHandler {
//    NSLog(@"Entrou no método performFetchWithCompletionHandler");
//    NSDate *fetchStart = [NSDate date];
//    NSLog(@"Inicio Background Fetch");
//    
//    [HTTPRequest makeGETRequestToURL:URLRequest withCompletionHandler:^(id result, NSError *error) {
//        if(result){
//            NSDictionary *infos = [result objectAtIndex:0];
//            NSArray *conteudos = [infos objectForKey:@"conteudos"];
//            
//            for (NSDictionary *dict in conteudos) {
//                News *news = [News createNews];
//                news.titulo = [dict objectForKey:@"titulo"];
//                news.subtitulo = [dict objectForKey:@"subTitulo"];
//                news.texto = [dict objectForKey:@"texto"];
//                news.editoria = [[dict objectForKey:@"secao"] objectForKey:@"nome"];
//                news.dataPublicacao = [dict objectForKey:@"publicadoEm"];
//                NSArray *imagens = [dict objectForKey:@"imagens"];
//                if(imagens.count > 0){
//                    Image *image = [Image createImage];
//                    image.urlImage = [[imagens objectAtIndex:0] objectForKey:@"url"];
//                    image.legenda = [[imagens objectAtIndex:0] objectForKey:@"legenda"];
//                    news.image = image;
//                }
//                
//                [News saveNews:news];
//                
//            }
//            completionHandler(UIBackgroundFetchResultNewData);
//        } else {
//            completionHandler(UIBackgroundFetchResultNoData);
//        }
//        NSDate *fetchEnd = [NSDate date];
//        NSTimeInterval timeElapsed = [fetchEnd timeIntervalSinceDate:fetchStart];
//        NSLog(@"Duraçao Background Fetch : %f segundos", timeElapsed);
//    }];
//    
}



#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"Info"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end

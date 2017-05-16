//
//  NSDate+FormattedDate.m
//  Info
//
//  Created by Michel de Sousa Carvalho on 16/05/17.
//  Copyright © 2017 Michel de Sousa Carvalho. All rights reserved.
//

#import "NSDate+FormattedDate.h"

@implementation NSDate (FormattedDate)


+(NSString*) formatDate:(NSString*) dateString withFormat:(NSString *) format {
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZ"];
    NSDate *date = [dateFormat dateFromString:dateString];
    [dateFormat setDateFormat:format];
    return [dateFormat stringFromDate:date];
}


@end

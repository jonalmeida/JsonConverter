//
//  JsonEncoder.m
//  JsonEncoder
//
//  Created by Jonathan Almeida on 2014-06-15.
//  Copyright (c) 2014 Jonathan Almeida. All rights reserved.
//
//  This software is provided 'as-is', without any express or implied
//  warranty. In no event will the authors be held liable for any damages
//  arising from the use of this software. Permission is granted to anyone to
//  use this software for any purpose, including commercial applications, and to
//  alter it and redistribute it freely, subject to the following restrictions:
//
//  1. The origin of this software must not be misrepresented; you must not
//     claim that you wrote the original software. If you use this software
//     in a product, an acknowledgment in the product documentation would be
//     appreciated but is not required.
//  2. Altered source versions must be plainly marked as such, and must not be
//     misrepresented as being the original software.
//  3. This notice may not be removed or altered from any source
//     distribution.
//


#import "JsonEncoder.h"

@implementation NSDictionary (JsonEncoder)

+ (NSDictionary *)dictionaryFromString:(NSString *)str options:(NSJSONReadingOptions)option {
    NSError * err = nil;
    NSData * data = [str dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary * res = [NSJSONSerialization JSONObjectWithData:data options:option error:&err];
    if (err) {
        NSLog(@"%@", err);
    }
    return res;
}

+ (NSDictionary *)dictionaryFromData:(NSData *)data options:(NSJSONReadingOptions)option {
    NSError * err = nil;
    NSDictionary * res = [NSJSONSerialization JSONObjectWithData:data options:option error:&err];
    if (err) {
        NSLog(@"%@", err);
    }
    return res;
}

@end

@implementation NSData (JsonEncoder)

+ (NSData *)dataFromDictionary:(NSDictionary *)dict {
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:data];
    [archiver finishEncoding];
    return data;
}

+ (NSData *)dataFromString:(NSString *)str {
    return [str dataUsingEncoding:NSUTF8StringEncoding];
}

@end

@implementation NSString (JsonEncoder)

+ (NSString *)stringFromDictionary:(NSDictionary *)dict {
    return [NSString stringWithFormat:@"%@", dict];
}

+ (NSString *)stringFromData:(NSData *)data {
    return [NSString stringFromData:data];
}

@end

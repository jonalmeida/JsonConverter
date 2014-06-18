JSON Encoder
============

A simple Category Class that extends NSData, NSString & NSDictionary for converting JSON objects from one type to another in one-liners.

Getting Started
===============
Simply drop the `JsonEncoder.h` and `JsonEncoder.m` into your project.

Examples
========
### NSDictionary
``` objective-c
// A simple initialized dictionary
NSDictionary * dict = [NSDictionary dictionaryWithObjectsAndKeys:
                            @"Value",@"Key", nil];
// Using the extended class..
NSString * json_str = [NSString stringFromDictionary:dict];
// OR
NSData * data = [NSData dataFromDictionary:dict];
```

### NSString
``` objective-c
// A string that we want to convert to a dictionary
NSString * json_str = @"{\"Key\":\"Value\"}";
// Using the extended class..
NSDictionary * dict = [NSDictionary dictionaryFromString:json_str];
// OR
NSData * data = [NSData dataWithString:json_str];
```

### NSData
``` objective-c
// Let's assume we already have an NSData object!
// We can convert it using the extended class..
NSDictionary * dict = [NSDictionary dictionaryFromData:data];
// OR
NSString * json_str = [NSString stringFromData:data];
```


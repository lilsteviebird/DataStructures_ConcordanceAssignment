//
//  NewNode.m
//  Assignment10-Concordance
//
//  Created by sli19 on 3/1/19.
//  Copyright © 2019 sli19. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewNode.h"

@implementation NewNode:NSObject

-(id)initWithSonnetNumber: (int)sonnet lineNumber: (int)line wordNumber:(int) wordNumber;{
    self = [super init];
    if(self){
        self.key = @"n/a";
//        self.value = [[NSMutableArray alloc] init];
        self.sonnetNumber = 0;
        self.lineNumber = 0;
        self.wordNumber = 0;
    }
    return self;
}

-(NSString *)getKey{
    return self.key;
}

@end

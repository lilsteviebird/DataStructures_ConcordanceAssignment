//
//  Concordance.m
//  Assignment10-Concordance
//
//  Created by sli19 on 3/1/19.
//  Copyright © 2019 sli19. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Concordance.h"


@implementation Concordance:NSObject

-(id)init{
    self = [super init];
    if(self){
        self.hashCurr = [[NewNode alloc] init];
        self.hashArray = [[NSMutableArray alloc] init];
        NewNode* filler = [[NewNode alloc] initWithSonnetNumber:0 lineNumber:0 wordNumber:0];
        for(int i = 0; i< 300000; i++){
            [self.hashArray addObject: filler];
        }
    }
    return self;
}

-(void)hashSort{
    
    NSString *myFilePath = [[NSBundle mainBundle] pathForResource:@"sonnets" ofType:@"txt"];
    
    NSString *linesFromFile = [[NSString alloc] initWithContentsOfFile: myFilePath encoding:NSUTF8StringEncoding error:nil];
    
    NSArray *arrayOfLines = [linesFromFile componentsSeparatedByString:@"\n"];
    self.hashCurr.lineNumber = 0;
    self.hashCurr.sonnetNumber = 0;
    self.hashCurr.wordNumber = 0;
    for (int i = 283; i < [arrayOfLines count]; i++) {
        //printf("%s \n", [[arrayOfLines objectAtIndex: i] UTF8String]);
        NSArray* singleStrs =[[arrayOfLines objectAtIndex: i] componentsSeparatedByCharactersInSet: [NSCharacterSet characterSetWithCharactersInString:@" "]];
        NSLog(@"%@", singleStrs);
        self.hashCurr.lineNumber++;
        for(int j = 0; j < [singleStrs count]; j++){
            self.hashCurr.wordNumber++;
            self.hashCurr.key = [singleStrs objectAtIndex:j];
            const char *charArray = [[singleStrs objectAtIndex:j] UTF8String];
            int totalAscii = 11;
            for(int k = 0; k < 3; k++){
                int ascii_code = (int)charArray[k];
                totalAscii = totalAscii * 17 + ascii_code;
            }
    
            
            if([[[self.hashArray objectAtIndex: totalAscii] getKey]  isEqualToString: @"n/a"]){
                [self.hashArray replaceObjectAtIndex: totalAscii withObject: self.hashCurr];
                NSLog(@"It added %@ to index %i", [[self.hashArray objectAtIndex: totalAscii] getKey], totalAscii);
            }
            else{
                while([[[self.hashArray objectAtIndex: totalAscii] getKey]  isEqualToString: @"n/a"]){
                    totalAscii++;
                }
                [self.hashArray replaceObjectAtIndex: totalAscii withObject: self.hashCurr];
              //  NSLog(@"the word %@ was not added", [[self.hashArray objectAtIndex: totalAscii] getKey]);
            }

        }
        
        self.hashCurr.lineNumber++;
        if([[arrayOfLines objectAtIndex: i]  isEqual: [arrayOfLines objectAtIndex: 2]]){
            self.hashCurr.lineNumber--;
        }
    }


}

-(NewNode*) hashSearch: (NSString*) stringGiven{
    const char *charArray = [stringGiven UTF8String];
    int totalAscii = 11;
    int i = 0;
    NewNode *noFind = [[NewNode alloc] init];
    for(int k = 0; k < 3; k++){
        int ascii_code = (int)charArray[k];
        totalAscii = totalAscii * 17 + ascii_code;
    }
    NSLog(@"self.hashArray look here %@", [self.hashArray objectAtIndex: totalAscii]);
    NewNode *ignore =[[NewNode alloc] init];
    
    ignore = [self.hashArray objectAtIndex: totalAscii + 1];
    
    NSLog(@" 1 %@", ignore.key);
    NSLog(@"2 %i", ignore.wordNumber);

    while(![[[self.hashArray objectAtIndex: totalAscii] getKey]  isEqualToString: stringGiven]){
        i++;
        totalAscii++;
        if(i == 299999){
            return noFind;
        }
    }
    NewNode *displayNode = [self.hashArray objectAtIndex:totalAscii];
    NSLog(@"%@, %i, %i, %i", displayNode.key,displayNode.lineNumber, displayNode.sonnetNumber, displayNode.wordNumber);
    return displayNode;
}



@end

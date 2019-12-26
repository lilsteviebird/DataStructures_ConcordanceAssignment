//
//  ViewController.m
//  Assignment10-Concordance
//
//  Created by sli19 on 3/1/19.
//  Copyright © 2019 sli19. All rights reserved.
//

#import "ViewController.h"
#import "Concordance.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//
//    NSString *myFilePath = [[NSBundle mainBundle] pathForResource:@"sonnets" ofType:@"txt"];
//
//    NSString *linesFromFile = [[NSString alloc] initWithContentsOfFile: myFilePath encoding:NSUTF8StringEncoding error:nil];
//
//    NSArray *arrayOfLines = [linesFromFile componentsSeparatedByString:@"\n"];
//
//    for (int i = 0; i < [arrayOfLines count]; i++) {
//        printf("%s \n", [[arrayOfLines objectAtIndex: i] UTF8String]);
//    }
//
    Concordance *myConcordance = [[Concordance alloc] init];
    
    [myConcordance hashSort];
    [myConcordance hashSearch:@"hand"];
    
}




- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}


@end

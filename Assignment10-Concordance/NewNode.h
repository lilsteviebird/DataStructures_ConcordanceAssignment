//
//  NewNode.h
//  Assignment10-Concordance
//
//  Created by sli19 on 3/1/19.
//  Copyright © 2019 sli19. All rights reserved.
//

#ifndef NewNode_h
#define NewNode_h
@interface NewNode<ObjectType> : NSObject


@property NSString *key;
@property NSMutableArray *value;
@property int sonnetNumber;
@property int lineNumber;
@property int wordNumber;

-(id)initWithSonnetNumber: (int)sonnet lineNumber: (int)line wordNumber:(int) wordNumber;

-(NSString *)getKey;

@end

#endif /* NewNode_h */

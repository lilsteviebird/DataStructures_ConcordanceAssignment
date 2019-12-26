//
//  Concordance.h
//  Assignment10-Concordance
//
//  Created by sli19 on 3/1/19.
//  Copyright © 2019 sli19. All rights reserved.
//

#ifndef Concordance_h
#define Concordance_h
#import "NewNode.h"
@interface Concordance<ObjectType> : NSObject

@property NewNode *hashCurr;
@property NSMutableArray *hashArray;


-(id)init;
-(void)hashSort;
-(NewNode*) hashSearch: (NSString*) stringGiven;
@end


#endif /* Concordance_h */

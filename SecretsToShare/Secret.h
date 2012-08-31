//
//  Secret.h
//  SecretsToShare
//
//  Created by Ran Tao on 8.30.12.
//  Copyright (c) 2012 Ran Tao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Secret : NSManagedObject

@property (nonatomic, retain) NSString * entry;
@property (nonatomic, retain) NSDate * date;

@end

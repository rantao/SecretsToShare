//
//  SecretStore.h
//  SecretsToShare
//
//  Created by Ran Tao on 8.30.12.
//  Copyright (c) 2012 Ran Tao. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Secret;

@interface SecretStore : NSObject
+(void) setUpWithContext:(NSManagedObjectContext *) context withModel:(NSManagedObjectModel*) model;

+(void)save;

+(Secret*) createSecret;
+(NSArray*) allSecrets;

+(void) deleteSecret;
@end

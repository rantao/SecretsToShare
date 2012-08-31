//
//  SecretStore.m
//  SecretsToShare
//
//  Created by Ran Tao on 8.30.12.
//  Copyright (c) 2012 Ran Tao. All rights reserved.
//

#import "SecretStore.h"
#import "Secret.h"

NSManagedObjectContext *secretContext;
NSManagedObjectModel *secretModel;

@interface SecretStore()
//+(NSManagedObjectContext*) context;
//+(NSManagedObjectModel*) model;
@end

@implementation SecretStore

+(void) setUpWithContext:(NSManagedObjectContext *) context withModel:(NSManagedObjectModel*) model{
    secretContext = context;
    secretModel = model;
}

+(void)save {
    NSError* err;
    if (![secretContext save:&err]) {
        [NSException raise:@"Save failed!"
                    format:@"Reason: %@", [err localizedDescription]];
    }
}
+(Secret*) createSecret {
    Secret *secret = [NSEntityDescription insertNewObjectForEntityForName:@"Secret" inManagedObjectContext:secretContext];
    return secret;
}

+(NSArray*) allSecrets {
    NSFetchRequest *req = [NSFetchRequest new];
    req.entity = [secretModel.entitiesByName objectForKey:@"Secret"];
    
    NSError* err;
    
    NSArray *secrets = [secretContext executeFetchRequest:req error:&err];
    
    if (!secrets) {
        [NSException raise:@"Fetch failed!" format:@"Reason:%@", [err localizedDescription]];
    }
    
    return secrets;
}

+(void) deleteSecret {
    
}

//+(NSManagedObjectContext*) context {
//    NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES);
//    NSString *directory = [documentDirectories objectAtIndex:0];
//    NSURL *storeURL = [NSURL fileURLWithPath:[directory stringByAppendingString:@"secretStore.data"]];
//    NSPersistentStoreCoordinator *psc = [[NSPersistentStoreCoordinator alloc]initWithManagedObjectModel:[SecretStore model]];
//    
//    NSError *err;
//    if (![psc addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&err]) {
//        [NSException raise:@"Open Failed!" format:@"Reason: %@", [err localizedDescription]];
//    } else {
//        secretContext = [NSManagedObjectContext new];
//        [secretContext setPersistentStoreCoordinator:psc];
//        [secretContext setUndoManager:nil];
//    }
//    
//    return secretContext;
//}
//
//+(NSManagedObjectModel*) model {
//    if (!secretModel) {
//        secretModel = [NSManagedObjectModel mergedModelFromBundles:nil];
//    }
//}

@end

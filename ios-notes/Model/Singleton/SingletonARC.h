//
//  SingletonARC.h
//  ios-notes
//
//  Created by mac on 2020/9/24.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SingletonARC : NSObject

+(instancetype)shareInstance;

@end

NS_ASSUME_NONNULL_END

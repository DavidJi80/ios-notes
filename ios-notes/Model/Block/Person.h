//
//  Person.h
//  ios-notes
//
//  Created by mac on 2020/10/17.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject

@property (assign, nonatomic) int age;
@property (copy, nonatomic) void (^block)(void);    //block 作为属性变量

@end

NS_ASSUME_NONNULL_END

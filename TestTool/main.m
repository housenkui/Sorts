//
//  main.m
//  TestTool
//
//  Created by 二哈 on 16/9/28.
//  Copyright © 2016年 侯森魁. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        for (int i ; i < 5; i++) {
            
            NSLog(@"i = %d",i);
            
            if(i==3){
                
                continue;
            }
            
            NSLog(@"Continue 执行了吗？");
        }
        
        NSLog(@"LONG_MAX = %ld",LONG_MAX);
        
        NSLog(@"INT_MAX = %d",INT_MAX);

        
    }
    return 0;
}

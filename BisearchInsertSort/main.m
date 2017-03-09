//
//  main.m
//  BisearchInsertSort
//
//  Created by 二哈 on 16/11/20.
//  Copyright © 2016年 侯森魁. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 折半插入排序
 */
#define N 10
void printArr (NSUInteger a[],NSUInteger n){
    
    for (NSUInteger i = 0; i<n; i++) {
        
        NSLog(@"a[%lu]  =%lu",i,a[i]);
    }
}

//折半查找方法
NSUInteger binarySearch(NSUInteger array[],NSUInteger begin,NSUInteger end ,NSUInteger InsertNum)
{
    NSUInteger mid ,left = begin, right = end;
    
    while (left <= right) {

        mid = (left+right)>>1;
        
        if (array[mid] >= InsertNum)
        {
            right = mid -1;
        }
        else
        {
            left = mid + 1;
        }
        
    }
    
    return left;
}

void BinaryInsertSort(NSUInteger a[],NSUInteger n){
    
    NSUInteger middle = 0;
    
    NSUInteger list[N]  ={};
    
    for (NSUInteger i = 1; i<n; i++) {
        
        NSUInteger insertNum = list [i];
        NSUInteger left  = 0;
        NSUInteger right = i-1;
        while (right>=0&&left <= right) { //二分法寻找插入位置
            
            middle =(left+right)/2;
            if (insertNum>list[middle]) {
                
                left = middle +1;
            }
            else
            {
                right = middle -1;
            }
        }
        for (NSUInteger j = i; j<left ; j--) {
            list[j] =list[j-1];
        }
        list[left] = insertNum;
    }
    
    printArr(list, N);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        
        NSUInteger a[N] = {};
        
        for (NSUInteger i = 0; i<N; i++)
        {
           a[i] =  i;
        }
        
        printArr(a, N);
        
        NSUInteger index =binarySearch(a, 0, N-1, 8);
        
        NSLog(@"通过二分查找得到8在有序序列中的位置是index = %lu",index);
        
    }
    return 0;
}


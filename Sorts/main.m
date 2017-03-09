//
//  main.m
//  Sorts
//
//  Created by 二哈 on 16/9/24.
//  Copyright © 2016年 侯森魁. All rights reserved.
//

#import <Foundation/Foundation.h>

/*插入排序：基本思想，将一个记录插入到一个有序表中，从而得到一个记录数增加1的有序表，先将第1个记录看成有序表，然后从第2个记录逐个插入，直到整个序列有序为止。
 */

void InsertSort(long a[],long n);

/*
 缩小增量排序也叫希尔排序:基本思想，用增量因子dk (dk = n/2,n为序列数量)，将序列分割成若干个小序列，小序列的每个记录下表相差dk,对这些小序列进行直接插入排序，再用增量因子 dk = dk/2,将序列分割成若干个小序列，小序列的每个记录下表相差dk/2,对这些小序列再进行直接插入排序,直到dk=1.最后对整个序列进行直接插入排序。
 
 缩小增量排序的时间复杂度在 n^1.3 ，样本数量10^6
 */
void ShellInsertSort(long a[],long n,long dk);

void Shell(long a[],long n);

void printArr(long a[], long n);


void ShellInsertSortTest(long a[],long n,long dk);

void ShellTest(long a[],long n);

static NSUInteger count1 = 0;

#define N  10

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        long a[N] = {};
        
        NSMutableString *mutableString = [NSMutableString string];

        for (long i  = 0; i < N; i++) {
            
            a[i] = arc4random()%N;
            
            if (i == 0) {
                
                [mutableString appendFormat:@"%ld",a[i]];

            }
            else
            {
                [mutableString appendFormat:@",%ld",a[i]];//将生成的(0~N-1)的随机数存入可变字符串中

            }
            
        }//生成N个随机数的 大型数组
        
//        NSLog(@"排序前:");
//        
//        printArr(a,N);
        //进行Shell排序
        ShellTest(a, N);
        
//        NSLog(@"排序后:");
//        
//        printArr(a, N);
        
        NSLog(@"%d个元素交换次数%lu",N,count1);
        
        double whelo = (double)count1;
     
        double UpNum =log10(whelo)/log10(N);
        
        NSLog(@"理论值%lf,实际值%lf",1.3,UpNum);
        
        NSLog(@"pow = %lf",pow(N,UpNum));
        
        
      
//        //NSDesktopDirectory 写入到桌面
//        NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDesktopDirectory, NSUserDomainMask, YES) objectAtIndex:0];
//        
//        NSString *  path  = [documentPath stringByAppendingPathComponent:@"数据"];
//        
//        NSFileManager *fileManager = [NSFileManager defaultManager];
//        
//        if (![fileManager fileExistsAtPath:path]) {
//            //  创建文件
//
//            [fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:@{} error:nil];
//        }
//        NSLog(@"documentPath  =%@",documentPath);
//        
//        [mutableString writeToFile:[NSString stringWithFormat:@"%@/%d.txt",path,N] atomically:YES encoding:NSUTF8StringEncoding error:nil];
//        
//        //将可变字符串写入硬盘
//    
//        
//        NSString *stringRead = [NSString stringWithContentsOfFile:[NSString stringWithFormat:@"%@/%d.txt",path,N] encoding:NSUTF8StringEncoding error:nil];
        //从硬盘读取字符串
        
    
    
        
    
    }
    return 0;
}



void printArr(long a[], long n){
    
    printf("C 语言的数组元素如下:\n");

    for (long  i = 0; i < n; i++) {
        
        printf("a[%lu] = %lu\n",i,a[i]);
    }
}
//升序  缩小增量排序基本思想:
/*
 选择一个增量因子dk(dk=n/2,n是序列数量),将序列分割成若干个小序列，小序列的元素下标相差dk,对小序列进行直接插入排序，再将原有序列按照增量因子dk=dk/2;将序列分割成若干个小序列，小序列的元素下标相差dk,对小序列进行直接插入排序，直到dk=1；然后对“基本有序”原有序列，再进行直接插入排序。
 
 
    9   8  7  6  5  4  1  2  6
 
 */
void ShellInsertSort(long a[],long n,long dk){
    
    for (long i = dk; i< n; i++) {
        
        if (a[i]<a[i-dk]) {
            
            long j = i-dk;
            long x = a[i];
            a[i] = a[i-dk];
            
            while (x < a[j]) {
                
                a[j+dk] = a[j];
                
                j-=dk;
                
                if (j < 0)
                {
                    break;
                }
            }
            a[j+dk] = x;
        }
        
    }
}

void Shell(long a[],long n){
    
    long dk = n/2;
    
    while (dk>=1) {
        
        ShellInsertSort(a, n, dk);
        
        dk = dk/2;
    }
}































void ShellInsertSortTest(long a[],long n,long dk){
    
    for (long i =dk ; i<n; i++) {
        
        if (a[i]<a[i-dk]) {
            
            long x = a[i];
            
            long j = i-dk;
            
            count1++;

            while (x<a[j]){
                
                a[j+dk] =a[j];
                count1++;
                
                j-=dk;
                
                if (j<0) {
                    break;
                }
            }
            
            a[j+dk] = x;count1++;
        }
        
    }
    
}

void ShellTest(long a[],long n){
    
    long dk = n/2;
    
    while (dk>=1) {
        
        ShellInsertSortTest(a,n,dk);

        dk = dk/2;
    }
}



















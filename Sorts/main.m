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
 */
void ShellInsertSort(long a[],long n,long dk);

void Shell(long a[],long n);

void printArr(long a[], long n);

void selectSort(long a[],long n);

static NSUInteger count1 = 0;
static NSUInteger count2 = 0;
static NSUInteger count3 = 0;


#define N  10000

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        
        long a[N] = {};
        
        NSMutableString *mutableString = [NSMutableString string];

        for (long i  = N; i >= 0; i--) {
            
            a[i] = arc4random()%N;
            
            if (i == 0) {
                
                [mutableString appendFormat:@"%ld",a[i]];

            }
            else
            {
                [mutableString appendFormat:@",%ld",a[i]];//将生成的(0~N-1)的随机数存入可变字符串中

            }
            
            
        }//生成N个随机数的 大型数组
        
        //进行Shell排序
        Shell(a, N);
        
        NSLog(@"%d个元素交换次数%lu",N,count1+count2,);
        
        double whelo = (double)count1+count2;
     
        double UpNum =log10(whelo)/log10(N);
        
        NSLog(@"理论值%lf,实际值%lf",2.0,UpNum);
        
        NSLog(@"pow = %lf",pow(N,UpNum));
        
        
      
        //NSDesktopDirectory 写入到桌面
        NSString *documentPath = [NSSearchPathForDirectoriesInDomains(NSDesktopDirectory, NSUserDomainMask, YES) objectAtIndex:0];
        
        NSString *  path  = [documentPath stringByAppendingPathComponent:@"数据"];
        
        NSFileManager *fileManager = [NSFileManager defaultManager];
        
        if (![fileManager fileExistsAtPath:path]) {
            //  创建文件

            [fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:@{} error:nil];
        }
        NSLog(@"documentPath  =%@",documentPath);
        
        [mutableString writeToFile:[NSString stringWithFormat:@"%@/%d.txt",path,N] atomically:YES encoding:NSUTF8StringEncoding error:nil];
        
        //将可变字符串写入硬盘
    
        
        NSString *stringRead = [NSString stringWithContentsOfFile:[NSString stringWithFormat:@"%@/%d.txt",path,N] encoding:NSUTF8StringEncoding error:nil];
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

//升序排序
void ShellInsertSort(long a[],long n,long dk){
    
    for (long i = dk; i < n; i++) {
        
        if (a[i]<a[i-dk]) {
            
            long j = i -dk;
            
            long x = a[i];
            
            a[i]  = a[i-dk];
            
            count1++;
            
            while (x<a[j]&&j>=0) {
                
                a[j+dk] = a[j];
                
                count2++;
                
                j -= dk;
                
                if (j <0) {
                    
                    break;
                }
                
            }
            a[j+dk] =x;
            count3++;
            
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



long selectMinKey(long a[],long n,long i){
    
    long k = i;
    
    for (long j =i+1; j<n; j++) {
        
        if(a[j]<a[k]){
            
            k = j;
            
            count1++;
        }
    }
    return k;//返回数组中数值最小的元素下标
}
//选择排序 升序
void selectSort(long a[],long n){
    
    long temp  = 0;
    
    for ( long i = 0; i< n; i++) {
        
        
        for (long j=i+1; j<n; j++) {
            
            if (a[j] <  a[i]) {
                
                temp =a[i];
                
                a[i] = a[j];
                
                a[j] = temp;
                
                count1++;
                
            }
        }
        
        
    }
    
}





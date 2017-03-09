//
//  main.m
//  selectSort
//
//  Created by 二哈 on 16/9/27.
//  Copyright © 2016年 侯森魁. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSUInteger count1 = 0;


#define N  10
//选择排序
void selectSort(long a[],long n);

void selectSortTwoRoad(long a[],long n);

void printArr(long a[], long n);

void Testfun(long a[],long n);

void testFun(long a[],long n);
void testFun1(long a[],long n);



int main(int argc, const char * argv[]) {
    
    
    @autoreleasepool {
        
        long a[N] = {};
        
        for (NSUInteger i  = 0; i<N; i++) {
            
            a[i] = arc4random()%N;
            
            
        }//生成N个随机数的 大型数组
        
        NSLog(@"排序前:");
        printArr(a,N);

        //进行选择排序
        testFun1(a, N);

        NSLog(@"排序后:");

        printArr(a,N);
        
        selectSort(a, N);
        
        
        NSLog(@"二元选择排序%d个随机元素交换次数%lu",N,count1);
        
        double whelo = (double)count1;

        double UpNum =log10(whelo)/log10(N);

        NSLog(@"二元选择理论值%lf,实际值%lf,数据采样%d个",1.2,UpNum,N);
        
    }
    return 0;
}
//选择排序 升序

/*
 基本思想：
 对于N记录的序列，让第1个记录和其余 N-1个记录进行比较，选择其中最小的数值与第1个记录交换位置，
 
然后 让第2个记录和其余 N-2个记录进行比较，选择其中最小的数值与第2个记录交换位置
 
然后 让第3个记录和其余 N-3个记录进行比较，选择其中最小的数值与第3个记录交换位置。
 
 一直到让第N-1个记录和其余 1个记录进行比较，选择其中最小的数值与第N-1个记录交换位置
 */
void selectSort(long a[],long n){
    
    long temp  = 0;
    
    for ( long i = 0; i< n; i++) {
        
        
        for (long j=i+1; j < n; j++) {//当i= 0是，a[0]将会与a[1]~a[n-1]进行比较
            
            if (a[j] <  a[i]) {
                
                temp =a[i];
                
                a[i] = a[j];
                
                a[j] = temp;
                
            }
        }
    }
    
}
//升序 二路选择
void selectSortTwoRoad(long a[],long n){
    
   
    long tmp_Min ;
    
    long tmp_Max;
    
     long temp = 0;
    
     long i = 0;
    
     long j = 0;
    
     for ( i = 0; i < n/2; i++) {
        
        tmp_Min = i;
        tmp_Max = i;
       
        for (j = i+1; j < n-i; j++) { //j可取值{1 ~ (n-1-i)},j的条件如果是j<=n-i,当i=0是，j=n，会造成数据越界，数组越界竟然不报错，醉了，就连a[-1]也不报错，只是a[-1]数值是0，无语中......
            
            if (a[j]>a[tmp_Max]) {
                
                tmp_Max = j;//记下较大的数字
                
                continue;
            }

            //j始终比i大1
            //右边的数 小于左边的数
            
            if (a[j] < a [tmp_Min]) {
                
                tmp_Min = j;
            }
           
        }
        
        temp = a[i];
        
        a[i] =a[tmp_Min];
        
        a[tmp_Min] =temp;

        if (tmp_Max==i)
        {
            temp = a[n-i-1];
            
            a[n-i-1] =a[tmp_Min];
            
            a[tmp_Min] = temp;
        }
        else
        {
            temp =  a[n-i-1];
            
            a[n-i-1] = a[tmp_Max];
            
            a[tmp_Max] = temp;

        }
        
    }
    
}

void selectSortMinMax(long a[],long n){
    
    long minpos,maxpos,i,j,tmp;
    for (i=0 ; i < n/2; i++)
    {
        minpos = i;
        maxpos = i ;
        for (j= i+1; j < n-i; j++)
        {
            if (a[j] > a[maxpos])
            {
                maxpos = j ;

                continue ;
            }
            if (a[j]< a[minpos])
            {
                minpos = j ;
            }
        }
        
        tmp = a[i];
        
        a[i] = a[minpos];//a[i]的值已经改变了，已经和最小的值交换了位置，此时a[minpos]数值更大
        
        a[minpos] = tmp;
        
        //当i==maxpos的时候，a[i]已经改变，已经改变，已经改变，已经改变，而maxpos交换的是改变后的值，所以还要加一个if条件
        if(maxpos==i)
        {
            tmp = a[n-i-1];
            a[n-i-1] = a[minpos];
            a[minpos] = tmp;
            
        }
        else
        {
            tmp = a[n-i-1];
            a[n-i-1] = a[maxpos];
            a[maxpos] = tmp;
        }
    }
    
}


void printArr(long a[], long n){
    
    //    printf("C 语言的数组元素如下:\n");
    
    //    NSMutableString *mstring = [NSMutableString string];
    
    for (long  i = 0; i < n; i++) {
        
        printf("a[%lu] = %lu\n",i,a[i]);
        
        //        [mstring appendFormat:@"%ld",a[i]];
        
    }
    //    NSLog(@"%@",mstring);
}


void testFun(long a[],long n){
    
    long temp,min,max,i,j;
    
    for (i = 0;i < n/2; i++) {
        
        min = max = i;
        
        for (j = i+1; j<n-i; j++) {
            
            if (a[j] > a[max]) {
                
                max = j;
                continue;
                
            }
            
            if (a[j] < a[min]) {
                
                min = j;
            }
            
        }
        
        temp = a[i];
        a[i] =a[min];
        a[min] =temp;
        
        if (max ==i)
        {
            temp = a[n-i-1];
            
            a[n-i-1] =a[min];
            
            a[min] =temp;
        }
        else
        {
            temp = a[n-i-1];
            
            a[n-i-1] = a[max];
            
            a[max] = temp;
            
        }
        
    }
}



/*
 二元选择排序，每一趟排序选出最大值和最小值，只需要进行n/2躺的排序。
 */
void testFun1(long a[],long n){
    
    long i,j,max,min,temp;
    
    for (i = 0; i < n/2; i ++) {
        
        max =i;
        
        min =i;
        
        for (j=i+1; j< n-i; j++) {
            
            if (a[j]>a[max]){
                
                max = j;//每趟排序找出最大值
                continue;
            }
            
            if (a[j]< a[min]) {
                
                min = j;//每趟排序找出最小值
            }

        }
        
        temp = a[i];
        
        a[i] =a[min];//找到最小的数据交换
        
        a[min] = temp;
        
        if (max ==i) {
            //此时 a[i]已经被a[min]替换了
            temp = a[n-i-1];

            a[n-i-1] = a[min];
            
            a[min] = temp;
        }
        else
        {
            temp = a[n-i-1];
            
            a[n-i-1] = a[max];//找到最大的数据交换
            
            a[max] = temp;
        }
        
        
        
    }
    
}


















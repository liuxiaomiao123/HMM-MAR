#include <iostream>
#include <algorithm>
#include <cstring>
#include <climits>
#include<stdio.h>
#include<stdlib.h>
using namespace std;

#define Max 17
int n;                    //维数 
int s[Max][Max];        //原始矩阵 
int p[Max][Max];        //归约矩阵 
int q[Max][Max];        //0:未被画线 1:画了1次 2: 画了2次(交点) 
int row[Max], col[Max];    //行列0元素个数 
int r[Max][Max];        //0:非0元素 1:非独立0元素 2:独立0元素 
int x[Max],y[Max];        //画线时是否被打勾，1是0不是 

#define N 5   //行 ,need to change !!! the number of states
#define L 5       //列 ,need to change !!! the number of states
const char file_name[100] = "D:\\brainbnu\\brain_software\\ShareFolders\\CHS_project\\Final\\HMM_result\\k=5\\FC\\1_10.txt";
void read(FILE *fp)
{    int row=0;
     char mid;
	 while(!feof(fp))
     {   
           mid=fgetc(fp); //从txt文本中读取一个字符赋值给mid
           if(mid=='\n') //如果这个字符为换行符
            row++; //记录txt数据行数
      }
	  row++; 
//最后一行没有换行符
    printf("行数为%d\n",row);
    rewind(fp); //回文件起始位置 
}



//数每行每列的0元素个数 
void countZero()
{
    memset(row, 0, sizeof(row));
    
    memset(col, 0, sizeof(col));
    
    memset(r, 0, sizeof(r));
    
    for (int i = 0; i < n; ++i)
    {
        for (int j = 0; j < n; ++j)
        {
            if (p[i][j] == 0)
                row[i]++, col[j]++;
        }
    }
}

//画最少的线覆盖所有0元素 
int drawLine()
{    
    memset(q, 0, sizeof(q));
    
    for (int i = 0; i < n; ++i)
        x[i] = 1, y[i] = 0;
    
    //row 对所有不含独立0元素的行打勾！ 
    for (int i = 0; i < n; ++i)
    {
        for (int j = 0; j < n; ++j)
        {
            if (r[i][j] == 2)
            {
                x[i] = 0;
                
                break;
            }
        }
    }
    
    bool is = 1;
    while (is)    //循环直到没有勾可以打 
    {
        is = 0;
        //col 对打勾的行中含0元素的未打勾的列打勾 
        for (int i = 0; i < n; ++i)
        {
            if (x[i] == 1)
            {
                for (int j = 0; j < n; ++j)
                {
                    if (p[i][j] == 0 && y[j] == 0)
                    {
                        y[j] = 1;
                        
                        is = 1;
                    }
                }
            }
        }
        
        //row 对打勾的列中含独立0元素的未打勾的行打勾 
        for (int j = 0; j < n; ++j)
        {
            if (y[j] == 1)
            {
                for (int i = 0; i < n; ++i)
                {
                    if (p[i][j] == 0 && x[i] == 0 && r[i][j] == 2)
                    {
                        x[i] = 1;
                        
                        is = 1;
                    }
                }
            }
        }
    }
    
    //没有打勾的行和有打勾的列画线，这就是覆盖所有0元素的最少直线数 
    int line = 0;
    for (int i = 0; i < n; ++i)
    {
        if (x[i] == 0)
        {
            for (int j = 0; j < n; ++j)
                q[i][j]++;
                
            line++;
        }
        
        if (y[i] == 1)
        {
            for (int j = 0; j < n; ++j)
                q[j][i]++;
                
            line++;
        }
    }
    
    return line;
}

//找独立0元素个数 
/*1.找含0最少的那一行/列    2.划掉，更新该行/列0元素所在位置的row[],col[]
  3.直到所有0被划线，这里定义为row[]col[]全为INT_MAX,表示该行/列无0元素*/ 
int find()
{
    countZero();
    
    int zero = 0;     //独立0元素的个数 
    
    while (1)
    {
        //row[i] = INT_MAX表示该行无0元素，防止与*min_element()冲突 
        for (int i = 0; i < n; ++i)
        {
            if (row[i] == 0)
                row[i] = INT_MAX;
            if (col[i] == 0)
                col[i] = INT_MAX;
        }
        
        bool stop = 1;
        
        if (*min_element(row, row+n) <= *min_element(col, col+n))    //行最少0元素 
        {
            //找含0最少的那一行 
            int tmp = INT_MAX, index = -1;
            for (int i = 0; i < n; ++i)
            {
                if (tmp > row[i])
                    tmp = row[i], index = i;
            }
            
            /*找该行任意一个没被划掉的0元素(独立0元素)，找到一个就行*/ 
            int index2 = -1;            //该行独立0元素的列值
            for (int i = 0; i < n; ++i)
                if (p[index][i] == 0 && col[i] != INT_MAX)
                {
                    index2 = i;
                    stop = 0;            //找到独立0元素则继续循环 
                    zero++;                //独立0元素的个数 
                    break;
                }
            
            //找不到独立0元素了 
            if (stop)    
                break;
                
            //标记 
            row[index] = col[index2] = INT_MAX;    
            r[index][index2] = 1;                //独立0元素，等等会++. 
            
            //更新其所在行列的col,row
            for (int i = 0; i < n; ++i)
                if (p[index][i] == 0 && col[i] != INT_MAX)    //若该行还有0且没被划掉才更新 
                    col[i]--;
            for (int i = 0; i < n; ++i)
                if (p[i][index2] == 0 && row[i] != INT_MAX)
                    row[i]--;
        }
        else                                                        //列最少0元素 
        {
            int tmp = INT_MAX, index = -1;
            for (int i = 0; i < n; ++i)
            {
                if (tmp > col[i])
                    tmp = col[i], index = i;
            }
        
            int index2 = -1;
            for (int i = 0; i < n; ++i)
                if (p[i][index] == 0 && row[i] != INT_MAX)
                {    
                    index2 = i;
                    stop = 0;
                    zero++;
                    break;
                }
                
            if (stop)
                break;
                
            row[index2] = col[index] = INT_MAX;
            r[index2][index] = 1;
            
            for (int i = 0; i < n; ++i)
                if (p[index2][i] == 0 && col[i] != INT_MAX)
                    col[i]--;
            for (int i = 0; i < n; ++i)
                if (p[i][index] == 0 && row[i] != INT_MAX)
                    row[i]--;
        }
    }
    //r[i][j] 0:非0元素 1:非独立0元素 2:独立0元素 
    for (int i = 0; i < n; ++i)
        for (int j = 0; j < n; ++j)
            if (p[i][j] == 0)
                r[i][j]++;
                
    return zero;
}

int main()
{
	FILE *fp;
    double s[N][L] = {0.0};   //二维数组
	int index[N] = {0};       //二维数组行下标
	double temp;  
    int i, j;
	int count = 0;  //计数器，记录已读出的浮点数
	if((fp=fopen(file_name, "rb")) == NULL) 
	{
	printf("请确认文件(%s)是否存在!\n", file_name);
	exit(1);
	}
    read(fp);     //读取行数
	while(1==fscanf(fp, "%lf", &temp)) //lf,le都可以，但别的都不可以，%e也不行
	{
	s[(index[count%L])++][count%L] = temp*1000;     //由于匈牙利算法的代码输入是int型，所以要乘以1000变成int型 
	count++;
	}
	fclose(fp);   //关闭句柄
	/******处理数据****************/
	for(i=0;i<N;i++)
	{  
	 printf("第%d行数据：\n",i+1);
	 for(j=0;j<L;j++)
	 { printf("%5.3lf ", s[i][j]);//.16f可以,le时以科学计数法显示
	 }
	 printf("\n");
	 }

    int m = 1;
    while (m--)
    {    
       n = 5;    // need to change!!! the number of states 
        //行归约 
        for (int i = 0; i < n; ++i)
            for (int j = 0; j < n; ++j)
                p[i][j] = *max_element(s[i], s[i]+n)-s[i][j];    //求和最大 
                //p[i][j] = s[i][j]-*min_element(s[i],s[i]+j);     //求和最小 
        
        //列归约 
        for (int j = 0; j < n; ++j)
        {
            int tmp = INT_MAX;
            for (int i = 0; i < n; ++i)
            {
                if (tmp > p[i][j])
                    tmp = p[i][j];
            }
            for (int i = 0; i < n; ++i)
                p[i][j] -= tmp;
        }
        
        while (find() < n)
        {
            drawLine();
            
            //最小的未被划线的数
            int min = INT_MAX;
            for (int i = 0; i < n; ++i)
                for (int j = 0; j < n; ++j)    
                    if (q[i][j] == 0 && min > p[i][j])
                        min = p[i][j];
            
            //更新未被划到的和交点 
            for (int i = 0; i < n; ++i)
                for (int j = 0; j < n; ++j)
                    if (q[i][j] == 0)
                        p[i][j] -= min;
                    else if (q[i][j] == 2)
                        p[i][j] += min;        
        }

        //求和 
        printf("\n"); 
        double ans = 0;
        for (int i = 0; i < n; ++i)
            for (int j = 0; j < n; ++j)
                if (r[i][j] == 2)
                {
                    ans += s[i][j];
                   // cout << s[i][j] << endl;
                    printf("%5.3lf\n", s[i][j]);
				}
	    printf("\n"); 
        printf("%5.3lf ",ans );           
       // cout << ans << endl;
    }
}



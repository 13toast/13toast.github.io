---
title: "Abc247E"
date: 2022-04-12T09:22:06+08:00
draft: true
---

## 题意

一个长度为n的序列，统计最大值为X且最小值为Y的区间[L，R]的个数。



## tag

容斥



## solution

首先，整个序列会被那些大于X或者小于Y的数分割成若干段，那么满足题目要求的区间必然都在这些段里。只需要统计这些段内的答案之和。

直接求既有X又有Y且满足最值条件的区间比较麻烦，因为XY不一定是端点，两边可以扩展一些在XY之间的数，同时一个满足条件的区间里也不一定只有一个XY。

但是我们知道，求既不包含X也不包含Y的区间数很简单，还是相当于整个序列被一些数分割。同理X和Y仅一侧满足条件的也很好求，值都在某个范围内的区间数也很好求。所以考虑容斥原理。

(有X有Y且值在[Y,X])=(值在[Y,X])-(值在[Y,X))-(值在(Y,X])+(值在(Y,X))

```c++
#include <bits/stdc++.h>
using namespace std;
#define rep(i,a,b) for (int i=a;i<=b;++i)
#define per(i,a,b) for (int i=a;i>=b;--i)
typedef long long ll;
const int N = 2e5+5;
int n,x,y,a[N];
ll getlr(int x,int y) {	//统计有多少个区间其所有值都属于[y,x]
    ll ret = 0;
    int j = 0;
    rep(i,1,n) {
        if (a[i] > x || a[i] < y) j = i;
        ret += i-j;
    }
    return ret;
}
int main() {
    ios::sync_with_stdio(false);
    cin.tie(nullptr);
    cin >> n >> x >> y;
    rep(i,1,n) cin >> a[i];
    ll ans = getlr(x,y) - getlr(x-1,y) - getlr(x,y+1) + getlr(x-1,y+1);
    cout << ans << endl;
    return 0;
}
```


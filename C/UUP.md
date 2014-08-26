# Understanding Unix/Linux Programming
## Chapter One - Basis
### Method
1. 它能做什么(分析程序)
2. 它如何实现(学习系统调用)
3. 能不能自己编写一个(编程实现)
### User\'s aspect

### System\'s aspect
bc是dc的预处理器，将用户输入转换为逆波兰表达式，然后用管道传给dc，dc再将结果返回给bc  
bc负责用户界面，dc负责后台运算，类似的，浏览器负责用户界面，提供网页的是Web服务器。
### Practice
*Write your own 'more' command*
`more` has three usages

    $ more filename
	$ command | more
	$ more < filename


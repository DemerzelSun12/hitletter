# hitletter

# What's hitletter

在写一些正式信件时，曾经苦于学校没有电子版的信纸，地下书店卖的带有学校名抬头的信纸很难变成电子版，于是闲来无事，花了一天时间仿照本部二区地下书店、一区二手书店的稿纸，完成了这个适合一校三区同学的 LaTeX 哈工大信纸模板。

HIT Letter是依照哈尔滨工业大学三个校区制作的 LaTeX 信纸模板，主要文件是hitletter.cls以及对应的校名矢量图像。制作本模板的目的是方便 TeX 用户撰写带有哈工大标志的文档/信件，免去自行设置的繁琐过程，同时尽可能符合学校的相关规定，使生成的文件更加正式、美观。

模板提供三个校区的信纸布局——harbin、shenzhen、weihai——以供用户根据不同需要选择。同时提供了页面配色功能，提供三种配色方案——blue、red、black。也考虑到部分场景需要添加页码，页码作为可选项。

模板使用方式简介：

\begin{verbatim}
    \documentclass[<COLOR>,<THEME>,<PAGENUM>,<OTHER>]{hitletter}
\end{verbatim}


模板的实现简介：

模板基于article文档类定制，使用xeCJK提供中文支持，使用graphicx+tikz+calc宏包绘制信纸部件，使用color宏包实现配色调整，使用geometry+everypage+fancyhdr宏包控制页面输出。

按照学校常用颜色，配色只设置了蓝色、红色和黑色，用户如果确实需要调整配色，可以自行修改配色方案。

本部的信纸信息较为全面，有地址、邮编、电话、传真、电传等，而深圳校区的信纸只有抬头，没有其他信息，所以深圳校区的信纸加入了一些在官网查到的公开信息；威海校区的信纸没见过，所以仿照深圳校区的信纸制作了。

# 如何使用

如果会使用 LaTeX 的话，正常编译即可。

本模板也考虑到部分用户对 LaTeX 不熟悉，所以也提供了三个校区无页码的空白纸，可供打印。

# 各文件说明

| 文件(夹)名          | 用途 |
|:----:|:----:|
| figures/ | 标志引用文件夹 |
| hitletter.cls | 模板类文件 |
| hitletter-example.tex | 示例文档主文件 |
| hitletter-example.pdf | 示例文档 |
| hitletter-harbin-blue-empty.pdf | 本部蓝色主题空白信纸 |
| hitletter-harbin-blue-example.pdf | 本部蓝色主题示例信纸 |
| hitletter-shenzhen-blue-empty.pdf | 深圳校区蓝色主题空白信纸 |
| hitletter-shenzhen-blue-example.pdf | 深圳校区蓝色主题示例信纸 |
| hitletter-weihai-blue-empty.pdf | 威海校区蓝色主题空白信纸 |
| hitletter-weihai-blue-example.pdf | 威海校区蓝色主题示例信纸 |
| .gitignore| 忽略文件（开发用） |
| LICENSE | 模板采用协议 |

# 协议说明

哈尔滨工业大学校徽校名图片（hithrb.pdf 等）的版权归哈尔滨工业大学所有。

hitletter.cls 文档类与相关附属文件使用 MIT 协议授权。


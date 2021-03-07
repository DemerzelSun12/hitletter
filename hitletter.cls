%
% Harbin Institute of Technology
% Letter Template with HIT Title for LaTeX Users
%
%   Version
%       1.0
%   Created 
%       2021.03.06 by Sun Xiao
%
%       $Id$
%
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{hitletter}[2015/03/17 HIT letter document class]

\LoadClass{article}

\newif\ifhit@blue\hit@bluefalse
\newif\ifhit@black\hit@blackfalse
\newif\ifhit@red\hit@redfalse
\newif\ifhit@harbin\hit@harbinfalse
\newif\ifhit@shenzhen\hit@shenzhenfalse
\newif\ifhit@weihai\hit@weihaifalse
\newif\ifhit@pagenum\hit@pagenumfalse

\DeclareOption{blue}{\hit@bluetrue}
\DeclareOption{black}{\hit@blacktrue}
\DeclareOption{red}{\hit@redtrue}
\DeclareOption{harbin}{\hit@harbintrue}
\DeclareOption{shenzhen}{\hit@shenzhentrue}
\DeclareOption{weihai}{\hit@weihaitrue}
\DeclareOption{pagenum}{\hit@pagenumtrue}

\DeclareOption*{
  \PassOptionsToClass{\CurrentOption}{article}
}
\ProcessOptions

\newcommand\hit@error{\ClassError{hitletter}{You can ONLY specify ONE THEME COLOR: blue, black or red!}{}}
\ifhit@blue
  \ifhit@black
	\hit@error
  \else
  \ifhit@red
	\hit@error
  \fi
\fi
\else
\ifhit@black
  \ifhit@red
	\hit@error
  \fi
\fi
\fi

\newcommand\hit@errorb{\ClassError{hitletter}{You can ONLY specify ONE THEME LAYOUT: harbin, shenzhen or weihai!}{}}


\RequirePackage[
  left=3.17cm,
  right=3.17cm,
  top=6.2cm,
  bottom=2.5cm
]{geometry}
\RequirePackage{tikz}
\usetikzlibrary{calc}
\RequirePackage{fancyhdr}
\RequirePackage[CJKchecksingle]{xeCJK}
\RequirePackage{graphicx}
\RequirePackage{everypage}
\RequirePackage{color}
\RequirePackage{array}
\RequirePackage{multirow}
\RequirePackage{indentfirst}

\definecolor{hitblue}{cmyk}{1,0.8,0,0}
\definecolor{hitlightblue}{cmyk}{0.35,0.1,0,0}
\definecolor{hitred}{RGB}{167,0,0}
\definecolor{hitlightred}{RGB}{223,33,35}
\definecolor{hitlightblack}{RGB}{92,91,92}

\graphicspath{{figures/}{figure/}{pictures/}{picture/}{pic/}{pics/}{image/}{images/}}

\setlength{\parindent}{2em}


%Set theme color
\ifhit@blue
  \def\hit@theme@main{hitblue}
  \def\hit@theme@secondary{hitlightblue}
\else
  \ifhit@black
    \def\hit@theme@main{black} 
    \def\hit@theme@secondary{hitlightblack}
\else
  \ifhit@red
    \def\hit@theme@main{hitred}
    \def\hit@theme@secondary{hitlightred}
\else
  \def\hit@theme@main{hitblue}
  \def\hit@theme@secondary{hitlightblue}
\fi
\fi
\fi

\newcommand{\chuhao}    {\fontsize{42pt}   {\baselineskip}\selectfont}
\newcommand{\xiaochu}   {\fontsize{36pt}   {\baselineskip}\selectfont}
\newcommand{\xiaochuhao}{\fontsize{36pt}   {\baselineskip}\selectfont}
\newcommand{\yihao}     {\fontsize{28pt}   {\baselineskip}\selectfont}
\newcommand{\erhao}     {\fontsize{21pt}   {\baselineskip}\selectfont}
\newcommand{\xiaoer}    {\fontsize{18pt}   {\baselineskip}\selectfont}
\newcommand{\xiaoerhao} {\fontsize{18pt}   {\baselineskip}\selectfont}
\newcommand{\sanhao}    {\fontsize{15.75pt}{\baselineskip}\selectfont}
\newcommand{\xiaosan}   {\fontsize{15pt}   {\baselineskip}\selectfont}
\newcommand{\xiaosanhao}{\fontsize{15pt}   {\baselineskip}\selectfont}
\newcommand{\sihao}     {\fontsize{14pt}   {\baselineskip}\selectfont}
\newcommand{\xiaosi}    {\fontsize{12pt}   {\baselineskip}\selectfont}
\newcommand{\xiaosihao} {\fontsize{12pt}   {\baselineskip}\selectfont}
\newcommand{\wuhao}     {\fontsize{10.5pt} {\baselineskip}\selectfont}
\newcommand{\xiaowu}    {\fontsize{9pt}    {\baselineskip}\selectfont}
\newcommand{\xiaowuhao} {\fontsize{9pt}    {\baselineskip}\selectfont}
\newcommand{\liuhao}    {\fontsize{7.875pt}{\baselineskip}\selectfont}
\newcommand{\qihao}     {\fontsize{5.25pt} {\baselineskip}\selectfont}


%Define new commands
\def\hit@define@term#1{
  \expandafter\gdef\csname #1\endcsname##1{%
    \expandafter\gdef\csname hit@#1\endcsname{##1}}
  \csname #1\endcsname{}
}

\hit@define@term{address}
\hit@define@term{postcode}
\hit@define@term{tel}
\hit@define@term{fax}
\hit@define@term{Addr}
\hit@define@term{telex}
\hit@define@term{mobile}

\newlength{\hit@footer@textwidth}
\setlength{\hit@footer@textwidth}{\paperwidth}
\addtolength{\hit@footer@textwidth}{-30mm}

\newcommand\hit@letter@pagelayout{}

\newcommand\hit@letter@pagelayout@harbin{
  \address{中国$\cdot$哈尔滨市西大直街92号}
  \postcode{150001}
  \tel{0451-86412114}
  \fax{0451-86221048}
  \Addr{92West Da Zhi St.Harbin China}
  \telex{87217HITCN}

  \begin{tikzpicture}[x=1mm, y=1mm, remember picture,overlay,shift=(current page.north)]
    \node at ($(0,-25)$) {\textcolor{\hit@theme@main}{\includegraphics[scale=0.6]{hithrb.pdf}}};    
    \node at ($(0,-47)$) {\xiaowuhao{ 
      \begin{tabular}{lll}
        \textbf{地址}:\quad\hit@address  & \textbf{邮编} P.C:  \hit@postcode & \textbf{电话} Tel:  \hit@tel  \\
        \\[3pt]
        \textbf{Addr}:\ \hit@Addr &\textbf{传真} Fax: \hit@fax & \textbf{电传} Telex:  \hit@telex 
      \end{tabular}
    }};
  \filldraw[color=\hit@theme@main, line width=1.2] ($(-200,-55)+(current page.north east)$) rectangle ($(-18,-55)+(current page.north east)$);
  \fill[color=\hit@theme@secondary] (current page.south west) rectangle ($(current page.south east)+(0,3)$);
  \fill[color=\hit@theme@main] (current page.south west) rectangle ($1/3*(current page.south west)+2/3*(current page.south east)+(0,3)$);
  \end{tikzpicture}
}

\newcommand{\hit@letter@pagelayout@shenzhen}{
  \address{中国$\cdot$深圳市深圳大学城哈尔滨工业大学校区}
  \postcode{518055}
  \tel{0755-26033483}
  \Addr{HIT Campus of University Town of Shenzhen, Shenzhen, China}
      
  \begin{tikzpicture}[x=1mm, y=1mm, remember picture,overlay,shift=(current page.north)]
    \node at ($(0,-25)$) {\textcolor{\hit@theme@main}{\includegraphics[scale=0.27]{hitsz.pdf}}};
    
    \node at ($(0,-47)$) {\xiaowuhao{ 
      \begin{tabular}{ll}
        \textbf{地址}:\quad\hit@address  & \textbf{邮编} P.C:  \hit@postcode \\
        \\[3pt]
        \textbf{Addr}:\ \hit@Addr & \textbf{电话} Tel:  \hit@tel   
      \end{tabular}
    }};
  \filldraw[color=\hit@theme@main, line width=1.2] ($(-200,-55)+(current page.north east)$) rectangle ($(-18,-55)+(current page.north east)$);
  \fill[color=\hit@theme@secondary] (current page.south west) rectangle ($(current page.south east)+(0,3)$);
  \fill[color=\hit@theme@main] (current page.south west) rectangle ($1/3*(current page.south west)+2/3*(current page.south east)+(0,3)$);
  \end{tikzpicture}
}

\newcommand\hit@letter@pagelayout@weihai{
  \address{中国$\cdot$山东省威海市文化西路2号}
  \postcode{264209}
  \tel{0631-5687001}
  \Addr{No.2, West Wenhua Road, High-tech District, Weihai, Shandong, China}
  
  \begin{tikzpicture}[x=1mm, y=1mm, remember picture,overlay,shift=(current page.north)]
    \node at ($(0,-25)$) {\textcolor{\hit@theme@main}{\includegraphics[scale=0.27]{hitwh.pdf}}};
    
    \node at ($(0,-47)$) {\xiaowuhao{ 
      \begin{tabular}{ll}
        \textbf{地址}:\quad\hit@address  & \textbf{邮编} P.C:  \hit@postcode \\
        \\[3pt]
        \textbf{Addr}:\ \hit@Addr & \textbf{电话} Tel:  \hit@tel   
      \end{tabular}
    }};
  \filldraw[color=\hit@theme@main, line width=1.2] ($(-200,-55)+(current page.north east)$) rectangle ($(-18,-55)+(current page.north east)$);
  \fill[color=\hit@theme@secondary] (current page.south west) rectangle ($(current page.south east)+(0,3)$);
  \fill[color=\hit@theme@main] (current page.south west) rectangle ($1/3*(current page.south west)+2/3*(current page.south east)+(0,3)$);
  \end{tikzpicture}
}

%TODO:
\newcommand{\hit@letter@pagelayout@draft}{}

%Select theme layout
\ifhit@harbin
  \renewcommand{\hit@letter@pagelayout}{\hit@letter@pagelayout@harbin}
\else
  \ifhit@shenzhen
    \renewcommand{\hit@letter@pagelayout}{\hit@letter@pagelayout@shenzhen}
\else
  \ifhit@weihai
    \renewcommand{\hit@letter@pagelayout}{\hit@letter@pagelayout@weihai}
\else
  \hit@errorb
\fi
\fi
\fi

\AddEverypageHook{\hit@letter@pagelayout}

\ifhit@pagenum
\relax
\else
  \AtBeginDocument{\pagestyle{empty}}
\fi

%
% End of hitletter.cls
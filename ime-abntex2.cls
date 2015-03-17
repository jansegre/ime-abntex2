%% vim: et ts=2 sts=2 sw=2
%%
%% Customizações do abnTeX2 (http://abnTeX2.googlecode.com) para o Instituto Militar de Engenharia
%%
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License, either version 1.3
%% of this license or (at your option) any later version.
%% The latest version of this license is in
%%   http://www.latex-project.org/lppl.txt
%% and version 1.3 or later is part of all distributions of LaTeX
%% version 2005/12/01 or later.
%%
%% This work has the LPPL maintenance status `maintained'.
%%
%% The Current Maintainer of this work is Jan Segre, jansegre@gmail.com
%%
%% Further information about abnTeX2 are available on http://abntex2.googlecode.com/
%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ime-abntex2}[2015/03/16 v0.3 Modelo do Instituto Militar de Engenharia baseado em abnTeX2]
\usepackage[utf8]{inputenc} % Codificacao do documento atual, isto é, dessa classe
\usepackage{lastpage} % Para total de páginas

% para mais detalhes sobre as opções:
% http://en.wikibooks.org/wiki/LaTeX/Creating_Packages

% brasao - opção para colocar o brasão no topo da primeira página
\newif\ifime@brasao\ime@brasaofalse
\DeclareOption{brasao}{\ime@brasaotrue}

%
% Repassa todos os parametros a classe abntex2,
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{abntex2}}

\ProcessOptions\relax
\LoadClass{abntex2}

% Muda o cabeçalho (parte que tem o número da página, e originalmente o capítulo atual com uma linha embaixo)
\makepagestyle{abntheadings}
%\makeevenhead{abntheadings}{\ABNTEXfontereduzida\thepage}{}{\ABNTEXfontereduzida\textit\leftmark}
%\makeoddhead{abntheadings}{\ABNTEXfontereduzida\textit\rightmark}{}{\ABNTEXfontereduzida\thepage}
%\makeheadrule{abntheadings}{\textwidth}{\normalrulethickness}
\makeevenhead{abntheadings}{\ABNTEXfontereduzida\thepage}{}{}
\makeoddhead{abntheadings}{}{}{\ABNTEXfontereduzida\thepage}

% Aumentar o tamanho da linha de assinatura
% XXX o tamanho deveria sempre abranger o maior nome, atualmente é fixo em 10cm
\setlength{\ABNTEXsignwidth}{10cm}


% Mudar fonte dos títulos para usar fontes com serif
% olhar seção 6.1 de http://mirror.math.ku.edu/tex-archive/macros/latex/contrib/abntex2/doc/abntex2.pdf
%\renewcommand{\ABNTEXchapterfont}{\fontfamily{ptm}\selectfont}
\renewcommand{\ABNTEXchapterfont}{\fontfamily{ptm}\fontseries{b}\selectfont}

% Capa
% ====

\renewcommand{\imprimircapa}{
  \begin{capa}
  \center
  \ifime@brasao
    \vspace*{-25mm}
    \includegraphics[height=25mm]{Brasao}\\
  \else
    \vspace*{-15mm}
  \fi
  {\ABNTEXchapterfont\small
    MINISTÉRIO DA DEFESA\\
    EXÉRCITO BRASILEIRO\\
    DEPARTAMENTO DE CIÊNCIA E TECNOLOGIA\\
    INSTITUTO MILITAR DE ENGENHARIA\\
    (Real Academia de Artilharia, Fortificação e Desenho/1792)\\
    CURSO DE GRADUAÇÃO EM ENGENHARIA DE COMPUTAÇÃO}

  \vfill

  {\ABNTEXchapterfont\ABNTEXsectionfontsize\imprimirautor}

  \vfill

  {\ABNTEXchapterfont\ABNTEXchapterfontsize\imprimirtitulo}

  \vfill

  {\ABNTEXchapterfont\large\imprimirlocal}\\
  {\ABNTEXchapterfont\large\imprimirdata}

  \vspace*{1cm}
  \end{capa}
}


% Folha de rosto
% ==============

\makeatletter

\renewcommand{\folhaderostocontent}{\
  \begin{center}
  {\ABNTEXchapterfont\Large Instituto Militar de Engenharia}

  \vspace*{\fill}\vspace*{\fill}

  \begin{center}
  {\ABNTEXchapterfont\Large\imprimirtitulo}
  \end{center}

  \vspace*{5cm}

  \abntex@ifnotempty{\imprimirpreambulo}{
    \hspace{.45\textwidth}
    \begin{minipage}{.5\textwidth}
      \SingleSpacing
      \par \imprimirpreambulo
      \par {\imprimirorientadorRotulo~\imprimirorientador\par}
      \abntex@ifnotempty{\imprimircoorientador}{
        {\imprimircoorientadorRotulo~\imprimircoorientador}
      }
    \end{minipage}
    \vspace*{\fill}
  }

  \vspace*{\fill}

  {\ABNTEXchapterfont\large\imprimirlocal}\\
  {\ABNTEXchapterfont\large\imprimirdata}

  \vspace*{1cm}
  \end{center}
}

\makeatother

% Ficha catalográfica
% ===================

\newcommand{\imprimirfichacatalografica}[6]{%
  \begin{fichacatalografica}
  \let\footnotesize\small
  \let\footnoterule\relax
  \let\footnote\thanks
  \noindent
  \normalsize
  %XXX: what's the best way to parametrize this year?
  %     it may not always be desirable to use the current year
  %c\the\year{}
  %\vspace{10mm}

  {\noindent
    INSTITUTO MILITAR DE ENGENHARIA\\
    Praça General Tibúrcio, 80 - Praia Vermelha\\
    Rio de Janeiro-RJ CEP 22290-270}
  \vspace{10mm}

  {\noindent
    Este exemplar é de propriedade do Instituto Militar de Engenharia, que poderá incluí-lo em base de dados, armazenar em
    computador, microfilmar ou adotar qualquer forma de arquivamento.}

  \vspace{10mm}

  {\indent
    É permitida a menção, reprodução parcial ou integral e a transmissão entre bibliotecas deste trabalho, sem modificação
    de seu texto, em qualquer meio que esteja ou venha a ser fixado, para pesquisa acadêmica, comentários e citações, desde
    que sem finalidade comercial e que seja feita a referência bibliográfica completa.

    \vspace{10mm}

    Os conceitos expressos neste trabalho são de responsabilidade do(s) autor(es) e do(s) orientador(es).}

  \vspace{10mm}

  {\noindent
    \hspace{4.5cm}
    \framebox[11.5cm]{\footnotesize
      \begin{minipage}{12cm}
        \vspace*{1mm}
        \parbox[t]{2cm}{\hspace{4mm} #1}% código CDD
        \parbox[t]{9.5cm}{\noindent #3}\\
        \parbox[t]{2cm}{\hspace{4mm} #2}% código estranho
        %\parbox[t]{1.5cm}{\ }
        % FIXME a parte do título deve estar apenas com a primeira letra maiúscula, não consegui fazer isso, coloquei para o título entrar como argumento
        %\parbox[t]{9cm}{\noindent \hspace{4mm} {\let\\=\ \MakeLowercase{\imprimirtitulo}} /{\let\\=, \imprimirautor}; orientados por \imprimirorientador\ - Rio de Janeiro: Instituto Militar de Engenharia, \the\year{}.}\\
        \parbox[t]{9.5cm}{\noindent \hspace{4mm} #6 /{\let\\=, \imprimirautor}; orientados por \imprimirorientador\ - Rio de Janeiro: Instituto Militar de Engenharia, \the\year{}.}\\
        \parbox[t]{2cm}{\ }
        \parbox[t]{9.5cm}{\noindent \hspace{4mm}}\\
        [\baselineskip]
        \parbox[t]{2cm}{\ }
        \parbox[t]{9.5cm}{\noindent \hspace{4mm} \pageref{LastPage}p. : il.} \\
        [\baselineskip]
        \parbox[t]{2cm}{\ }
        \parbox[t]{9.5cm}{\noindent \hspace{4mm} #4 - Instituto Militar de Engenharia \vspace{1mm} - Rio de Janeiro, \the\year{}. } \\
        [\baselineskip]
        \parbox[t]{2cm}{\ }
        \parbox[t]{9.5cm}{\noindent \hspace{4mm} #5}\\% tags estranhas
        %[\baselineskip]
        %\parbox[t]{9cm}{\ }
        %\parbox[t]{2.5cm}{CDD #1}
        %[\baselineskip]
        %\parbox[t]{11.5cm}{\ }
      \end{minipage}
    }
  }

  \end{fichacatalografica}
}


% Folha de aprovação
% ==================

% orientador + no máximo 3 convidados
% para adicionar um convidado à lista de assinaturas:
%
% \convidadoum{Fulano da Silva - Ph.D}{Convidado Especial}
%

%\newcommand{\orientadorNome}{}
\let\oldorientador\orientador
\newcommand{\imprimirorientadorTitulo}{}
\renewcommand{\orientador}[2]{\oldorientador{#1}\renewcommand{\imprimirorientadorTitulo}{#2}}

\newcommand{\convidadoumNome}{}
\newcommand{\convidadoumTitulo}{}
\newcommand{\convidadoum}[2]{\renewcommand{\convidadoumNome}{#1}\renewcommand{\convidadoumTitulo}{#2}}

\newcommand{\convidadodoisNome}{}
\newcommand{\convidadodoisTitulo}{}
\newcommand{\convidadodois}[2]{\renewcommand{\convidadodoisNome}{#1}\renewcommand{\convidadodoisTitulo}{#2}}

\newcommand{\convidadotresNome}{}
\newcommand{\convidadotresTitulo}{}
\newcommand{\convidadotres}[2]{\renewcommand{\convidadotresNome}{#1}\renewcommand{\convidadotresTitulo}{#2}}

\newcommand{\imprimirfolhadeaprovacao}[1]{
  \begin{folhadeaprovacao}

  \begin{center}
  {\ABNTEXchapterfont\large Instituto Militar de Engenharia}\\

  \vspace*{\fill}

  {\ABNTEXchapterfont\large\imprimirautor}\\

  \vspace*{\fill}

  {\ABNTEXchapterfont\bfseries\Large\imprimirtitulo}\\

  \vspace*{\fill}
  \end{center}

  \par\imprimirpreambulo
  \par\imprimirorientadorRotulo~\imprimirorientador
  \par

  Aprovado em #1 pela seguinte Banca Examinadora:

  \assinatura{\textbf{\imprimirorientador\ - \imprimirorientadorTitulo} \\ Orientador}
  \assinatura{\textbf{\convidadoumNome\ - \convidadoumTitulo}}
  \assinatura{\textbf{\convidadodoisNome\ - \convidadodoisTitulo}}
  %TODO: find out why does abntex@ifnotempty doesn't work so we can have some dynamic list
  %\abntex@ifnotempty{\convidadoumNome}{\assinatura{\textbf{\convidadoumNome} \\ \convidadoumTitulo}}
  %\abntex@ifnotempty{\convidadodoisNome}{\assinatura{\textbf{\convidadodoisNome} \\ \convidadodoisTitulo}}
  %\abntex@ifnotempty{\convidadotresNome}{\assinatura{\textbf{\convidadotresNome} \\ \convidadotresTitulo}}

  \vspace*{\fill}

  \begin{center}
  \vspace*{0.5cm}
  {\ABNTEXchapterfont\large\imprimirlocal}\\
  {\ABNTEXchapterfont\large\imprimirdata}
  \vspace*{1cm}
  \end{center}

  \end{folhadeaprovacao}
}

% TODO corrigir modelo de referencias

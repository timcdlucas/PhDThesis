PhD Thesis
===========

This is a repo containing my PhD Thesis.

The template is taken from [here](https://github.com/ucl/ucl-latex-thesis-templates).
The style file is taken from Robert Stanley [here](https://github.com/robjstan/latex-phdthesis).
There was a few edits to get the template and Rob's style to work together.
The style file requires xelatex (or lautex) so the thesis is now compiled wit xelatex.

The main file is [tim-lucas-thesis.tex](tim-lucas-thesis.tex) and [tim-lucas-thesis.pdf](tim-lucas-thesis.pdf) is the compiled pdf which should render in github (maybe slowly).

The following files contain the main content of the thesis.
- [Introduction.tex](Introduction.tex)
- [Chapter2.Rtex](Chapter2.Rtex)
- [Chapter3.Rtex](Chapter3.Rtex)
- [Chapter4.Rtex](Chapter4.Rtex)
- [Chapter5.Rtex](Chapter5.Rtex)
- [Conclusions.tex](Conclusions.tex)

Data chapters are written as .Rtex files with embedded R code. 
These files are `Chapter*.Rtex`.
These files are compiled to create files `Chapter*.tex` which does not include R code.
Text only chapters are written directly in a .tex file.

While [tim-lucas-thesis.pdf](tim-lucas-thesis.pdf) is the full thesis pdf, most chapters are also compiled seperately. These files are 

- [Chapter_2_draft.pdf](Chapter_2_draft.pdf)
- [Chapter_3_draft.pdf](Chapter_3_draft.pdf)
- [Chapter_5_draft.pdf](Chapter_5_draft.pdf)


Reproducibility
----------------

The thesis is largely reproducible. 
Chapters 2 and 4 require my R package [MetapopEpi](https://github.com/timcdlucas/MetapopEpi) which is only available on github.
The simulations in chapter 5 are not reproducible. 
They were written by a coauthor and I haven't gotten round to getting the code and working out how to run it.
Sorry.


Pretty Thesis
-------------

As the required formatting for a UCL thesis is rather uninspiring I am also creating a file that is formatted in a way that I think is attractive and readable.
Since including Rob's style file, the pretty thesis is much less necessary. 
But I'll still play with it.

The files for this version are in [PrettyThesis](PrettyThesis) and the combined pdf is [PrettyThesis/tim-lucas-pretty-thesis.pdf](PrettyThesis/tim-lucas-pretty-thesis.pdf).


![Network image](/imgs/fullyConnected.png)

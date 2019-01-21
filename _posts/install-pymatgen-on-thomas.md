Install pymatgen on Thomas

```
Currently Loaded Modulefiles:
  1) gcc-libs/4.9.2                 7) subversion/1.8.13             13) giflib/5.1.1                  19) compilers/intel/2017/update1  25) python3/recommended
  2) cmake/3.7.2                    8) screen/4.2.1                  14) emacs/24.5                    20) mpi/intel/2017/update1/intel  26) gnuplot/5.0.1
  3) flex/2.5.39                    9) gerun                         15) tmux/2.2                      21) default-modules/2017          27) grace/5.1.25
  4) git/2.10.2                    10) nano/2.4.2                    16) mrxvt/0.5.4                   22) python/3.6.3
  5) apr/1.5.2                     11) nedit/5.6-aug15               17) userscripts/1.3.0             23) openblas/0.2.14/gnu-4.9.2
  6) apr-util/1.5.4                12) dos2unix/7.3                  18) rcps-core/1.0.0               24) python3/3.6
```



Thomas에서 제공하는 cython이 알 수 없는 이유로 intel compiler를 이용해 컴파일 되어있다. gcc로 컴파일 되어있으므로 scipy, cython을 local에 설치하고 시작한다. 

1. `pip install scipy --user --ignore-installed`
2. `pip install cython --user --ignore-installed`
3. `git clone https://github.com/materialsproject/pymatgen.git`
4. `python setup.py build`
5. `python setup.py install --prefix='$HOME/.python3.local'`

   ​


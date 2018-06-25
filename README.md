The GAP 4 package `CddInterface'
==============================

# Why CddInterface

Every convex polyhedron P has two representations, one as the intersection of finite halfspaces and the other as Minkowski sum of the convex hull of 
finite points and the nonnegative hull of finite directions. These are called H-representation and V-representation, respectively. 

CddInterface is a gap interface with the C package [Cddlib
](https://www.inf.ethz.ch/personal/fukudak/cdd_home/) which among other things can translate between H,V- representations of a polyhedron P and solve linear programming problems over P, i.e. a problem of maximizing and minimizing a linear function over P. A list of all available operations can be found in the manual.pdf.

# Install

Make sure you can update "configure" scriptes by installing `autoconf`
    
    sudo apt-get install autoconf
    
or
    
    sudo apt-get install dh-autoreconf
    

## Simple

For a simplyfied installation, try the following two commands in the main CddInterface directory

    ./install.sh <path-to-gaproot>

If that does not work, try the following

## Advanced

Go inside the cddlib directory and create a directory `build` using the following commands:
    
    sudo su (if root permission is needed)
    cd cddlib
    make clean
    mkdir build

After that, compile cddlib via

    ./bootstrap.sh
    ./configure --prefix=$(pwd)/build
    make
    make install

Cdd should now be installed in the `build` directory. After that, go back to the CddInterface main folder
and install CddInterface with the following commands

    ./autogen.sh
    ./configure --with-gaproot=path/to/gaproot --with-cddlib=$(pwd)/cddlib/build
    make

After that, you should be able to load CddInterface.

## Documentation
To create the documentation:
    
    gap makedoc.g

To run the test files 

    gap maketest.g
    
## Update
The package can be updated using the following commands

    git pull
    make

Of course you are welcome to e-mail me if there are any questions, remarks, suggestions ;)

Kamal Saleh e-mail: saleh@mathematik.uni-siegen.de

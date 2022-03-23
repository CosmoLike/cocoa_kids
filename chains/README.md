# Table of contents
1. [How to run the example plot script?](#overview)
2. [How to modify the example plot script?](#modify)

## How to run the example plot script? <a name="overview"></a>

In the instructions below, we assume the user opted for the easier *Conda installation*, and located the terminal at the folder *where Cocoa was cloned*.

**Step 1 of 4**: go to Cocoa main folder
    
    $ cd ./Cocoa
    
**Step 2 of 4**: activate conda Cocoa environment and the private python environment

    $ conda activate cocoa
    $(cocoa) source start_cocoa

**Step 3 of 4**: go to the chains folder inside the kids project folder (`./cocoa/Cocoa/projects/kids/chains`):

    $(cocoa)(.local) cd ./projects/kids/chains

**Step 4 of 4**: Assuming you just run `EXAMPLE_MCMC1.yaml` chain until convergence, type:

    $(cocoa)(.local) $PYTHON3 plot1.py
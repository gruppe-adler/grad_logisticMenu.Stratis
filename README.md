Gruppe Adler LogisticMenu is a little script to simplify the refilling process of supply crates. 

# Installation

Put the following in the `init` of the crate, you want to add the Logistic Menu to:
```sqf
this call grad_logisticMenu_fnc_addAction
```

Include the following in your description.ext:
```sqf
#include "grad_logisticMenu\include\description.hpp"
```
  
Include the following in the `CfgFunctions` class which (somewhere in your `description.ext`):
```sqf
#include "grad_logisticMenu\include\CfgFunctions.hpp"
```

Here is an example of a `description.ext`:
```sqf
#include "grad_logisticMenu\include\description.hpp"

class CfgFunctions {
    #include "grad_logisticMenu\include\CfgFunctions.hpp"
};
```
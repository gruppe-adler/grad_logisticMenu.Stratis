Gruppe Adler LogisticsMenu is a script to simplify supply crate management. When interacting with the source ammo box, it shows a user interface to spawn a new ammo box that can be filled from the contents of the source box.

![](https://i.imgur.com/Mjz7NU3.jpg)

## Installation

1. Include the whole `grad_logisticMenu` folder in your mission.

2. Put the following in the `init` of the crate, you want to add the Logistic Menu to:
```sqf
this call grad_logisticMenu_fnc_addAction
```

3. Include the following in your description.ext:
```sqf
#include "grad_logisticMenu\include\description.hpp"
```
  
4. Include the following in the `CfgFunctions` class which (somewhere in your `description.ext`):
```sqf
#include "grad_logisticMenu\include\CfgFunctions.hpp"
```

## Example

Here is an example of a `description.ext`:
```sqf
#include "grad_logisticMenu\include\description.hpp"

class CfgFunctions {
    #include "grad_logisticMenu\include\CfgFunctions.hpp"
};
```

## Configuration
You can change the class of the box, which will spawned in the  `configure.hpp` located directly in the grad_logistic folder, by just changing the classname (default: `"Box_NATO_Ammo_F"`). Please don't forget the quotation marks ;)

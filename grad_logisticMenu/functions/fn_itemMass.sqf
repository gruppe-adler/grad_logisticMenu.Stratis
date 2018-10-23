params ["_itemClass","_configClass"];

_mass = 0;

switch (_configClass) do {
    case ("CfgVehicles"): {
        _mass = [(configFile >> _configClass >> _itemClass),"mass"] call BIS_fnc_returnConfigEntry;
    };
    case ("CfgMagazines"): {
        _mass = [(configFile >> _configClass >> _itemClass),"mass"] call BIS_fnc_returnConfigEntry;
    };
    case ("CfgWeapons"): {
        if (isClass  (configFile >> _configClass >> _itemClass >> "WeaponSlotsInfo")) then {
            _mass = [(configFile >> _configClass >> _itemClass >> "WeaponSlotsInfo"),"mass"] call BIS_fnc_returnConfigEntry;
        } else {
            _mass = [(configFile >> _configClass >> _itemClass >> "ItemInfo"),"mass"] call BIS_fnc_returnConfigEntry;
        };
    };
};

_mass

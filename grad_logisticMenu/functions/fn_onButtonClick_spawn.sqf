#include "..\configure.hpp"

private _smallBox = createVehicle [SMALLBOX_CLASS, getPos grad_logisticMenu_bigBox, [], 2, "NONE"];

clearWeaponCargoGlobal _smallBox;
clearBackpackCargoGlobal _smallBox;
clearItemCargoGlobal _smallBox;
clearMagazineCargoGlobal _smallBox;

private _allItems = [];
{
    for "_i" from 1 to (_x select 1) do {
    _allItems pushBack [_x select 0,_x select 2];
    };
} forEach grad_logisticMenu_smallBoxCargo;

{
    private _class = _x select 0;
    private _parentClass = _x select 1;
    switch (_parentClass) do {
        case ("CfgVehicles"): {
            if (_class in (backpackCargo grad_logisticMenu_bigBox)) then {
                _smallBox addBackpackCargoGlobal [_class, 1];
                [grad_logisticMenu_bigBox,_class] call CBA_fnc_removeBackpackCargo;
            } else {
                systemChat format ["%1 could not be added because it has been removed already.", [(configFile >> _parentClass >> _class),"displayName"] call BIS_fnc_returnConfigEntry];
            };
        };
        case ("CfgWeapons"): {
            if (_class in (itemCargo grad_logisticMenu_bigBox) || _class in (weaponCargo grad_logisticMenu_bigBox)) then {
                _smallBox addItemCargoGlobal [_class, 1];
                private _r = [grad_logisticMenu_bigBox,_class] call CBA_fnc_removeItemCargo;
                if (!_r) then {[grad_logisticMenu_bigBox,_class] call CBA_fnc_removeWeaponCargo;};
            } else {
                systemChat format ["%1 could not be added because it has been removed already.", [(configFile >> _parentClass >> _class),"displayName"] call BIS_fnc_returnConfigEntry];
            };
        };
        case ("CfgMagazines"): {

            if (_class in (magazineCargo grad_logisticMenu_bigBox)) then {
                _smallBox addMagazineCargoGlobal [_class, 1];
                [grad_logisticMenu_bigBox,_class] call CBA_fnc_removeMagazineCargo;
            } else {
                systemChat format ["%1 could not be added because it has been removed already.", [(configFile >> _parentClass >> _class),"displayName"] call BIS_fnc_returnConfigEntry];
            };
        };
    };
} forEach _allItems;

closeDialog 1;

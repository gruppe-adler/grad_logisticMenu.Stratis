#include "..\idcmacros.hpp"
#include "..\configure.hpp"

disableSerialization;

params ["_dialog"];

//big box items
lnbClear (_dialog displayCtrl IDC_BIGBOX);
{
    private _itemClass = _x select 0;
    private _amount = _x select 1;
    private _configClass = _x select 2;
    private _displayName = [(configFile >> _configClass >> _itemClass),"displayName"] call BIS_fnc_returnConfigEntry;
    private _icon =  [(configFile >> _configClass >> _itemClass),"picture"] call BIS_fnc_returnConfigEntry;
    private _row = (_dialog displayCtrl IDC_BIGBOX) lnbAddRow [str _amount, "", _displayName];
    (_dialog displayCtrl IDC_BIGBOX) lnbSetPicture [[_row, 1], _icon];
    (_dialog displayCtrl IDC_BIGBOX) lnbSetData [[_row, 0], _itemClass];
} forEach grad_logisticMenu_bigBoxCargo;


private _smallBoxLoad = 0;

//small box items
lnbClear (_dialog displayCtrl IDC_SMALLBOX);
{
    //add row
    private _itemClass = _x select 0;
    private _amount = _x select 1;
    private _configClass = _x select 2;
    private _displayName = [(configFile >> _configClass >> _itemClass),"displayName"] call BIS_fnc_returnConfigEntry;
    private _icon =  [(configFile >> _configClass >> _itemClass),"picture"] call BIS_fnc_returnConfigEntry;
    private _row = (_dialog displayCtrl IDC_SMALLBOX) lnbAddRow [str _amount, "", _displayName];
    (_dialog displayCtrl IDC_SMALLBOX) lnbSetPicture [[_row, 1], _icon];
    (_dialog displayCtrl IDC_SMALLBOX) lnbSetData [[_row, 0], _itemClass];

    //add mass
    _smallBoxLoad = _smallBoxLoad + _amount * ([_itemClass,_configClass] call grad_logisticMenu_fnc_itemMass);
} forEach grad_logisticMenu_smallBoxCargo;

grad_logisticMenu_smallBoxFreeSpace = ([(configFile >> "CfgVehicles" >> SMALLBOX_CLASS),"maximumLoad"] call BIS_fnc_returnConfigEntry) - _smallBoxLoad;

//update load
(_dialog displayCtrl IDC_LOAD) progressSetPosition (_smallBoxLoad / ([(configFile >> "CfgVehicles" >> SMALLBOX_CLASS),"maximumLoad"] call BIS_fnc_returnConfigEntry));

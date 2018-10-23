#include "..\idcmacros.hpp"
#include "..\configure.hpp"

disableSerialization;

params ["_box", "_player"];

//make sure is executed local on caller
if !(local _player) exitWith {
    _this remoteExec ["grad_logisticMenu_fnc_action",_player];
};

//open dialog
createDialog "grad_logisticMenu_main";

grad_logisticMenu_bigBox = _box;
grad_logisticMenu_bigBoxCargo = [];
grad_logisticMenu_smallBoxCargo = [];
grad_logisticMenu_smallBoxFreeSpace = [(configFile >> "CfgVehicles" >> SMALLBOX_CLASS),"maximumLoad"] call BIS_fnc_returnConfigEntry;

//change items/weapon/magazines/backpacks from format ["ITEM1","ITEM1","ITEM2"] to [["ITEM1",[2,"CfgWeapons"]],["ITEM2",[1,"Cfg.."]]]
{
    private _itemClass = _x;
    if ({_x select 0 isEqualTo _itemClass} count grad_logisticMenu_bigBoxCargo isEqualTo 0) then {
        private _amount = {_x isEqualTo _itemClass}  count (weaponCargo _box);
        grad_logisticMenu_bigBoxCargo pushBack [_itemClass, _amount, "CfgWeapons"];
    };
} forEach (weaponCargo _box);

{
    private _itemClass = _x;
    if ({_x select 0 isEqualTo _itemClass} count grad_logisticMenu_bigBoxCargo isEqualTo 0) then {
        private _amount = {_x isEqualTo _itemClass}  count (magazineCargo _box);
        grad_logisticMenu_bigBoxCargo pushBack [_itemClass, _amount,"CfgMagazines"];
    };
} forEach (magazineCargo _box);

{
    private _itemClass = _x;
    if ({_x select 0 isEqualTo _itemClass} count grad_logisticMenu_bigBoxCargo isEqualTo 0) then {
        private _amount = {_x isEqualTo _itemClass}  count (itemCargo _box);
        grad_logisticMenu_bigBoxCargo pushBack [_itemClass, _amount, "CfgWeapons"];
    };
} forEach (itemCargo _box);

{
    private _itemClass = _x;
    if ({_x select 0 isEqualTo _itemClass} count grad_logisticMenu_bigBoxCargo isEqualTo 0) then {
        private _amount = {_x isEqualTo _itemClass}  count (backpackCargo _box);
        grad_logisticMenu_bigBoxCargo pushBack [_itemClass, _amount, "CfgVehicles"];
    };
} forEach (backpackCargo _box);

waitUntil {! isNull(uiNamespace getVariable ["grad_logisticMenu_main", displayNull])};
private _dialog = (uiNamespace getVariable ["grad_logisticMenu_main", displayNull]);

[_dialog] call grad_logisticMenu_fnc_loadUI;

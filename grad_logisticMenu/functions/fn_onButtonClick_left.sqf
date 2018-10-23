#include "..\idcmacros.hpp"

params ["_ctrl"];

private _dialog = ctrlParent _ctrl;

if ((_dialog displayCtrl IDC_SMALLBOX) lnbText [lnbCurSelRow (_dialog displayCtrl IDC_SMALLBOX), 0] isEqualTo "") exitWith {};

private _itemClass = (_dialog displayCtrl IDC_SMALLBOX) lnbData [lnbCurSelRow (_dialog displayCtrl IDC_SMALLBOX),0];

private _bigIndex = [grad_logisticMenu_bigBoxCargo,_itemClass] call grad_logisticMenu_fnc_findInTriplets;
private _smallIndex = [grad_logisticMenu_smallBoxCargo,_itemClass] call grad_logisticMenu_fnc_findInTriplets;

private _amount = parseNumber ((_dialog displayCtrl IDC_AMOUNT) lbText (lbCurSel (_dialog displayCtrl IDC_AMOUNT)));
private _maxamount = (grad_logisticMenu_smallBoxCargo select _smallIndex) select 1;
private _amount = _maxamount min _amount;

//add to bigBoxCargo
if (_bigIndex isEqualTo -1) then {
    grad_logisticMenu_bigBoxCargo pushBack [_itemClass,_amount, (grad_logisticMenu_smallBoxCargo select _smallIndex) select 2];
} else {
    private _oldAmount = (grad_logisticMenu_bigBoxCargo select _bigIndex) select 1;
    (grad_logisticMenu_bigBoxCargo select _bigIndex) set [1,_oldAmount+_amount];
};

//remove from smallBoxCargo
if (_maxamount isEqualTo _amount) then {
    grad_logisticMenu_smallBoxCargo deleteAt _smallIndex;
} else {
    (grad_logisticMenu_smallBoxCargo select _smallIndex) set [1, ((grad_logisticMenu_smallBoxCargo select _smallIndex) select 1) - _amount];
};

[_dialog] call grad_logisticMenu_fnc_loadUI;

#include "..\idcmacros.hpp"

params ["_ctrl"];

private _dialog = ctrlParent _ctrl;

if ((_dialog displayCtrl IDC_BIGBOX) lnbText [lnbCurSelRow (_dialog displayCtrl IDC_BIGBOX), 0] isEqualTo "") exitWith {};

private _itemClass = (_dialog displayCtrl IDC_BIGBOX) lnbData [lnbCurSelRow (_dialog displayCtrl IDC_BIGBOX),0];
private _configClass = (_dialog displayCtrl IDC_BIGBOX) lnbData [lnbCurSelRow (_dialog displayCtrl IDC_BIGBOX),0];

private _bigIndex = [grad_logisticMenu_bigBoxCargo,_itemClass] call grad_logisticMenu_fnc_findInTriplets;
private _smallIndex = [grad_logisticMenu_smallBoxCargo,_itemClass] call grad_logisticMenu_fnc_findInTriplets;

private _amount = parseNumber ((_dialog displayCtrl IDC_AMOUNT) lbText (lbCurSel (_dialog displayCtrl IDC_AMOUNT)));
private _maxamount = (grad_logisticMenu_bigBoxCargo select _bigIndex) select 1;
private _amount = _maxamount min _amount;

//check wether there is enough space for the items
private _canAmount = floor (grad_logisticMenu_smallBoxFreeSpace / ([_itemClass, (grad_logisticMenu_bigBoxCargo select _bigIndex) select 2] call grad_logisticMenu_fnc_itemMass));

if (_canAmount isEqualTo 0) exitWith {
    systemChat format ["WARNING: Due to overflow %1 couldn't been added.", (_dialog displayCtrl IDC_BIGBOX) lnbText [lnbCurSelRow (_dialog displayCtrl IDC_BIGBOX),2]];
};
if (_amount > _canAmount) then {
    _amount = _canAmount;
    systemChat format ["WARNING: Due to overflow only %1 %2 have been added.", _canAmount, (_dialog displayCtrl IDC_BIGBOX) lnbText [lnbCurSelRow (_dialog displayCtrl IDC_BIGBOX),2]];
};

//add to smallBoxCargo
if (_smallIndex isEqualTo -1) then {
    grad_logisticMenu_smallBoxCargo pushBack [_itemClass,_amount, (grad_logisticMenu_bigBoxCargo select _bigIndex) select 2];
} else {
    private _oldAmount = (grad_logisticMenu_smallBoxCargo select _smallIndex) select 1;
    (grad_logisticMenu_smallBoxCargo select _smallIndex) set [1,_oldAmount+_amount];
};

//remove from bigBoxCargo
if (_maxamount isEqualTo _amount) then {
    grad_logisticMenu_bigBoxCargo deleteAt _bigIndex;
} else {
    (grad_logisticMenu_bigBoxCargo select _bigIndex) set [1, ((grad_logisticMenu_bigBoxCargo select _bigIndex) select 1) - _amount];
};

[_dialog] call grad_logisticMenu_fnc_loadUI;

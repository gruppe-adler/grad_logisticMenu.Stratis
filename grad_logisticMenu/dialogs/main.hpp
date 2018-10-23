class grad_logisticMenu_main
{
	idd = -1;
	movingEnable = false;
	onLoad = "_this call grad_logisticMenu_fnc_onLoad";
	onUnload = "_this call grad_logisticMenu_fnc_onUnload";
	class ControlsBackground
	{
		class title: grad_logisticMenu_RscText
		{
			idc = -1;
			x = safezoneW / 2 - 75 * GRID_W + safezoneX;
			y = safezoneH / 2 - 56 * GRID_H + safezoneY;
			w = 150 * GRID_W;
			h = 5.5 * GRID_H;
			colorBackground[] = {"(profilenamespace getvariable ['GUI_BCG_RGB_R',0.77])","(profilenamespace getvariable ['GUI_BCG_RGB_G',0.51])","(profilenamespace getvariable ['GUI_BCG_RGB_B',0.08])", 1};
		};
		class background: title
		{
			y = safezoneH / 2 - 50 * GRID_H + safezoneY;
			h = 100 * GRID_H;
			colorBackground[]={0,0,0,0.8};
		};
	};
	class Controls {
		class ItemsBigBox: grad_logisticMenu_RscListNBox
		{
			idc = IDC_BIGBOX;
			x = safezoneW / 2 - 72.5 * GRID_W + safezoneX;
			y = safezoneH / 2 - 47.5 * GRID_H + safezoneY;
			w = 70 * GRID_W;
			h = 87.5 * GRID_H;
			columns[] = {0,0.1,0.25};
			colorBackground[]={0,0,0,0.5};
		};
		class ItemsSmallBox: ItemsBigBox
		{
			idc = IDC_SMALLBOX;
			x = safezoneW / 2 + 2.5 * GRID_W + safezoneX;
			y = safezoneH / 2 - 40 * GRID_H + safezoneY;
			h = 80 * GRID_H;
		};
		class Load: grad_logisticMenu_RscProgress
		{
			idc = IDC_LOAD;
			x = safezoneW / 2 + 2.5 * GRID_W + safezoneX;
			y = safezoneH / 2 - 47.5 * GRID_H + safezoneY;
			w = 70 * GRID_W;
			h = 5.5 * GRID_H;
			colorBackground[]={0,0,0,0.5};
		};
		class Amount: grad_logisticMenu_RscCombo
		{
			idc = IDC_AMOUNT;
			x = safezoneW / 2 - 7.5 * GRID_W + safezoneX;
			y = safezoneH / 2 + 42.5 * GRID_H + safezoneY;
			w = 15 * GRID_W;
			h = 5.5 * GRID_H;
		};
		class ButtonLeft: grad_logisticMenu_RscButton
		{
			onButtonClick = "_this call grad_logisticMenu_fnc_onButtonClick_left";
			text = "<";
			x = safezoneW / 2 - 15 * GRID_W + safezoneX;
			y = safezoneH / 2 + 42.5 * GRID_H + safezoneY;
			w = 5.5 * GRID_W;
			h = 5.5 * GRID_H;
			colorBackground[]={0,0,0,0.5};
		};
		class ButtonRight: ButtonLeft
		{
			onButtonClick = "_this call grad_logisticMenu_fnc_onButtonClick_right";
			text = ">";
			x = safezoneW / 2 + 10 * GRID_W + safezoneX;
		};
		class ButtonSpawn: ButtonLeft
		{
			w = 16.5 * GRID_W;
			x = safezoneW / 2 + 56.5 * GRID_W + safezoneX;
			text = "SPAWN";
			onButtonClick = "_this call grad_logisticMenu_fnc_onButtonClick_spawn";
		};
	};
};

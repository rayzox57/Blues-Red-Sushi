REDSUSHI = REDSUSHI or {}
REDSUSHI.CONFIG = {}

--WORKSHOP LINK!!!
--https://steamcommunity.com/sharedfiles/filedetails/?id=1499218503

--[[-------------------------------------------------------------------------
EDIT BELOW HERE
---------------------------------------------------------------------------]]

--This is the number in second a user can claim a machine for. If they are inactive for longer than this period then
--anyone else can take over the machine, while a machine is claimed you cannot switch machines either
REDSUSHI.CONFIG.ClaimTime = 30

--This determins the value of a credit
--For example winning 25 credits would be $125 at a credit value of $5
REDSUSHI.CONFIG.CreditValue = 50

--This means any winnings equal or above this value will play a more dramatic
--"You won" sound when the spin finishes.
REDSUSHI.CONFIG.LargePayoutThreshold = 30

--This is a % out of 100. for example 0.1 would work.
--This value determins the chance that a redscreen is triggered from a win
REDSUSHI.CONFIG.RedscreenChance = 5 --%

--This is a % out of 100. for example 0.1 would work.
--This value determins the chance that a redscreen is retriggered from a previous one
REDSUSHI.CONFIG.RedscreenRetriggerChance = 25 --%

--This will trigger a jackpot and stop any minigames the user is playing (such as redscreen)
--and will instead play the jackpot screen for the win.
--This is in credits
--NOTE: The jackpot screen will always play when they user gets the jackpot symbols regardless of this value
--NOTE: The purpous of this is to prevent players from winning much higher than the amount shown here as to not break your economy on huge jackpots
--NOTE: This does not limit the money they win, all this means is if they win more than this after a few spins then it will play the jackpot screen and end the redscreen minigame
REDSUSHI.CONFIG.SubJackpotValue = 10000
 
--Any ranks in here will be allowed to edit the machines and save them using
--!saveslots
REDSUSHI.CONFIG.AuthorisedRanks = {
	"owner",
	"superadmin"
	--"user",
	--"noaccess"yy
}

--This is the paytable rates, remember this is based on 1 credit bet,
--these are multiplied by 2 or 3 depending on bet
REDSUSHI.CONFIG.Payouts = {
	THREE_JACKPOTS = 1000, 
	THREE_SEVENS = 50, 
	THREE_BARBARBAR = 40,
	THREE_BARBAR = 25,
	THREE_BAR = 20,
	THREE_CHERRY = 20,
	ANY_THREE_BAR = 20,
	ANY_TWO_CHERRIES = 5
}

--You can change money Method
	--DRP = DarkRP Money System
	--PS1 = PointShop1 Money
	--PS2 = PointShop2 Money
	--PPS2 = Premium PointShop2 Money
	--CSM = Custom Money System (Use all override functions in bottom of this file)
	--FREE = No Money (Just for fun)

	REDSUSHI.CONFIG.Curreny = "PS2"

	--You can change this to anything, or thing. This gets added before any money amount is shown
	REDSUSHI.CONFIG.CurrenyPrefixBefore = ""
	REDSUSHI.CONFIG.CurrenyPrefixAfter = "PTS"

--Don't remove this line
if SERVER then
	--These are the chances for the machine. The way how you calculate chance for each symbol
	--is by doing thatSymbolsChance / totalOfAllSymbolChances
	--You should tweak these to match your servers economy best (Winning too much will break your economy)
	REDSUSHI.CONFIG.DefaultChances = {
		[REDSUSHI.Symbols.JACKPOT] = 1, 
		[REDSUSHI.Symbols.CHERRY] = 120,
		[REDSUSHI.Symbols.SEVEN] = 40,
		[REDSUSHI.Symbols.BAR] = 100,
		[REDSUSHI.Symbols.BARBAR] = 70,
		[REDSUSHI.Symbols.BARBARBAR] = 40,
		[REDSUSHI.Symbols.VOID] = 140 --This is nothing (lands inbetween the symbols)
	}
end

--[[-------------------------------------------------------------------------
ADVANCED USERS ONLY
---------------------------------------------------------------------------]]
if SERVER then
--A list of winning combinations, remember that these are checked in order and only 1 win can be possible at a time
--so prioritize higher wins at the top
local Symbols = REDSUSHI.Symbols
REDSUSHI.WinTable = {
	--Jackpot
	[1] = {
		pay = REDSUSHI.CONFIG.Payouts.THREE_JACKPOTS,
		[1] = {Symbols.JACKPOT},
		[2] = {Symbols.JACKPOT},
		[3] = {Symbols.JACKPOT}
	},

	--Sevens
	[2] = {
		pay = REDSUSHI.CONFIG.Payouts.THREE_SEVENS,
		[1] = {Symbols.SEVEN},
		[2] = {Symbols.SEVEN},
		[3] = {Symbols.SEVEN}
	},

	--barbarbar
	[3] = {
		pay = REDSUSHI.CONFIG.Payouts.THREE_BARBARBAR,
		[1] = {Symbols.BARBARBAR},
		[2] = {Symbols.BARBARBAR},
		[3] = {Symbols.BARBARBAR}
	},

	--barbar
	[4] = {
		pay = REDSUSHI.CONFIG.Payouts.THREE_BARBAR,
		[1] = {Symbols.BARBAR},
		[2] = {Symbols.BARBAR},
		[3] = {Symbols.BARBAR}
	},

	--bar
	[5] = {
		pay = REDSUSHI.CONFIG.Payouts.THREE_BAR,
		[1] = {Symbols.BAR},
		[2] = {Symbols.BAR},
		[3] = {Symbols.BAR}
	},

	--cherry
	[6] = {
		pay = REDSUSHI.CONFIG.Payouts.THREE_CHERRY,
		[1] = {Symbols.CHERRY},
		[2] = {Symbols.CHERRY},
		[3] = {Symbols.CHERRY}
	},

	--any 3 bar on a line
	[7] = {
		pay = REDSUSHI.CONFIG.Payouts.ANY_THREE_BAR,
		[1] = {Symbols.BARBARBAR, Symbols.BARBAR, Symbols.BAR},
		[2] = {Symbols.BARBARBAR, Symbols.BARBAR, Symbols.BAR},
		[3] = {Symbols.BARBARBAR, Symbols.BARBAR, Symbols.BAR}
	},

	--any 2 cherry
	[8] = {
		pay = REDSUSHI.CONFIG.Payouts.ANY_TWO_CHERRIES, 
		[1] = {-1},
		[2] = {Symbols.CHERRY},
		[3] = {Symbols.CHERRY}
	},

	--any 2 cherry
	[9] = {
		pay = REDSUSHI.CONFIG.Payouts.ANY_TWO_CHERRIES,
		[1] = {Symbols.CHERRY},
		[2] = {-1},
		[3] = {Symbols.CHERRY}
	},

	--any 2 cherry
	[10] = {
		pay = REDSUSHI.CONFIG.Payouts.ANY_TWO_CHERRIES,
		[1] = {Symbols.CHERRY},
		[2] = {Symbols.CHERRY},
		[3] = {-1}
	}
}
end

--[[-------------------------------------------------------------------------
Custom Money Method
---------------------------------------------------------------------------]]

REDSUSHI.CONFIG.custom = {}

REDSUSHI.CONFIG.custom.addMoney = function(ply, amount)
	
end

REDSUSHI.CONFIG.custom.canAfford = function(ply, amount)
	return true
end

REDSUSHI.CONFIG.custom.takeMoney = function(ply, amount)
	
end

REDSUSHI.CONFIG.custom.getMoney = function(ply)

end

--[[-------------------------------------------------------------------------
Money Method (!! DON'T CHANGE THIS !!)
---------------------------------------------------------------------------]]

REDSUSHI.CONFIG.addMoney = function(ply, amount)
	if CLIENT then return end
	local c = REDSUSHI.CONFIG.Curreny
	if(c == "DRP") then
		ply:addMoney(amount)
	elseif(c == "PS1") then
		ply:PS_GivePoints(amount)
	elseif(c == "PS2") then
		ply:PS2_AddStandardPoints(amount)
	elseif(c == "PPS2") then
		ply:PS2_AddPremiumPoints(amount)
	elseif(c == "CSM") then
		REDSUSHI.CONFIG.custom.addMoney(ply,amount)
	end
end

REDSUSHI.CONFIG.canAfford = function(ply, amount)
	local c = REDSUSHI.CONFIG.Curreny
	if(c == "DRP") then
		return ply:canAfford(amount)
	elseif(c == "PS1") then
		return ply:PS_HasPoints(amount)
	elseif(c == "PS2") then
		return ply.PS2_Wallet.points - amount >= 0
	elseif(c == "PPS2") then
		return ply.PS2_Wallet.premiumPoints - amount >= 0
	elseif(c == "CSM") then
		return REDSUSHI.CONFIG.custom.canAfford(ply,amount)
	end
	return true
end

REDSUSHI.CONFIG.takeMoney = function(ply, amount)
	if CLIENT then return end
	local c = REDSUSHI.CONFIG.Curreny
	if(c == "DRP") then
		ply:addMoney(amount * -1)
	elseif(c == "PS1") then
		ply:PS_TakePoints(amount)
	elseif(c == "PS2") then
		ply:PS2_AddStandardPoints(-amount)
	elseif(c == "PPS2") then
		ply:PS2_AddPremiumPoints(-amount)
	elseif(c == "CSM") then
		REDSUSHI.CONFIG.custom.takeMoney(ply,amount)
	end
end

REDSUSHI.CONFIG.getMoney = function(ply)
	if(c == "DRP") then
		return ply:getDarkRPVar("money")
	elseif(c == "PS1") then
		return ply:PS_GetPoints()
	elseif(c == "PS2") then
		return ply.PS2_Wallet.points
	elseif(c == "PPS2") then
		return ply.PS2_Wallet.premiumPoints
	elseif(c == "CSM") then
		return REDSUSHI.CONFIG.custom.getMoney(ply)
	end
	return 0
end

REDSUSHI.CONFIG.showMoney = function(amount)
	local f = amount
	while true do   
	   	f, k = string.gsub(f, "^(-?%d+)(%d%d%d)", '%1,%2')
	   	if (k==0) then
			break 
		end
	end

	if(REDSUSHI.CONFIG.Curreny == "FREE") then f = "0" end

	return string.format("%s%s%s",REDSUSHI.CONFIG.CurrenyPrefixBefore,f,REDSUSHI.CONFIG.CurrenyPrefixAfter)
end


local DB = {
	{e="applaud", -- 5 - applaud / bravo / applause
		{k="^You applaud.  Bravo!$",v="Вы аплодируете. Браво!"},
		{k="^You applaud at (.+).  Bravo!$",v="Вы рукоплещете %s. Браво!"},
		{k="^(.+) applauds.  Bravo!$",v="%s хлопает в ладоши. Браво!"},
		{k="^(.+) applauds at you.  Bravo!$",v="%s рукоплещет вам. Браво!"},
		{k="^(.+) applauds at (.+).  Bravo!$",v="%s рукоплещет %s. Браво!"}},
	{e="beg", -- 8 - beg
		{k="^You beg everyone around you. How pathetic.$",v="Вы с мольбой смотрите на окружающих. Выглядит жалко."},
		{k="^You beg (.+).  How pathetic.$",v="Вы с мольбой смотрите на %s. Выглядит жалко."},
		{k="^(.+) begs everyone around him.  How pathetic.$",v="%s умоляет всех. Жалкое зрелище!"},
		{k="^(.+) begs you.  How pathetic.$",v="%s с мольбой смотрит на вас. Выглядит жалко."},
		{k="^(.+) begs (.+).  How pathetic.$",v="%s умоляет %s. Ничтожество!"}},
	{e="bow", -- 17 - bow
		{k="^You bow down graciously.$",v="Вы изящно кланяетесь."},
		{k="^You bow before (.+).$",v="Вы кланяетесь %s."},
		{k="^(.+) bows down graciously.$",v="%s изящно кланяется."},
		{k="^(.+) bows before you.$",v="%s кланяется вам."},
		{k="^(.+) bows before (.+).$",v="%s кланяется %s."}},
	{e="flap", -- 22 - chicken / flap / strut
		{k="^With arms flapping, you strut around.  Cluck, Cluck, Chicken!$",v="Хлопая руками, вы расхаживаете вокруг. Цыпа-цыпа-цыпа!"},
		{k="^With arms flapping, you strut around (.+).  Cluck, Cluck, Chicken!$",v="Хлопая руками, вы расхаживаете вокруг %s. Цыпа-цыпа-цыпа!"},
		{k="^With arms flapping, (.+) struts around.  Cluck, Cluck, Chicken!$",v="Хлопая руками, %s расхаживает вокруг. Цыпа-цыпа-цыпа!"},
		{k="^With arms flapping, (.+) struts around you.  Cluck, Cluck, Chicken!$",v="Хлопая руками, %s расхаживает вокруг вас. Цыпа-цыпа-цыпа!"},
		{k="^With arms flapping, (.+) struts around (.+).  Cluck, Cluck, Chicken!$",v="Хлопая руками, %s расхаживает вокруг %s. Цыпа-цыпа-цыпа!"}},
	{e="cr", -- 32 - cry / sob / weep
		{k="^You cry.$",v="Вы плачете."},
		{k="^You cry on (.+)'s shoulder.$",v="Вы рыдаете на плече у %s."},
		{k="^(.+) cries.$",v="%s плачет."},
		{k="^(.+) cries on your shoulder.$",v="%s рыдает у вас на плече."},
		{k="^(.+) cries on (.+)'s shoulder.$",v="%s рыдает на плече %s."}},
	{e="dance", -- 35 - dance
		{k="^You burst into dance.$",v="Вы пускаетесь в пляс."},
		{k="^You dance with (.+).$",v="Вы танцуете с %s."},
		{k="^(.+) bursts into dance.$",v="%s пускается в пляс."},
		{k="^(.+) dances with you.$",v="%s танцует с вами."},
		{k="^(.+) dances with (.+).$",v="%s танцует с %s."}},
	{e="",
		{k="^$",v=""},
		{k="^$",v=""},
		{k="^$",v=""},
		{k="^$",v=""},
		{k="^$",v=""}},
}

local r									-- result - результат поиска
local c = ChatTypeInfo["TEXT_EMOTE"]	-- color - цвет текста эмоций в чате
local f = CreateFrame("Frame")			-- frame
f:RegisterEvent("CHAT_MSG_TEXT_EMOTE")
f:SetScript("OnEvent", function()
	for i = 1, table.getn(DB) do
		if string.find(arg1, DB[i].e) then
			for j = 1, table.getn(DB[i]) do
				r = {string.find(arg1, DB[i][j].k)}
				if r[1] then
					DEFAULT_CHAT_FRAME:AddMessage(string.format(DB[i][j].v, (r[3] or ""), (r[4] or "")), c.r, c.g, c.b)
					return
				end
			end
		end
	end
end)

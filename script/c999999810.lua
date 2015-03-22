--神姬憎物
function c999999810.initial_effect(c)
	--Activate
	local e1=Effect.CreateEffect(c)
	e1:SetCategory(CATEGORY_DRAW)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetProperty(EFFECT_FLAG_PLAYER_TARGET)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetCost(c999999810.cost)
	e1:SetTarget(c999999810.target)
	e1:SetOperation(c999999810.activate)
	c:RegisterEffect(e1)
end
function c999999810.cost(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingMatchingCard(c999999810.filter,tp,LOCATION_HAND,0,2,e:GetHandler()) end
	Duel.DiscardHand(tp,c999999810.filter,2,2,REASON_COST+REASON_DISCARD)
end
function c999999810.filter(c)
	return c:IsSetCard(0x5f49) and c:IsDiscardable() and c:IsType(TYPE_MONSTER)
end
function c999999810.target(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsPlayerCanDraw(tp,3) end
	Duel.SetTargetPlayer(tp)
	Duel.SetTargetParam(3)
	Duel.SetOperationInfo(0,CATEGORY_DRAW,nil,0,tp,3)
end
function c999999810.activate(e,tp,eg,ep,ev,re,r,rp)
	local p,d=Duel.GetChainInfo(0,CHAININFO_TARGET_PLAYER,CHAININFO_TARGET_PARAM)
	Duel.Draw(p,d,REASON_EFFECT)
	local zsg=Duel.GetOperatedGroup()
	local g=zsg:Filter(c999999810.filter1,nil)
	if g:GetCount()>0 then
		Duel.ConfirmCards(1-tp,zsg)
		Duel.SendtoGrave(g,REASON_EFFECT+REASON_DISCARD)
		Duel.ShuffleHand(tp)
	else
		Duel.ConfirmCards(1-tp,zsg)
		Duel.ShuffleHand(tp)
	end
end
function c999999810.filter1(c)
	return c:IsType(TYPE_MONSTER) and c:IsSetCard(0x5f49) and not c:IsPublic()
end

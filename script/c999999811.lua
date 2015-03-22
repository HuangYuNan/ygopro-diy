--ʽ�񼧡�����
function c999999811.initial_effect(c)
	c:EnableReviveLimit()
	--��
	local e1=Effect.CreateEffect(c)
	e1:SetDescription(aux.Stringid(27551,1))
	e1:SetCategory(CATEGORY_TODECK+CATEGORY_TOGRAVE)
	e1:SetType(EFFECT_TYPE_IGNITION)
	e1:SetRange(LOCATION_MZONE)
	e1:SetCost(c999999811.descost)
	e1:SetTarget(c999999811.destg)
	e1:SetOperation(c999999811.desop)
	c:RegisterEffect(e1)
end
function c999999811.descost(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingMatchingCard(Card.IsDiscardable,tp,LOCATION_HAND,0,1,nil) end
	Duel.DiscardHand(tp,Card.IsDiscardable,1,1,REASON_COST+REASON_DISCARD)
end
function c999999811.destg(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return true end
	Duel.SetOperationInfo(0,CATEGORY_TODECK,e:GetHandler(),1,0,0)
end
function c999999811.desop(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	if c:IsRelateToEffect(e) then
		Duel.SendtoDeck(c,nil,2,REASON_EFFECT)
		local g=Duel.GetMatchingGroup(c999999811.filter,tp,LOCATION_DECK,0,nil)
		if g:GetCount()>2 then
			Duel.BreakEffect()
			Duel.Hint(HINT_SELECTMSG,tp,HINTMSG_TOGRAVE)
			local sg=g:Select(tp,3,3,nil)
			Duel.SendtoGrave(sg,REASON_EFFECT)
		end
	end
end
function c999999811.filter(c)
	return c:IsSetCard(0x5f49) and c:IsAbleToGrave() and c:IsType(TYPE_MONSTER)
end
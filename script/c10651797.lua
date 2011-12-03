--ツバメ返し
function c10651797.initial_effect(c)
	--Activate
	local e1=Effect.CreateEffect(c)
	e1:SetCategory(CATEGORY_NEGATE+CATEGORY_DESTROY)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetCode(EVENT_CHAINING)
	e1:SetCondition(c10651797.condition)
	e1:SetTarget(c10651797.target)
	e1:SetOperation(c10651797.activate)
	c:RegisterEffect(e1)
end
function c10651797.condition(e,tp,eg,ep,ev,re,r,rp)
	return Duel.GetChainInfo(ev,CHAININFO_TYPE)==TYPE_MONSTER and re:GetCode()==EVENT_SPSUMMON_SUCCESS and Duel.IsChainInactivatable(ev)
end
function c10651797.target(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return true end
	Duel.SetOperationInfo(0,CATEGORY_NEGATE,eg,1,0,0)
	if eg:GetFirst():IsDestructable() then
		eg:GetFirst():CreateEffectRelation(e)
		Duel.SetOperationInfo(0,CATEGORY_DESTROY,eg,1,0,0)
	end
end
function c10651797.activate(e,tp,eg,ep,ev,re,r,rp)
	Duel.NegateActivation(ev)
	local ec=eg:GetFirst()
	if ec:IsRelateToEffect(e) then
		Duel.Destroy(eg,REASON_EFFECT)
	end
end
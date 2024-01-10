-----------------------------------------------------------------------------------------------------------------------------------------
-- SOCORRO
-----------------------------------------------------------------------------------------------------------------------------------------
RegisterCommand('socorro', function(source)
    local user_id = vRP.getUserId(source)
    local alivePlayer = vRPclient.getHealth(source) >= 400
    local deadPlayer = vRPclient.getHealth(source) <= 101
    local medics = vRP.getUsersByPermission('paramedico.permissao')

    if alivePlayer then
        TriggerClientEvent('Notify', source, 'importante', 'Você está saudavel', 5000)
        return false
    else
        if deadPlayer then
			TriggerClientEvent('progress', source, 5000)
			Wait(5000)
            if #medics == 0 then
                vRPclient.setHealth(source, 400)
                vRP.varyThirst(source, -15)
                vRP.varyHunger(source, -15)
                TriggerClientEvent('Notify', source, 'sucesso', 'Você foi reanimado!', 4000)
                return true
            else
                TriggerClientEvent('Notify', source, 'importante', 'No momento possui medicos na cidade!', 4000)
            end
        end
    end
end)
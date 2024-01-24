-- Dependences
local utils = require("simulador de Batalhas.utils")
local player = require("Simulador de Batalhas.player.player")
local playerActions = require("Simulador de Batalhas.player.actions")
local Dragon = require("Simulador de Batalhas.bossDragon.bossDragon")

--  Modificar UTF-8 no terminal
utils.enableUtf8()

-- Header
utils.printHeader()

-- obter definição do monstro
local boss = Dragon

-- apresentar o monstro 
utils.printCreature(boss)

-- Build actions
playerActions.buil()

-- começar o loop de batalha
while true do

        -- Mostrar Ações para o jogar
        print()
        print("Oque você deseja fazer em seguida?")
        local validPlayerAction = playerActions.getValidActions(player, boss)
        for i, action in pairs(validPlayerAction) do
                print(string.format("%d. %s", i, action.description))
        end
        local chonsenIndex = utils.ask()
        local chosenAction = validPlayerAction[chonsenIndex]
        local isActionValid = chosenAction ~= nil
        print("chonsenIndex" .. chonsenIndex)
        --Simuladr o turno do Jogador

        -- Criatura ficou sem vida
        if boss.health <= 0 then
                break
        end

        --Simular o turno da Creatura
        
        -- JOgador ficou sem vida
        if player.health <= 0 then
                break
        end
end

-- Fim
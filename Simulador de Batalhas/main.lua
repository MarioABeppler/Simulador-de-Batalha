-- Dependences
local utils = require("simulador de Batalhas.utils")
local player = require("Simulador de Batalhas.player.player")
local playerActions = require("Simulador de Batalhas.player.actions")
local Dragon = require("Simulador de Batalhas.bossDragon.bossDragon")
local DragonActions = require("Simulador de Batalhas.bossDragon.actions")

--  Modificar UTF-8 no terminal
utils.enableUtf8()

-- Header
utils.printHeader()

-- obter definição do monstro
local boss = Dragon
local bossActions = DragonActions

-- apresentar o monstro 
utils.printCreature(boss)

-- Build actions
playerActions.buil()
bossActions.buil()

-- começar o loop de batalha
while true do

        -- Mostrar Ações para o jogar
        print()
        print(string.format("Qual sera a proxima ação de %s?", player.name))
        local validPlayerAction = playerActions.getValidActions(player, boss)
        for i, action in pairs(validPlayerAction) do
                print(string.format("%d. %s", i, action.description))
        end
        local chonsenIndex = utils.ask()
        local chosenAction = validPlayerAction[chonsenIndex]
        local isActionValid = chosenAction ~= nil
        print("Ação executada:" .. chonsenIndex)
        print()
        --Simuladr o turno do Jogador
        if isActionValid then
                chosenAction.execute(player, boss)
        else
                print(string.format("Sua escolha é inválida. %s perdeu a vez.", player.name))
        end

        -- Criatura ficou sem vida
        if boss.health <= 0 then
                break
        end

        --Simular o turno da Creatura
        print()
        local validBossActions = bossActions.getValidActions(player, boss)
        local bossAction = validBossActions[math.random(#validBossActions)]
        bossAction.execute(player, boss)

        -- JOgador ficou sem vida
        if player.health <= 0 then
                break
        end
end

-- Fim

-- Processar condições de vitoria e derrota

-- derrota do player
if player.health <= 0 then
        print()
        print("---------------------------------------------------------------------")
        print()
        print("😭")
        print(string.format("%s não foi capaz de vencer %s.", player.name, boss.name))
        print("Quem sabe na próxima vez...")
        print()
    elseif boss.health <= 0 then
        print()
        print("---------------------------------------------------------------------")
        print()
        print("🥳")
        print(string.format("%s prevaleceu e venceu %s.", player.name, boss.name))
        bossActions.drop(player, boss)
        print("Parabéns!!!")
        print()
    end

-- Mostra os status atual do player
utils.printPlayer(player)
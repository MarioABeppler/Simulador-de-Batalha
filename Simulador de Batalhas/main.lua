-- Dependences
local utils = require("simulador de Batalhas.utils")
local player = require("Simulador de Batalhas.definitions.player")
local Dragon = require("Simulador de Batalhas.definitions.bossDragon")

--  Modificar UTF-8 no terminal
utils.enableUtf8()

-- Header
utils.printHeader()

-- obter definição do jogador
print(string.format("A vida do Jogador é %d/%d", player.health, player.maxHealth))
-- obter definição do monstro
local boss = Dragon

-- apresentar o monstro 
utils.printCreature(boss)
-- começar o loop de batalha
while true do

        -- Mostrar Ações para o jogar
        -- Tudo


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
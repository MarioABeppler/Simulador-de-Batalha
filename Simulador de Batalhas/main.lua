-- Dependences
local player = require("Simulador de Batalhas.definitions.player")
local Dragon = require("Simulador de Batalhas.definitions.bossDragon")

--  Modificar UTF-8 no terminal
os.execute("chcp 65001")

-- Header
print([[
=====================================================================
                _
     _         | |
    | | _______| |---------------------------------------------\
    |:-)_______|==[]============================================>
    |_|        | |---------------------------------------------/
               |_|

                -----------------------------------------

                        ⚔ SIMULADOR DE BATALHA ⚔

=====================================================================


                Você empunha sua espada e se prepara para lutar.
                            É hora da batalha!
                            
]])

-- obter definição do jogador
player.health = player.health - 2
print(string.format("A vida do Jogador é %d/%d", player.health, player.maxHealth))
-- obter definição do monstro
local boss = Dragon

-- apresentar o monstro 

-- começar o loop de batalha
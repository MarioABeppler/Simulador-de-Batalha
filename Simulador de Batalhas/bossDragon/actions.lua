local utils = require "Simulador de Batalhas.utils"

local actions = {}

actions.list = {}

---Cria uma lista de ações que é armazenada internamente.
function actions.buil()
    --reset list
    actions.list = {}

    -- Sopro de fogo
    local fireBreathAttack = {
       description = "Sopro de Fogo",
       requirement = nil,
       execute = function(playerData, creatureData)
        --1 definir chance de sucesso
        local successChance = playerData.speed == 0 and 1 or creatureData.speed / playerData.speed
        local success = math.random() <= successChance

        --2 calcular dano
        local rawDamage =  creatureData.attack - math.random() * playerData.defense
        local damage = math.max(1, math.ceil(rawDamage))

        if success then
             -- 3. Aplicar o dano em caso de sucesso
             playerData.health = playerData.health - damage

             -- 4. Apresentar resultado como print
             print(string.format("%s atacou a %s e deu %d pontos de dano", creatureData.name, playerData.name, damage))
             local healthRate = math.floor((playerData.health / playerData.maxHealth) * 10)
             print(string.format("%s: %s", playerData.name, utils.getProgressBar(healthRate)))
        else
            print(string.format("%s tentou atacar mais ficou sem mana.", creatureData.name))
        end
       end
    }

    -- Grito ecoante
    local echoingScreamAttack = {
        description = "Grito ecoante",
        requirement = nil,

        execute = function(playerData, creatureData)
    
            -- calcular dano
            local rawDamage =  creatureData.attack - math.random() * playerData.defense
            local damage = math.max(1, math.ceil(rawDamage * 0.3))
    
            
                 -- Aplicar o dano
                 playerData.health = playerData.health - damage
    
                 -- Apresentar resultado como print
                 print(string.format("%s usou seu Grito ecoante e deu %d pontos de dano", creatureData.name, damage))
                 local healthRate = math.floor((playerData.health / playerData.maxHealth) * 10)
                 print(string.format("%s: %s", playerData.name, utils.getProgressBar(healthRate)))
           end
    }

-- Aguardar
local waitAAction = {
    description = "Aguardar",
    requirement = nil,

    execute = function(playerData, creatureData)

             -- Apresentar resultado como print
             print(string.format("%s não fez nada neste turno pois esta recurando um pouco de mana", creatureData.name))
       end
}

    --papulations list
    actions.list[#actions.list + 1] = fireBreathAttack
    actions.list[#actions.list + 1] = echoingScreamAttack
    actions.list[#actions.list + 1] = waitAAction
end

---Retorna uma lista de ações válidas
---@param playerData table Definição do jogador
---@param creatureData table Definição da criatura
---@return table
function actions.getValidActions(playerData, creatureData)
    local validActions = {}
    for _, action in pairs(actions.list) do
        local requirement = action.requirement
        local isValid = requirement == nil or requirement(playerData, creatureData)
        if isValid then
            validActions[#validActions+1] = action
        end
    end
    return validActions
end

-- Dropando o Item
function actions.drop(playerData, creatureData)
    print(string.format("como prova de sua Vitoria contra %s, %s obteve %s como trofeu", creatureData.name, playerData.name, creatureData.item))

    -- Aumentando a defesa do Player
    playerData.defense = playerData.defense + 3
    print(string.format("A defesa de %s subiu em 3 pontos", playerData.name))
end

return actions
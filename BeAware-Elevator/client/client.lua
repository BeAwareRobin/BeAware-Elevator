ESX = nil
PlayerData = nil

Citizen.CreateThread(function()
        while ESX == nil do
            TriggerEvent("esx:getSharedObject", function(obj) ESX = obj end) 
                Citizen.Wait(100) 
            end
        end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        if ESX ~= nil then 
            PlayerData = ESX.GetPlayerData()
            PlayerJob = PlayerData.job.name
            PlayerGrade = PlayerData.job.grade
        end
    end 
end)

_menuPool = NativeUI.CreatePool()
local ElevatorMenu

CreateThread(function()
    while true do 
        Wait(0)
        _menuPool:ProcessMenus()
		for elevatorName, elevatorFloors in pairs(Config.Elevator) do
            for index, floor in pairs(elevatorFloors) do

                local pedCoords = GetEntityCoords(PlayerPedId())
                local distance = GetDistanceBetweenCoords(pedCoords.x, pedCoords.y, pedCoords.z, floor.coords.x, floor.coords.y, floor.coords.z, true)

                if distance <= Config.MarkerDistance then
                    DrawMarker(floor.marker.type, floor.coords.x, floor.coords.y, floor.coords.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, floor.marker.scale, floor.marker.scale, floor.marker.height, floor.marker.r, floor.marker.g, floor.marker.b, floor.marker.a, false, false, 2, nil, nil, true)
                end

                if distance <= floor.marker.scale / 1.35 then
                    SetTextComponentFormat("STRING")
                    AddTextComponentString(floor.text)
                    DisplayHelpTextFromStringLabel(0, 0, 1, -1)
                    
                    if IsControlJustReleased(1, Config.Key) then
                        showUI(elevatorName, floor.coords.x, floor.coords.y, floor.coords.z)
                    end
                end
            end
        end
    end
end)

function showUI(elevator, vfloorx, vfloory, vfloorz)
    for elevatorName, elevatorFloors in pairs(Config.Elevator) do
        if elevatorName == elevator then

            ElevatorMenu = NativeUI.CreateMenu(elevator,Config.Description)
            _menuPool:Add(ElevatorMenu)

            for index, floor in pairs(elevatorFloors) do
                floorItem = NativeUI.CreateItem(floor.label,floor.description)
                ElevatorMenu:AddItem(floorItem)

                floorItem.Activated = function(sender, index)

                local pedCoords = GetEntityCoords(PlayerPedId())
                local distance = GetDistanceBetweenCoords(pedCoords.x, pedCoords.y, pedCoords.z, vfloorx, vfloory, vfloorz, true)

                    if distance > floor.marker.scale * 1.5 then
                        ElevatorMenu:Visible(false)
                        ShowNotification(Config.TooFarAway)
                    else
                        
                        Auth = Authorization(elevator, floor)
                        if Auth then
                            
                            ElevatorMenu:Visible(false)
                            Teleport(floor.coords.x, floor.coords.y, floor.coords.z, floor.coords.h)
                        else
                            ShowNotification(Config.NoPermission)
                        end

                    end
                end
            end

            
            _menuPool:RefreshIndex()

            ElevatorMenu:Visible(true)

            _menuPool:MouseEdgeEnabled(false)
        end
    end
end

function Teleport(x, y, z, h)
	local player = PlayerPedId()
    if IsPedInAnyVehicle(player, true) then
        if Config.ScreenFade then
            DoScreenFadeOut(800)
            while not IsScreenFadedOut() do
                Wait(10)
            end
        end
        SetEntityCoords(GetVehiclePedIsUsing(player), x, y, z)
        SetEntityHeading(GetVehiclePedIsUsing(player), h)
        Wait(500)
        if Config.ScreenFade then
            DoScreenFadeIn(800)
            while not IsScreenFadedIn() do
                Wait(10)
            end
        end
    else
        if Config.ScreenFade then
            DoScreenFadeOut(800)
            while not IsScreenFadedOut() do
                Wait(10)
            end
        end
        SetEntityCoordsNoOffset(player, x + 0.0, y + 0.0, z + 1.0, 0, 0, 1)
        SetEntityHeading(player, h + 0.0)
        Wait(500)
            if Config.ScreenFade then
                DoScreenFadeIn(800)
                while not IsScreenFadedIn() do
                    Wait(10)
                end
            end
    end
	
end

RegisterCommand("debug", function(source, args, rawCommand)
    DoScreenFadeIn(100)
end, false)

function ShowNotification(text)
	SetNotificationTextEntry('STRING')
    AddTextComponentString(text)
	DrawNotification(false, true)
end

function Authorization(velevator, vfloor)

    local hasJob = false
    local hasItem = false

    for elevatorName, elevatorFloors in pairs(Config.Elevator) do
        if elevatorName == velevator then

            for index, floor in pairs(elevatorFloors) do
                
                if floor == vfloor then
                    if floor.jobs ~= nil then
                        for jobName, gradeLevel in pairs(floor.jobs) do
                            if PlayerJob == jobName and PlayerGrade >= gradeLevel then
                                hasJob = true
                                break
                            end
                        end
                    else
                        hasJob = true
                        break
                    end

                    if floor.items ~= nil then
                        for i = 1, #floor.items, 1 do
                            for k, v in ipairs(PlayerData.inventory) do
                                if v.name == floor.items[i] and v.count > 0 then
                                    hasItem = true
                                    break
                                end
                            end
                        end
                    else
                        hasItem = true
                        break
                    end
                end

            end 
        end
    end

    if hasJob or hasItem then
        return true
    end

end
PSCore.Models = {}

function PSCore.Models.LoadPropDict(model)
    local model

    while not HasModelLoaded(GetHashKey(model)) do
        model = RequestModel(GetHashKey(model))
        Wait(10)
        if model then
            return model
        end
    end
end

Config = {}
Config.PosMenu = {
    vector3(-927.57, -2038.45, 9.40),
    vector3(928.59,-2037.59,30.24)
}

Config.Jobs = {
    Fermier = {
        nameButton = "Fermier", -- label button
        job = 'fermier', -- job db
        waypoint = true, 
        coords = vector2(2012.45, 4994.56)
    },
    Eboueur = {
        nameButton = "Eboueur",
        job = 'garbage',
        waypoint = true,
        coords = vector2(-321.37, -1545.80)
    },
    RSA = {
        nameButton = "Sans Emploi",
        job = 'unemployed',
        waypoint = false
    },
}
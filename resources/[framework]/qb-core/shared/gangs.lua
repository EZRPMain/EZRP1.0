QBShared = QBShared or {}
QBShared.Gangs = {
	['none'] = {
		label = 'No Gang',
		grades = {
            ['0'] = {
                name = 'Unaffiliated'
            },
        },
	},
	['lostmc'] = {
		label = 'The Lost MC',
		grades = {
            ['0'] = {
                name = 'Recruit'
            },
			['1'] = {
                name = 'Enforcer'
            },
			['2'] = {
                name = 'Shot Caller'
            },
			['3'] = {
                name = 'Boss',
				isboss = true
            },
        },
	},
	['ballas'] = {
		label = 'Ballas',
		grades = {
            ['0'] = {
                name = 'Recruit'
            },
			['1'] = {
                name = 'Enforcer'
            },
			['2'] = {
                name = 'Shot Caller'
            },
			['3'] = {
                name = 'Boss',
				isboss = true
            },
        },
	},
	['vagos'] = {
		label = 'Vagos',
		grades = {
            ['0'] = {
                name = 'Recruit'
            },
			['1'] = {
                name = 'Enforcer'
            },
			['2'] = {
                name = 'Shot Caller'
            },
			['3'] = {
                name = 'Boss',
				isboss = true
            },
        },
	},
	['cartel'] = {
		label = 'Cartel',
		grades = {
            ['0'] = {
                name = 'Recruit'
            },
			['1'] = {
                name = 'Enforcer'
            },
			['2'] = {
                name = 'Shot Caller'
            },
			['3'] = {
                name = 'Boss',
				isboss = true
            },
        },
	},
	['families'] = {
		label = 'Families',
		grades = {
            ['0'] = {
                name = 'Recruit'
            },
			['1'] = {
                name = 'Enforcer'
            },
			['2'] = {
                name = 'Shot Caller'
            },
			['3'] = {
                name = 'Boss',
				isboss = true
            },
        },
	},
	['triads'] = {
		label = 'Triads',
		grades = {
            ['0'] = {
                name = 'Recruit'
            },
			['1'] = {
                name = 'Enforcer'
            },
			['2'] = {
                name = 'Shot Caller'
            },
			['3'] = {
                name = 'Boss',
				isboss = true
            },
        },
	},
    ['aztecas'] = {
		label = 'Aztecas',
		grades = {
            ['0'] = {
                name = 'Recruit'
            },
			['1'] = {
                name = 'Enforcer'
            },
			['2'] = {
                name = 'Shot Caller'
            },
			['3'] = {
                name = 'Boss',
				isboss = true
            },
        },
	},
    ['Pegasus'] = {
		label = 'Pegasus',
		grades = {
            ['0'] = {
                name = 'Recruit'
            },
			['1'] = {
                name = 'Enforcer'
            },
			['2'] = {
                name = 'Shot Caller'
            },
			['3'] = {
                name = 'Boss',
				isboss = true
            },
        },
	},
}

exports("GetSharedGangs", function()
    return QBShared.Gangs
end)

exports("GetSharedGang", function(gang)
    if not QBShared.Gangs[gang] then return false end
    return QBShared.Gangs[gang]
end)

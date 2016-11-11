import requests, json, pprint


def get_pokedex_by_move(move, sought_data):
    url = 'http://pokeapi.co/api/v2/move/%s/' % move
    response = requests.get(url)
    data = json.loads(response.text)
    return_data = data[sought_data]
    return return_data['name']


def get_pokedex_by_pokemon(pokemon, sought_data):
    url = 'http://pokeapi.co/api/v2/pokemon/%s/' % pokemon
    response = requests.get(url)
    data = json.loads(response.text)
    return_data = data[sought_data]
    types = []
    for ii in return_data:
        types.append(ii['type']['name'])
    return " ".join(types)


def get_pokedex_by_type(atype, sought_data):
    url = 'http://pokeapi.co/api/v2/type/%s/' % atype
    response = requests.get(url)
    type_data = json.loads(response.text)
    return_data = type_data[sought_data]
    return return_data


def fight(data, sought_data):
    atype, damage_multiplier = data.split()[0], 1.0
    damage_multipliers = {'double_damage_to': 2.0, 'half_damage_to': 0.5, 'no_damage_to': 0}
    damage_relations = get_pokedex_by_type(atype, sought_data)
    for i in range(2, len(data.split())):
        for multiplier in damage_relations:
            if multiplier in damage_multipliers:
                for name in damage_relations[multiplier]:
                    if name['name'] == data.split()[i]:
                        damage_multiplier *= damage_multipliers[multiplier]
                        # print(atype, "does",damage_multipliers[multiplier],"times damage to", name['name'], "types!")
    return damage_multiplier


def main():
    inputs = ["fire -> grass", "fighting -> ice rock", "psychic -> poison dark", "water -> normal", "fire -> rock"]
    bonus = ["fire punch -> bulbasaur", "wrap -> onix", "surf -> dewgong"]
    for data in inputs:
        print(data+":", str(fight(data, 'damage_relations'))+"X damage!")
    for data in bonus:
        hold = []
        for i in range(0, len(data.split()) - 2):hold.append(data.split()[i])
        move = "-".join(hold)
        print(move+" -> "+data.split()[-1]+":", str(fight(get_pokedex_by_move(move, "type")+" -> "+get_pokedex_by_pokemon(data.split()[-1], "types"), 'damage_relations'))+"X damage!")


main()

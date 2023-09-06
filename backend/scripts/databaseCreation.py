import json
import os
import psycopg2 

conn = psycopg2.connect(
    host="localhost",
    database="postgres",
    user="postgres",
    password="Dos sanctos#1"
)

cursor = conn.cursor()

main_games_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
games_relative_path = os.path.join(main_games_dir, 'raw_data', 'games.json')

with open(games_relative_path, 'r') as f:
    try:
        json_data = json.load(f)
    except FileNotFoundError:
        json_data = []
        
        

def teams():
    teams_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    # Constructs the path to teams.json
    teams_relative_path = os.path.join(teams_dir, 'raw_data', 'teams.json')

    with open(teams_relative_path, 'r') as f:
        try:
            data = json.load(f)
        except FileNotFoundError:
            data = []
    # Create the 'teams' table if it doesn't exist
    if not data:
        return #if data does not exist, we don't want to do anything as it may cause an error
    
    create_teams_table_query = '''
        CREATE TABLE IF NOT EXISTS teams (
            id SERIAL PRIMARY KEY,
            name TEXT
        );
    '''
    cursor.execute(create_teams_table_query)


    for team in data:
        existing_query = "SELECT * FROM teams WHERE id = %s"
        cursor.execute(existing_query, (team['id'],))
        exists = cursor.fetchall()
        if exists:
            continue
        else:
            insert_query = "INSERT INTO teams (id, name) VALUES (%s, %s)"
            values = (team['id'], team['name'])
            cursor.execute(insert_query, values)
    
def players():
    players_dir = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
    players_relative_path = os.path.join(players_dir, 'raw_data', 'players.json')

    with open(players_relative_path) as f:
        try:
            data = json.load(f)
        except FileNotFoundError:
            data = []
            
    if not data:
        return #check to avoid further errors when accessing data
    create_table_query = '''
        CREATE TABLE IF NOT EXISTS players (
            player_id SERIAL PRIMARY KEY,
            player_name VARCHAR(226)
        )
    '''
    cursor.execute(create_table_query)
    
    for playerdata in data:
        existing_player_query = "SELECT * FROM players WHERE player_id = %s"
        cursor.execute(existing_player_query, (playerdata['id'],))
        exists = cursor.fetchall()
        
        if exists:
            continue
        else:
            insert_query = "INSERT INTO players (player_id, player_name) VALUES (%s, %s)"
            values = (playerdata['id'], playerdata['name'])
            cursor.execute(insert_query, values)
        

def create_games_table(json_data):
    create_games_table_query = '''
    CREATE TABLE IF NOT EXISTS games (
        id SERIAL PRIMARY KEY,
        date DATE,
        team_id INT REFERENCES teams(id)
    );
'''

    cursor.execute(create_games_table_query)
    if not json_data:
        return 

    for game_data in json_data:
        existing_player_query = "SELECT * FROM games WHERE id = %s and date = %s"
        cursor.execute(existing_player_query, (game_data['id'], game_data['date'],))
        exists = cursor.fetchall()
        
        if exists:
            continue #checks for duplicates
        else:
            if "homeTeam" in game_data:  # Checks if 'homeTeam' exists in the data
                team_id = game_data['homeTeam']['id']
            elif "awayTeam" in game_data:  # Checks if 'awayTeam' exists in the data
                team_id = game_data['awayTeam']['id']
            else:
                team_id = None
            insert_query = "INSERT INTO games (id, date, team_id) VALUES (%s, %s, %s)"
            values = (game_data['id'], game_data['date'], team_id)
            cursor.execute(insert_query, values)
    


def game_player_details(json_data):
    create_game_players_table_query = '''
        CREATE TABLE IF NOT EXISTS game_players (
            id SERIAL PRIMARY KEY,
            team_id INT REFERENCES games(id),
            player_id INT REFERENCES players(player_id),
            is_starter BOOLEAN,
            minutes INT,
            points INT,
            assists INT,
            offensive_rebounds INT,
            defensive_rebounds INT,
            steals INT,
            blocks INT,
            turnovers INT,
            defensive_fouls INT,
            offensive_fouls INT,
            free_throws_made INT,
            free_throws_attempted INT,
            two_pointers_made INT,
            two_pointers_attempted INT,
            three_pointers_made INT,
            three_pointers_attempted INT
        );
    '''
    cursor.execute(create_game_players_table_query)
    for game in json_data:
        team_type = None
        if "homeTeam" in game:  # Checks if 'homeTeam' exists in the data
            team_type = 'homeTeam'
        elif "awayTeam" in game:  # Checks if 'awayTeam' exists in the data
            team_type = 'awayTeam'
        team = game[team_type]
        team_id = game[team_type]['id']
        for player in team['players']:
            existing_player_query = "SELECT * FROM game_players WHERE player_id = %s"
            cursor.execute(existing_player_query, (player['id'],))
            exists = cursor.fetchall()

            if exists:
                continue
            
            insert_query = 'INSERT INTO game_players (team_id, player_id, is_starter, minutes, points, assists\
,offensive_rebounds, defensive_rebounds, steals, blocks, turnovers, defensive_fouls, offensive_fouls,\
free_throws_made, free_throws_attempted, two_pointers_made, two_pointers_attempted,\
three_pointers_made, three_pointers_attempted) VALUES (%s, %s, %s, %s, %s, %s, %s, %s,\
%s, %s, %s, %s, %s, %s, %s, %s, %s, %s, %s)'
            values = (team_id, player['id'], player['isStarter'], player['minutes'], player['points'], player['assists'],
player['offensiveRebounds'], player['defensiveRebounds'], player['steals'], player['blocks'], player['turnovers'],
player['defensiveFouls'], player['offensiveFouls'], player['freeThrowsMade'], player['freeThrowsAttempted'],
player['twoPointersMade'], player['twoPointersAttempted'], player['threePointersMade'], player['threePointersAttempted'])
        
            cursor.execute(insert_query, values)
            
            
def shots_table(json_data):
    create_shots_table_query = '''
        CREATE TABLE IF NOT EXISTS shots (
            id SERIAL PRIMARY KEY,
            game_player_id INT REFERENCES players(player_id),
            is_make BOOLEAN,
            location_x FLOAT,
            location_y FLOAT
        );
    '''
    cursor.execute(create_shots_table_query)
    for game in json_data:  
        team_type = None
        if "homeTeam" in game:  # Checks if 'homeTeam' exists in the data
            team_type = 'homeTeam'
        elif "awayTeam" in game:  # Checks if 'awayTeam' exists in the data
            team_type = 'awayTeam'
        player = game[team_type]['players']
        
        for player_data in player:
            game_player_id = player_data['id']
            
            for shot in player_data['shots']:
                #check for duplicates before inserting
                existing_query = 'SELECT * FROM shots WHERE is_make = %s AND location_x = %s AND location_y = %s'
                cursor.execute(existing_query, (shot['isMake'], shot['locationX'], shot['locationY'],))
                exists = cursor.fetchall()
                
                if exists:
                    continue
                
                insert_query = 'INSERT INTO shots (game_player_id, is_make, location_x, location_y) VALUES(%s, %s, %s, %s)'
                values = (game_player_id, shot['isMake'], shot['locationX'], shot['locationY'],)
                cursor.execute(insert_query, values)




teams()
players()
create_games_table(json_data)
game_player_details(json_data)
shots_table(json_data)

conn.commit()

conn.close()

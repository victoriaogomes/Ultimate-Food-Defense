extends Node2D

#var linex_enemies = [pizza, burguer, soda]
var line1_enemies = [[], [], []]
var line2_enemies = [[], [], []]
var line3_enemies = [[], [], []]
var line4_enemies = [[], [], []]
var line5_enemies = [[], [], []]


func add_enemie(var enemie, var enemie_type, var line):
	print("-> Adicionar inimigo do tipo ", enemie_type, " na linha ", line)
	match(line):
		1:
			match(enemie_type):
				0:
					line1_enemies[0].resize(line1_enemies[0].size()+1)
					line1_enemies[0][line1_enemies[0].size()-1] = enemie
					print("Line 1: pizza")
				1:
					line1_enemies[1].resize(line1_enemies[1].size()+1)
					line1_enemies[1][line1_enemies[1].size()-1] = enemie
					print("Line 1: burguer")
				2:
					line1_enemies[2].resize(line1_enemies[2].size()+1)
					line1_enemies[2][line1_enemies[2].size()-1] = enemie
					print("Line 1: soda")
		2:
			match(enemie_type):
				0:
					line2_enemies[0].resize(line2_enemies[0].size()+1)
					line2_enemies[0][line2_enemies[0].size()-1] = enemie
					print("Line 2: pizza")
				1:
					line2_enemies[1].resize(line2_enemies[1].size()+1)
					line2_enemies[1][line2_enemies[1].size()-1] = enemie
					print("Line 2: burguer")
				2:
					line2_enemies[2].resize(line2_enemies[2].size()+1)
					line2_enemies[2][line2_enemies[2].size()-1] = enemie
					print("Line 2: soda")
		3:
			match(enemie_type):
				0:
					line3_enemies[0].resize(line3_enemies[0].size()+1)
					line3_enemies[0][line3_enemies[0].size()-1] = enemie
					print("Line 3: pizza")
				1:
					line3_enemies[1].resize(line3_enemies[1].size()+1)
					line3_enemies[1][line3_enemies[1].size()-1] = enemie
					print("Line 3: burguer")
				2:
					line3_enemies[2].resize(line3_enemies[2].size()+1)
					line3_enemies[2][line3_enemies[2].size()-1] = enemie
					print("Line 3: soda")
		4:
			match(enemie_type):
				0:
					line4_enemies[0].resize(line4_enemies[0].size()+1)
					line4_enemies[0][line4_enemies[0].size()-1] = enemie
					print("Line 4: pizza")
				1:
					line4_enemies[1].resize(line4_enemies[1].size()+1)
					line4_enemies[1][line4_enemies[1].size()-1] = enemie
					print("Line 4: burguer")
				2:
					line4_enemies[2].resize(line4_enemies[2].size()+1)
					line4_enemies[2][line4_enemies[2].size()-1] = enemie
					print("Line 4: soda")
		5:
			match(enemie_type):
				0:
					line5_enemies[0].resize(line5_enemies[0].size()+1)
					line5_enemies[0][line5_enemies[0].size()-1] = enemie
					print("Line 5: pizza")
				1:
					line5_enemies[1].resize(line5_enemies[1].size()+1)
					line5_enemies[1][line5_enemies[1].size()-1] = enemie
					print("Line 5: burguer")
				2:
					line5_enemies[2].resize(line5_enemies[2].size()+1)
					line5_enemies[2][line5_enemies[2].size()-1] = enemie
					print("Line 5: soda")
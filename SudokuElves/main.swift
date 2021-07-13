//
//  main.swift
//  SudokuElves
//
//  Created by Cubik65536 on 2021-07-13.
//

import Foundation

let beginner = DifficultyModes(difficulty: .beginner, numOfBlankCells: .beginnerNumOfBlankCells, difficultyString: "Beginner")
let medium = DifficultyModes(difficulty: .medium, numOfBlankCells: .mediumNumOfBlankCells, difficultyString: "Medium")
let skilled = DifficultyModes(difficulty: .skilled, numOfBlankCells: .skilledNumOfBlankCells, difficultyString: "Skilled")
let expert = DifficultyModes(difficulty: .expert, numOfBlankCells: .expertNumOfBlankCells, difficultyString: "Expert")
let guru = DifficultyModes(difficulty: .guru, numOfBlankCells: .guruNumOfBlankCells, difficultyString: "Guru")

let generatedSudoku = Generator().generate(forDifficulty: beginner)

print("\n=================================================================================\n")
print(generatedSudoku.0)
print("\n=================================================================================\n")
print(generatedSudoku.1)
print("\n=================================================================================\n")


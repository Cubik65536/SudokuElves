//
//  Solver.swift
//  SudokuElves
//
//  Created by Cubik65536 on 2021-07-13.
//

import Foundation

/// 数独猜数器对象
let conjecturer = Conjecturer()

/// 数独解题器
class Solver: NSObject {
    var sudokuPlate = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    var sudokuAvailableNumList = [[1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9]]
    
    func solveSudoku(questionSudokuPlate: [Int], needConjecturer: Bool) -> [Int] {
        sudokuPlate = questionSudokuPlate
        var sudokuAvailableNumListBackup = [[1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9]]
        initializeSudokuAvailableNumPlate()
        if sudokuAvailableNumList.contains([]) {
            sudokuPlate[0] = -1
            return sudokuPlate
        }
        var visibleUniqueNumRunTimes = 0
        var invisibleUniqueNumRunTimes = 0
        var sudokuZoneNumCleanerRunTimes = 0
        while true {
            sudokuVisibleUniqueNum()
            sudokuAvailableNumListBackup = sudokuAvailableNumList
            initializeSudokuAvailableNumPlate()
            if sudokuAvailableNumList.contains([]) {
                sudokuPlate[0] = -1
                return sudokuPlate
            }
            if sudokuAvailableNumListBackup == sudokuAvailableNumList {
                sudokuInvisibleUniqueNum()
                if sudokuAvailableNumList.contains([]) {
                    sudokuPlate[0] = -1
                    return sudokuPlate
                }
                if sudokuAvailableNumListBackup != sudokuAvailableNumList {
                    invisibleUniqueNumRunTimes += 1
                    continue
                }
            }
            if sudokuAvailableNumListBackup == sudokuAvailableNumList {
                sudokuZoneNumCleaner()
                if sudokuAvailableNumList.contains([]) {
                    sudokuPlate[0] = -1
                    return sudokuPlate
                }
                if sudokuAvailableNumListBackup != sudokuAvailableNumList {
                    sudokuZoneNumCleanerRunTimes += 1
                    continue
                }
                break
            }
            visibleUniqueNumRunTimes += 1
        }
        var blanckCellNum = 0
        var cellIndex = 0
        while cellIndex < sudokuPlate.count {
            if sudokuPlate[cellIndex] == 0 {
                blanckCellNum += 1
            }
            cellIndex += 1
        }
        sudokuPlate = conjecturer.conjectureSudoku(questionSudokuPlate: sudokuPlate)
        return sudokuPlate
    }
    
    func initializeSudokuAvailableNumPlate() {
        var cellIndex = 0
        while cellIndex < sudokuPlate.count {
            let num = sudokuPlate[cellIndex]
            if num != 0 {
                let rowIndex: Int = cellIndex / 9
                let colIndex: Int = cellIndex % 9
                let zoneRowIndex: Int = rowIndex / 3 * 3
                let zoneColIndex: Int = colIndex / 3 * 3
                clearSudokuAvailableNumRow(row: rowIndex, num: num)
                clearSudokuAvailableNumCol(col: colIndex, num: num)
                clearSudokuAvailableNumZone(zoneRowIndex: zoneRowIndex, zoneColIndex: zoneColIndex, num: num)
                sudokuAvailableNumList[cellIndex] = [num]
            }
            cellIndex += 1
        }
    }
    
    func clearSudokuAvailableNumRow(row: Int, num: Int) {
        var col = 0
        while col < 9 {
            sudokuAvailableNumList[row * 9 + col].removeAll { $0 == num }
            col += 1
        }
    }
    
    func clearSudokuAvailableNumCol(col: Int, num: Int) {
        var row = 0
        while row < 9 {
            sudokuAvailableNumList[row * 9 + col].removeAll { $0 == num }
            row += 1
        }
    }
    
    func clearSudokuAvailableNumZone(zoneRowIndex: Int, zoneColIndex: Int, num: Int) {
        var row = zoneRowIndex
        while row < zoneRowIndex + 3{
            var col = zoneColIndex
            while col < zoneColIndex + 3 {
                sudokuAvailableNumList[row * 9 + col].removeAll { $0 == num }
                col += 1
            }
            row += 1
        }
    }
    
    func sudokuVisibleUniqueNum() {
        var cellIndex = 0
        while cellIndex < sudokuAvailableNumList.count {
            if sudokuAvailableNumList[cellIndex].count == 1 && sudokuPlate[cellIndex] == 0 {
                sudokuPlate[cellIndex] = sudokuAvailableNumList[cellIndex][0]
            }
            cellIndex += 1
        }
    }
    
    func sudokuInvisibleUniqueNum() {
        var row = 0
        while row < 9 {
            sudokuAvailableNumRow(row: row)
            row += 1
        }
        var col = 0
        while col < 9 {
            sudokuAvailableNumCol(col: col)
            col += 1
        }
        sudokuAvailableNumZone(zone: 0)
        sudokuAvailableNumZone(zone: 3)
        sudokuAvailableNumZone(zone: 6)
        sudokuAvailableNumZone(zone: 27)
        sudokuAvailableNumZone(zone: 30)
        sudokuAvailableNumZone(zone: 33)
        sudokuAvailableNumZone(zone: 54)
        sudokuAvailableNumZone(zone: 57)
        sudokuAvailableNumZone(zone: 60)
    }
    
    func sudokuAvailableNumRow(row: Int) {
        var availableNumCount = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        var col = 0
        while col < 9 {
            var index = 0
            while index < sudokuAvailableNumList[row * 9 + col].count {
                let num =  sudokuAvailableNumList[row * 9 + col][index]
                availableNumCount[num - 1] += 1
                index += 1
            }
            col += 1
        }
        var index = 0
        while index < availableNumCount.count {
            if availableNumCount[index] == 1 {
                var col = 0
                while col < 9 {
                    if sudokuAvailableNumList[row * 9 + col].contains(index + 1) {
                        sudokuAvailableNumList[row * 9 + col] = [index + 1]
                    }
                    col += 1
                }
            }
            index += 1
        }
    }
    
    func sudokuAvailableNumCol(col: Int) {
        var availableNumCount = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        var row = 0
        while row < 9 {
            var index = 0
            while index < sudokuAvailableNumList[row * 9 + col].count {
                let num =  sudokuAvailableNumList[row * 9 + col][index]
                availableNumCount[num - 1] += 1
                index += 1
            }
            row += 1
        }
        var index = 0
        while index < availableNumCount.count {
            if availableNumCount[index] == 1 {
                var row = 0
                while row < 9 {
                    if sudokuAvailableNumList[row * 9 + col].contains(index + 1) {
                        sudokuAvailableNumList[row * 9 + col] = [index + 1]
                    }
                    row += 1
                }
            }
            index += 1
        }
    }
    
    func sudokuAvailableNumZone(zone: Int) {
        var availableNumCount = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        var row: Int = zone / 9 / 3 * 3
        let rowLimit = row + 3
        while row < rowLimit {
            var col: Int = zone % 9 / 3 * 3
            let colLimit = col + 3
            while col < colLimit {
                var index = 0
                while index < sudokuAvailableNumList[row * 9 + col].count {
                    let num =  sudokuAvailableNumList[row * 9 + col][index]
                    availableNumCount[num - 1] += 1
                    index += 1
                }
                col += 1
            }
            row += 1
        }
        var index = 0
        while index < availableNumCount.count {
            if availableNumCount[index] == 1 {
                var row: Int = zone / 9 / 3 * 3
                let rowLimit = row + 3
                while row < rowLimit {
                    var col: Int = zone % 9 / 3 * 3
                    let colLimit = col + 3
                    while col < colLimit {
                        if sudokuAvailableNumList[row * 9 + col].contains(index + 1) {
                            sudokuAvailableNumList[row * 9 + col] = [index + 1]
                        }
                        col += 1
                    }
                    row += 1
                }
            }
            index += 1
        }
    }
    
    func sudokuZoneNumCleaner() {
        var row = 0
        while row < 9 {
            sudokuAvailableNumRowCount(row: row)
            row += 1
        }
        var col = 0
        while col < 9 {
            sudokuAvailableNumCol(col: col)
            col += 1
        }
        sudokuAvailableNumZoneCount(zone: 0)
        sudokuAvailableNumZoneCount(zone: 3)
        sudokuAvailableNumZoneCount(zone: 6)
        sudokuAvailableNumZoneCount(zone: 27)
        sudokuAvailableNumZoneCount(zone: 30)
        sudokuAvailableNumZoneCount(zone: 33)
        sudokuAvailableNumZoneCount(zone: 54)
        sudokuAvailableNumZoneCount(zone: 60)
    }
    
    func sudokuAvailableNumRowCount(row: Int) {
        var availableNumCount = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        var col = 0
        while col < 9 {
            var index = 0
            while index < sudokuAvailableNumList[row * 9 + col].count {
                let num =  sudokuAvailableNumList[row * 9 + col][index]
                availableNumCount[num - 1] += 1
                index += 1
            }
            col += 1
        }
        var index = 0
        while index < availableNumCount.count {
            if availableNumCount[index] == 2 {
                var firstCellColIndex = 0
                var secondCellColIndex = 0
                col = 0
                while col < 9 {
                    if sudokuAvailableNumList[row * 9 + col].contains(index + 1) {
                        if firstCellColIndex == 0 {
                            firstCellColIndex = col
                        } else {
                            secondCellColIndex = col
                            let firstZoneIndex: Int = firstCellColIndex / 3
                            let secondZoneIndex: Int = secondCellColIndex / 3
                            if firstZoneIndex == secondZoneIndex {
                                var zoneRowIndex: Int = row / 3 * 3
                                let zoneRowLimit = zoneRowIndex + 3
                                while zoneRowIndex < zoneRowLimit {
                                    var zoneColIndex: Int = col / 3 * 3
                                    let zoneColLimit = zoneColIndex + 3
                                    while zoneColIndex < zoneColLimit {
                                        if zoneRowIndex != row && zoneColIndex != firstCellColIndex && zoneColIndex != secondCellColIndex {
                                            sudokuAvailableNumList[zoneRowIndex * 9 + zoneColIndex].removeAll { $0 == index + 1 }
                                        }
                                        zoneColIndex += 1
                                    }
                                    zoneRowIndex += 1
                                }
                                return
                            }
                        }
                    }
                    col += 1
                }
            } else if availableNumCount[index] == 3 {
                var firstCellColIndex = 0
                var secondCellColIndex = 0
                var thirdCellColIndex = 0
                col = 0
                while col < 9 {
                    if sudokuAvailableNumList[row * 9 + col].contains(index + 1) {
                        if firstCellColIndex == 0 {
                            firstCellColIndex = col
                        } else if secondCellColIndex == 0 {
                            secondCellColIndex = col
                        } else {
                            thirdCellColIndex = col
                            let firstZoneIndex: Int = firstCellColIndex / 3
                            let secondZoneIndex: Int = secondCellColIndex / 3
                            let thirdZoneIndex: Int = thirdCellColIndex / 3
                            if firstZoneIndex == secondZoneIndex && secondZoneIndex == thirdZoneIndex {
                                var zoneRowIndex: Int = row / 3 * 3
                                let zoneRowLimit = zoneRowIndex + 3
                                while zoneRowIndex < zoneRowLimit {
                                    var zoneColIndex: Int = col / 3 * 3
                                    let zoneColLimit = zoneColIndex + 3
                                    while zoneColIndex < zoneColLimit {
                                        if zoneRowIndex != row && zoneColIndex != firstCellColIndex && zoneColIndex != secondCellColIndex && zoneColIndex != thirdCellColIndex  {
                                            sudokuAvailableNumList[zoneRowIndex * 9 + zoneColIndex].removeAll { $0 == index + 1 }
                                        }
                                        zoneColIndex += 1
                                    }
                                    zoneRowIndex += 1
                                }
                                return
                            }
                        }
                    }
                    col += 1
                }
            } else {}
            index += 1
        }
    }
    
    func sudokuAvailableNumColCount(col: Int) {
        var availableNumCount = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        var row = 0
        while row < 9 {
            var index = 0
            while index < sudokuAvailableNumList[row * 9 + col].count {
                let num =  sudokuAvailableNumList[row * 9 + col][index]
                availableNumCount[num - 1] += 1
                index += 1
            }
            row += 1
        }
        var index = 0
        while index < availableNumCount.count {
            if availableNumCount[index] == 2 {
                var firstCellRowIndex = 0
                var secondCellRowIndex = 0
                row = 0
                while row < 9 {
                    if sudokuAvailableNumList[row * 9 + col].contains(index + 1) {
                        if firstCellRowIndex == 0 {
                            firstCellRowIndex = row
                        } else {
                            secondCellRowIndex = row
                            let firstZoneIndex: Int = firstCellRowIndex / 3
                            let secondZoneIndex: Int = secondCellRowIndex / 3
                            if firstZoneIndex == secondZoneIndex {
                                var zoneRowIndex: Int = row / 3 * 3
                                let zoneRowLimit = zoneRowIndex + 3
                                while zoneRowIndex < zoneRowLimit {
                                    var zoneColIndex: Int = col / 3 * 3
                                    let zoneColLimit = zoneColIndex + 3
                                    while zoneColIndex < zoneColLimit {
                                        if zoneColIndex != col && zoneRowIndex != firstCellRowIndex && zoneRowIndex != secondCellRowIndex {
                                            sudokuAvailableNumList[zoneRowIndex * 9 + zoneColIndex].removeAll { $0 == index + 1 }
                                        }
                                        zoneColIndex += 1
                                    }
                                    zoneRowIndex += 1
                                }
                                return
                            }
                        }
                    }
                    row += 1
                }
            } else if availableNumCount[index] == 3 {
                var firstCellRowIndex = 0
                var secondCellRowIndex = 0
                var thirdCellRowIndex = 0
                row = 0
                while row < 9 {
                    if sudokuAvailableNumList[row * 9 + col].contains(index + 1) {
                        if firstCellRowIndex == 0 {
                            firstCellRowIndex = row
                        } else if secondCellRowIndex == 0 {
                            secondCellRowIndex = row
                        } else {
                            thirdCellRowIndex = row
                            let firstZoneIndex: Int = firstCellRowIndex / 3
                            let secondZoneIndex: Int = secondCellRowIndex / 3
                            let thirdZoneIndex: Int = thirdCellRowIndex / 3
                            if firstZoneIndex == secondZoneIndex && secondZoneIndex == thirdZoneIndex {
                                var zoneRowIndex: Int = row / 3 * 3
                                let zoneRowLimit = zoneRowIndex + 3
                                while zoneRowIndex < zoneRowLimit {
                                    var zoneColIndex: Int = col / 3 * 3
                                    let zoneColLimit = zoneColIndex + 3
                                    while zoneColIndex < zoneColLimit {
                                        if zoneColIndex != col && zoneRowIndex != firstCellRowIndex && zoneRowIndex != secondCellRowIndex && zoneRowIndex != thirdCellRowIndex  {
                                            sudokuAvailableNumList[zoneRowIndex * 9 + zoneColIndex].removeAll { $0 == index + 1 }
                                        }
                                        zoneColIndex += 1
                                    }
                                    zoneRowIndex += 1
                                }
                                return
                            }
                        }
                    }
                    row += 1
                }
            } else {}
            index += 1
        }
    }
    
    func sudokuAvailableNumZoneCount(zone: Int) {
        var availableNumCount = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        let cellIndexList = [zone, zone + 1, zone + 2, zone + 9, zone + 10, zone + 11, zone + 18, zone + 19, zone + 20]
        var row: Int = zone / 9 / 3 * 3
        let rowLimit = row + 3
        while row < rowLimit {
            var col: Int = zone % 9 / 3 * 3
            let colLimit = col + 3
            while col < colLimit {
                var index = 0
                while index < sudokuAvailableNumList[row * 9 + col].count {
                    let num =  sudokuAvailableNumList[row * 9 + col][index]
                    availableNumCount[num - 1] += 1
                    index += 1
                }
                col += 1
            }
            row += 1
        }
        var index = 0
        while index < availableNumCount.count {
            if availableNumCount[index] == 2 {
                var firstCellIndex = 0
                var secondCellIndex = 0
                var cellIndex = 0
                while cellIndex < cellIndexList.count {
                    if sudokuAvailableNumList[cellIndexList[cellIndex]].contains(index + 1) {
                        if firstCellIndex == 0 {
                            firstCellIndex = cellIndexList[cellIndex]
                        } else {
                            secondCellIndex = cellIndexList[cellIndex]
                            let firstCellRowIndex: Int = firstCellIndex / 9
                            let firstCellColIndex: Int = firstCellIndex % 9
                            let secondCellRowIndex: Int = secondCellIndex / 9
                            let secondCellColIndex: Int = secondCellIndex % 9
                            if firstCellRowIndex == secondCellRowIndex {
                                var cellColIndex = 0
                                while cellColIndex < 9 {
                                    if cellColIndex != firstCellColIndex && cellColIndex != secondCellColIndex {
                                        sudokuAvailableNumList[firstCellRowIndex * 9 + cellColIndex].removeAll { $0 == index + 1 }
                                    }
                                    cellColIndex += 1
                                }
                            } else if firstCellColIndex == secondCellColIndex {
                                var cellRowIndex = 0
                                while cellRowIndex < 9 {
                                    if cellRowIndex != firstCellRowIndex && cellRowIndex != secondCellRowIndex {
                                        sudokuAvailableNumList[cellRowIndex * 9 + firstCellColIndex].removeAll { $0 == index + 1 }
                                    }
                                    cellRowIndex += 1
                                }
                            } else {}
                        }
                    }
                    cellIndex += 1
                }
            } else if availableNumCount[index] == 3 {
                var firstCellIndex = 0
                var secondCellIndex = 0
                var thirdCellIndex = 0
                var cellIndex = 0
                while cellIndex < cellIndexList.count {
                    if sudokuAvailableNumList[cellIndexList[cellIndex]].contains(index + 1) {
                        if firstCellIndex == 0 {
                            firstCellIndex = cellIndexList[cellIndex]
                        } else if secondCellIndex == 0 {
                            secondCellIndex = cellIndexList[cellIndex]
                        } else {
                            thirdCellIndex = cellIndexList[cellIndex]
                            let firstCellRowIndex: Int = firstCellIndex / 9
                            let firstCellColIndex: Int = firstCellIndex % 9
                            let secondCellRowIndex: Int = secondCellIndex / 9
                            let secondCellColIndex: Int = secondCellIndex % 9
                            let thirdCellRowIndex: Int = thirdCellIndex / 9
                            let thirdCellColIndex: Int = thirdCellIndex % 9
                            if firstCellRowIndex == secondCellRowIndex && firstCellRowIndex == thirdCellRowIndex {
                                var cellColIndex = 0
                                while cellColIndex < 9 {
                                    if cellColIndex != firstCellColIndex && cellColIndex != secondCellColIndex && cellColIndex != thirdCellColIndex {
                                        sudokuAvailableNumList[firstCellRowIndex * 9 + cellColIndex].removeAll { $0 == index + 1 }
                                    }
                                    cellColIndex += 1
                                }
                            }  else if firstCellColIndex == secondCellColIndex && firstCellColIndex == thirdCellColIndex {
                                var cellRowIndex = 0
                                while cellRowIndex < 9 {
                                    if cellRowIndex != firstCellRowIndex && cellRowIndex != secondCellRowIndex && cellRowIndex != thirdCellRowIndex {
                                        sudokuAvailableNumList[cellRowIndex * 9 + firstCellColIndex].removeAll { $0 == index + 1 }
                                    }
                                    cellRowIndex += 1
                                }
                            } else {}
                        }
                    }
                    cellIndex += 1
                }
            } else {}
            index += 1
        }
    }
}

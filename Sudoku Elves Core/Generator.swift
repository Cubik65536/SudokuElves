//
//  Generator.swift
//  SudokuElves
//
//  Created by Cubik65536 on 2021-07-13.
//

import Foundation

/// 数独难度
struct DifficultyModes {
    
    /// 难度
    enum Difficulty: Int{
        case beginner = 1
        case medium = 2
        case skilled = 3
        case expert = 4
        case competition = 5
        case customized = 6
    }
    let difficulty: Difficulty
    
    
    /// 难度所对应的空白格格数
    enum NumOfBlankCells: Int {
        case beginnerNumOfBlankCells = 24
        case mediumNumOfBlankCells = 32
        case skilledNumOfBlankCells = 40
        case expertNumOfBlankCells = 48
        case competitionNumOfBlankCells = 64
        case customizedNumOfBlankCells = 91
    }
    let numOfBlankCells: NumOfBlankCells
    
    /// 难度名称
    let difficultyString: String
}


/// 数独生成器
class Generator: NSObject {
    
    /// 生成的数独
    var originalSudokuPlate = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    /// 可用候选数
    var sudokuAvailableNumList = [[1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9], [1, 2, 3, 4, 5, 6, 7, 8, 9]]
    
    /// 创建数独解题器对象
    let solver = Solver()
    
    /// 生成数独
    /// - Parameter difficulty: 难度
    /// - Returns: 数组，第一个元素为生成的数独，第二个元素为带有空白格的数独
    func generate(forDifficulty difficulty: DifficultyModes) -> ([Int], [Int]) {
        // 左上角3x3内随机填数
        sudokuAvailableZones(firstCellIndex: 0)
        // 正中央3x3内随机填数
        sudokuAvailableZones(firstCellIndex: 30)
        // 右下角3x3内随机填数
        sudokuAvailableZones(firstCellIndex: 60)
        // 使用解题器填满整个数独
        originalSudokuPlate = solver.solveSudoku(questionSudokuPlate: originalSudokuPlate, needConjecturer: true)
        // 返回生成的数独
        return (originalSudokuPlate, makeBlanckCells(forDifficulty: difficulty))
    }
    
    
    /// 生成空白格
    /// - Parameter difficulty: 难度
    /// - Returns: 带有空白格的数独
    func makeBlanckCells(forDifficulty difficulty: DifficultyModes) -> [Int] {
        /// 可以变成空白格的格子下标
        var sudokuPlateCellIndex = [Int] ()
        // 带有空白格的数独
        var sudokuPlate = originalSudokuPlate
        // 将可以变成空白格的格子下标遍历并存储
        var sudokuCellIndex: Int = 0
        while sudokuCellIndex < sudokuPlate.count {
            sudokuPlateCellIndex.append(sudokuCellIndex)
            sudokuCellIndex += 1
        }
        // 获得难度所对应的空白格数量
        let blanckCellsNum = difficulty.numOfBlankCells.rawValue
        // 已经变成空白格的格子数量
        var times = 0
        while times < blanckCellsNum {
            // 随机取出下标
            let cellIndex: Int = sudokuPlateCellIndex.randomElement()!
            // 设置为空白格
            sudokuPlate[cellIndex] = 0
            // 移除该下标
            if let index = sudokuPlateCellIndex.firstIndex(of: cellIndex) {
                sudokuPlateCellIndex.remove(at: index)
            }
            // 增加格子数量
            times += 1
        }
        // 返回带有空白格的数独
        return sudokuPlate
    }
    
    
    /// 随机向给出3x3填写数字
    /// - Parameter firstCellIndex: 该3x3左上角的格子的角标
    func sudokuAvailableZones(firstCellIndex: Int) {
        // 当前行
        var zoneRowIndex: Int = firstCellIndex / 9 / 3 * 3
        // 最高行
        let rowLimit = zoneRowIndex + 3
        // 随机填数
        // 遍历行
        while zoneRowIndex < rowLimit {
            // 当前列
            var zoneColIndex: Int = firstCellIndex % 9 / 3 * 3
            // 最高列
            let colLimit = zoneColIndex + 3
            // 遍历列
            while zoneColIndex < colLimit {
                // 从候选数数组内随机取数
                let num: Int = sudokuAvailableNumList[zoneRowIndex * 9 + zoneColIndex].randomElement()!
                // 将该候选数填入数独
                originalSudokuPlate[zoneRowIndex * 9 + zoneColIndex] = num
                // 将该候选数从本区域内的候选书内去除
                clearSudokuAvailableNum(cellIndex: zoneRowIndex * 9 + zoneColIndex, num: num)
                zoneColIndex += 1
            }
            zoneRowIndex += 1
        }
    }
    
    
    /// 清除候选数
    /// - Parameters:
    ///   - cellIndex: 数独格子下标
    ///   - num: 需要去除的候选数
    func clearSudokuAvailableNum(cellIndex: Int, num: Int) {
        // 计算当前行与列
        let row = cellIndex / 9
        let col = cellIndex % 9
        // 去除行
        clearSudokuAvailableNumRow(row: row, num: num)
        // 去除列
        clearSudokuAvailableNumCol(col: col, num: num)
        // 去除3x3
        clearSudokuAvailableNumZone(zoneRowIndex: row / 3 * 3, zoneColIndex: col / 3 * 3, num: num)
    }
    
    
    /// 去除行候选数
    /// - Parameters:
    ///   - row: 需要去除的行
    ///   - num: 需要去除的候选数
    func clearSudokuAvailableNumRow(row: Int, num: Int) {
        var col = 0
        while col < 9 {
            sudokuAvailableNumList[row * 9 + col].removeAll { $0 == num }
            col += 1
        }
    }
    
    
    /// 去除列候选数
    /// - Parameters:
    ///   - col: 需要去除的列
    ///   - num: 需要去除的候选数
    func clearSudokuAvailableNumCol(col: Int, num: Int) {
        var row = 0
        while row < 9 {
            sudokuAvailableNumList[row * 9 + col].removeAll { $0 == num }
            row += 1
        }
    }
    
    
    /// 去除3x3候选数
    /// - Parameters:
    ///   - zoneRowIndex: 需要去除的3x3的左上角格子的行
    ///   - zoneColIndex: 需要去除的3x3的左上角格子的列
    ///   - num: 需要去除的候选数
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
}

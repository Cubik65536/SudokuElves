//
//  ContentView.swift
//  Sudoku Elves +
//
//  Created by Cubik65536 on 2021-07-13.
//

import SwiftUI

struct SudokuCell: View {
    @State var index: Int
    
    @ObservedObject var stopWatchManager: StopWatchManager
    @Binding var customize: Bool
    @Binding var selectedCell: Int
    
    @Binding var num: String
    
    @Binding var fontSize: Float
    
    @Binding var numColor: Color
    
    @Binding var backgroundColor: Color
    
    var body: some View {
        GeometryReader { geometry in
            Text(num)
                .font(.custom("Avenir", size: CGFloat(fontSize)))
                .frame(width: CGFloat(geometry.size.width), height: CGFloat(geometry.size.height), alignment: .center)
                .foregroundColor(numColor)
                .border(Color.blue, width: 1)
                .background(backgroundColor)
                .onTapGesture(count: 1, perform: {
                    if stopWatchManager.mode == .running || (customize && stopWatchManager.mode == .stopped) {
                        selectedCell = index;
                    }
                })
        }
    }
}


struct SudokuCellRow: View {
    @State var row: Int
    
    @ObservedObject var stopWatchManager: StopWatchManager
    @Binding var customize: Bool
    @Binding var selectedCell: Int
    
    @Binding var num: [String]
    
    @Binding var fontSize: [Float]
    
    @Binding var numColor: [Color]
    
    @Binding var backgroundColor: [Color]
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0.5) {
                SudokuCell(index: row * 9 + 0, stopWatchManager: stopWatchManager, customize: $customize, selectedCell: $selectedCell, num: $num[0], fontSize: $fontSize[0], numColor: $numColor[0], backgroundColor: $backgroundColor[0]).frame(width: geometry.size.height, height: geometry.size.height)
                SudokuCell(index: row * 9 + 1, stopWatchManager: stopWatchManager, customize: $customize, selectedCell: $selectedCell, num: $num[1], fontSize: $fontSize[1], numColor: $numColor[1], backgroundColor: $backgroundColor[1]).frame(width: geometry.size.height, height: geometry.size.height)
                SudokuCell(index: row * 9 + 2, stopWatchManager: stopWatchManager, customize: $customize, selectedCell: $selectedCell, num: $num[2], fontSize: $fontSize[2], numColor: $numColor[2], backgroundColor: $backgroundColor[2]).frame(width: geometry.size.height, height: geometry.size.height)
                SudokuCell(index: row * 9 + 3, stopWatchManager: stopWatchManager, customize: $customize, selectedCell: $selectedCell, num: $num[3], fontSize: $fontSize[3], numColor: $numColor[3], backgroundColor: $backgroundColor[3]).frame(width: geometry.size.height, height: geometry.size.height)
                SudokuCell(index: row * 9 + 4, stopWatchManager: stopWatchManager, customize: $customize, selectedCell: $selectedCell, num: $num[4], fontSize: $fontSize[4], numColor: $numColor[4], backgroundColor: $backgroundColor[4]).frame(width: geometry.size.height, height: geometry.size.height)
                SudokuCell(index: row * 9 + 5, stopWatchManager: stopWatchManager, customize: $customize, selectedCell: $selectedCell, num: $num[5], fontSize: $fontSize[5], numColor: $numColor[5], backgroundColor: $backgroundColor[5]).frame(width: geometry.size.height, height: geometry.size.height)
                SudokuCell(index: row * 9 + 6, stopWatchManager: stopWatchManager, customize: $customize, selectedCell: $selectedCell, num: $num[6], fontSize: $fontSize[6], numColor: $numColor[6], backgroundColor: $backgroundColor[6]).frame(width: geometry.size.height, height: geometry.size.height)
                SudokuCell(index: row * 9 + 7, stopWatchManager: stopWatchManager, customize: $customize, selectedCell: $selectedCell, num: $num[7], fontSize: $fontSize[7], numColor: $numColor[7], backgroundColor: $backgroundColor[7]).frame(width: geometry.size.height, height: geometry.size.height)
                SudokuCell(index: row * 9 + 8, stopWatchManager: stopWatchManager, customize: $customize, selectedCell: $selectedCell, num: $num[8], fontSize: $fontSize[8], numColor: $numColor[8], backgroundColor: $backgroundColor[8]).frame(width: geometry.size.height, height: geometry.size.height)
            }
        }
    }
}

struct SudokuPlate: View {
    @ObservedObject var stopWatchManager: StopWatchManager
    @Binding var customize: Bool
    @Binding var selectedCell: Int
    
    @Binding var num: [[String]]
    
    @Binding var fontSize: [[Float]]
    
    @Binding var numColor: [[Color]]
    
    @State var centerGrayCell: [Color] = [Color(UIColor.systemBackground), Color(UIColor.systemBackground), Color(UIColor.systemBackground), Color.init(Color.RGBColorSpace.displayP3, red: 0.4, green: 0.4, blue: 0.4, opacity: 1), Color.init(Color.RGBColorSpace.displayP3, red: 0.4, green: 0.4, blue: 0.4, opacity: 1), Color.init(Color.RGBColorSpace.displayP3, red: 0.4, green: 0.4, blue: 0.4, opacity: 1), Color(UIColor.systemBackground), Color(UIColor.systemBackground), Color(UIColor.systemBackground)]
    @State var borderGrayCell: [Color] = [Color.init(Color.RGBColorSpace.displayP3, red: 0.4, green: 0.4, blue: 0.4, opacity: 1), Color.init(Color.RGBColorSpace.displayP3, red: 0.4, green: 0.4, blue: 0.4, opacity: 1), Color.init(Color.RGBColorSpace.displayP3, red: 0.4, green: 0.4, blue: 0.4, opacity: 1), Color(UIColor.systemBackground), Color(UIColor.systemBackground), Color(UIColor.systemBackground), Color.init(Color.RGBColorSpace.displayP3, red: 0.4, green: 0.4, blue: 0.4, opacity: 1), Color.init(Color.RGBColorSpace.displayP3, red: 0.4, green: 0.4, blue: 0.4, opacity: 1), Color.init(Color.RGBColorSpace.displayP3, red: 0.4, green: 0.4, blue: 0.4, opacity: 1)]
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0.5) {
                Spacer().frame(height: 28)
                Group {
                    SudokuCellRow(row: 0, stopWatchManager: stopWatchManager, customize: $customize, selectedCell: $selectedCell, num: $num[0], fontSize: $fontSize[0], numColor: $numColor[0], backgroundColor: $centerGrayCell).frame(width: geometry.size.height, height: (geometry.size.height - 4) / 9)
                    SudokuCellRow(row: 1, stopWatchManager: stopWatchManager, customize: $customize, selectedCell: $selectedCell, num: $num[1], fontSize: $fontSize[1], numColor: $numColor[1], backgroundColor: $centerGrayCell).frame(width: geometry.size.height, height: (geometry.size.height - 4) / 9)
                    SudokuCellRow(row: 2, stopWatchManager: stopWatchManager, customize: $customize, selectedCell: $selectedCell, num: $num[2], fontSize: $fontSize[2], numColor: $numColor[2], backgroundColor: $centerGrayCell).frame(width: geometry.size.height, height: (geometry.size.height - 4) / 9)
                    SudokuCellRow(row: 3, stopWatchManager: stopWatchManager, customize: $customize, selectedCell: $selectedCell, num: $num[3], fontSize: $fontSize[3], numColor: $numColor[3], backgroundColor: $borderGrayCell).frame(width: geometry.size.height, height: (geometry.size.height - 4) / 9)
                    SudokuCellRow(row: 4, stopWatchManager: stopWatchManager, customize: $customize, selectedCell: $selectedCell, num: $num[4], fontSize: $fontSize[4], numColor: $numColor[4], backgroundColor: $borderGrayCell).frame(width: geometry.size.height, height: (geometry.size.height - 4) / 9)
                    SudokuCellRow(row: 5, stopWatchManager: stopWatchManager, customize: $customize, selectedCell: $selectedCell, num: $num[5], fontSize: $fontSize[5], numColor: $numColor[5], backgroundColor: $borderGrayCell).frame(width: geometry.size.height, height: (geometry.size.height - 4) / 9)
                    SudokuCellRow(row: 6, stopWatchManager: stopWatchManager, customize: $customize, selectedCell: $selectedCell, num: $num[6], fontSize: $fontSize[6], numColor: $numColor[6], backgroundColor: $centerGrayCell).frame(width: geometry.size.height, height: (geometry.size.height - 4) / 9)
                    SudokuCellRow(row: 7, stopWatchManager: stopWatchManager, customize: $customize, selectedCell: $selectedCell, num: $num[7], fontSize: $fontSize[7], numColor: $numColor[7], backgroundColor: $centerGrayCell).frame(width: geometry.size.height, height: (geometry.size.height - 4) / 9)
                    SudokuCellRow(row: 8, stopWatchManager: stopWatchManager, customize: $customize, selectedCell: $selectedCell, num: $num[8], fontSize: $fontSize[8], numColor: $numColor[8], backgroundColor: $centerGrayCell).frame(width: geometry.size.height, height: (geometry.size.height - 4) / 9)
                }
                Spacer().frame(height: 28)
            }
        }
    }
    
}

struct ContentView: View {
    @ObservedObject var stopWatchManager = StopWatchManager()
    @State var customize = false
    @State var selectedCell = 0
    
    @State var num = [[" ", " ", " ", " ", " ", " ", " ", " ", " "],
    [" ", " ", " ", " ", " ", " ", " ", " ", " "],
    [" ", " ", " ", " ", " ", " ", " ", " ", " "],
    [" ", " ", " ", " ", " ", " ", " ", " ", " "],
    [" ", " ", " ", " ", " ", " ", " ", " ", " "],
    [" ", " ", " ", " ", " ", " ", " ", " ", " "],
    [" ", " ", " ", " ", " ", " ", " ", " ", " "],
    [" ", " ", " ", " ", " ", " ", " ", " ", " "],
    [" ", " ", " ", " ", " ", " ", " ", " ", " "]]
    
    @State var penFontSize: Float = 24
    @State var pencilFontSize: Float = 10
    @State var fontSize: [[Float]] = [[24, 24, 24, 24, 24, 24, 24, 24, 24],
                           [24, 24, 24, 24, 24, 24, 24, 24, 24],
                           [24, 24, 24, 24, 24, 24, 24, 24, 24],
                           [24, 24, 24, 24, 24, 24, 24, 24, 24],
                           [24, 24, 24, 24, 24, 24, 24, 24, 24],
                           [24, 24, 24, 24, 24, 24, 24, 24, 24],
                           [24, 24, 24, 24, 24, 24, 24, 24, 24],
                           [24, 24, 24, 24, 24, 24, 24, 24, 24],
                           [24, 24, 24, 24, 24, 24, 24, 24, 24]]
    
    @State var numColor: [[Color]] = [[Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue],[Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue],[Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue],[Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue],[Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue],[Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue],[Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue],[Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue],[Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue]]
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                Spacer()
                SudokuPlate(stopWatchManager: stopWatchManager, customize: $customize, selectedCell: $selectedCell, num: $num, fontSize: $fontSize, numColor: $numColor).frame(width: geometry.size.width - 56, height: geometry.size.height - 56)
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDevice("iPad mini 4")
                .landscape()
        }
    }
}

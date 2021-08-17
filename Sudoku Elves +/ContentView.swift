//
//  ContentView.swift
//  Sudoku Elves +
//
//  Created by Cubik65536 on 2021-07-13.
//

import SwiftUI

extension View {
    func hasScrollEnabled(_ value: Bool) -> some View {
        self.onAppear {
            UITableView.appearance().isScrollEnabled = value
        }
    }
}

let beginner = DifficultyModes(difficulty: .beginner, numOfBlankCells: .beginnerNumOfBlankCells, difficultyString: LocalizedStringKey("Beginner").toString())
let medium = DifficultyModes(difficulty: .medium, numOfBlankCells: .mediumNumOfBlankCells, difficultyString: LocalizedStringKey("Medium").toString())
let skilled = DifficultyModes(difficulty: .skilled, numOfBlankCells: .skilledNumOfBlankCells, difficultyString: LocalizedStringKey("Skilled").toString())
let expert = DifficultyModes(difficulty: .expert, numOfBlankCells: .expertNumOfBlankCells, difficultyString: LocalizedStringKey("Expert").toString())
let competition = DifficultyModes(difficulty: .competition, numOfBlankCells: .competitionNumOfBlankCells, difficultyString: LocalizedStringKey("Competition").toString())
let customized = DifficultyModes(difficulty: .customized, numOfBlankCells: .customizedNumOfBlankCells, difficultyString: LocalizedStringKey("Customize").toString())

struct KeyboardRow: View {
    @State var row: Int
    
    @Binding var clickedNum: Int
    @Binding var numColor: [Color]
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                Button(action: {
                    clickedNum = row * 3 + 1
                }) {
                    Text("\(row * 3 + 1)")
                        .frame(width: geometry.size.height * 0.36, height: geometry.size.height * 0.36)
                        .font(.custom("Avenir", size: 18))
                        .padding()
                        .foregroundColor(numColor[row * 3 + 1])
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(numColor[row * 3 + 1], lineWidth: 2)
                        )
                }.frame(width: geometry.size.height, height: geometry.size.height)
                
                Button(action: {
                    clickedNum = row * 3 + 2
                }) {
                    Text("\(row * 3 + 2)")
                        .frame(width: geometry.size.height * 0.36, height: geometry.size.height * 0.36)
                        .font(.custom("Avenir", size: 18))
                        .padding()
                        .foregroundColor(numColor[row * 3 + 2])
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(numColor[row * 3 + 2], lineWidth: 2)
                        )
                }.frame(width: geometry.size.height, height: geometry.size.height)
                
                Button(action: {
                    clickedNum = row * 3 + 3
                }) {
                    Text("\(row * 3 + 3)")
                        .frame(width: geometry.size.height * 0.36, height: geometry.size.height * 0.36)
                        .font(.custom("Avenir", size: 18))
                        .padding()
                        .foregroundColor(numColor[row * 3 + 3])
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(numColor[row * 3 + 3], lineWidth: 2)
                        )
                }.frame(width: geometry.size.height, height: geometry.size.height)
            }
        }
    }
}

struct FuncKeyRow: View {
    @Binding var pencilColor: Color
    @Binding var clickedNum: Int
    @Binding var numColor: [Color]
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                Button(action: {
                }) {
                    Image(systemName: "pencil")
                        .frame(width: geometry.size.height * 0.36, height: geometry.size.height * 0.36)
                        .font(.system(size: 21))
                        .padding()
                        .foregroundColor(pencilColor)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.gray, lineWidth: 2)
                        )
                }.frame(width: geometry.size.height, height: geometry.size.height)
                
                Button(action: {
                }) {
                    Image(systemName: "lock.open.fill")
                        .frame(width: geometry.size.height * 0.36, height: geometry.size.height * 0.36)
                        .font(.system(size: 21))
                        .padding()
                        .foregroundColor(numColor[0])
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(numColor[0], lineWidth: 2)
                        )
                }.frame(width: geometry.size.height, height: geometry.size.height)
                
                Button(action: {
                    clickedNum = 0
                }) {
                    Image(systemName: "delete.left")
                        .frame(width: geometry.size.height * 0.36, height: geometry.size.height * 0.36)
                        .font(.system(size: 21))
                        .padding()
                        .foregroundColor(numColor[0])
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(numColor[0], lineWidth: 2)
                        )
                }.frame(width: geometry.size.height, height: geometry.size.height)
            }
        }
    }
}

struct TimerModule: View {
    var body: some View {
        GeometryReader { geometry in
            HStack {
                Spacer()
                
                Button(action: {
                }) {
                    Image(systemName: "arrow.uturn.left")
                        .frame(width: geometry.size.height * 0.36, height: geometry.size.height * 0.36)
                        .font(.system(size: 16))
                        .padding()
                        .foregroundColor(Color.gray)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.gray, lineWidth: 2)
                        )
                }.frame(width: geometry.size.height, height: geometry.size.height)
                
                Spacer().frame(width: geometry.size.height, height: geometry.size.height)
                
                Button(action: {
                    
                }) {
                    Image(systemName: "pause")
                        .frame(width: geometry.size.height * 0.36, height: geometry.size.height * 0.36)
                        .font(.system(size: 16))
                        .padding()
                        .foregroundColor(Color.gray)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(Color.gray, lineWidth: 2)
                        )
                }.frame(width: geometry.size.height, height: geometry.size.height)
                
                Spacer()
            }
        }
    }
}

struct SudokuCell: View {
    @State var index: Int
    
    @ObservedObject var stopWatchManager: StopWatchManager
    @Binding var customize: Bool
    @Binding var selectedCell: Int
    
    @Binding var num: String
    
    @Binding var fontSize: Float
    
    @Binding var sudokuNumColor: Color
    
    @Binding var backgroundColor: Color
    
    var body: some View {
        GeometryReader { geometry in
            Text(num)
                .font(.custom("Avenir", size: CGFloat(fontSize)))
                .frame(width: CGFloat(geometry.size.width), height: CGFloat(geometry.size.height), alignment: .center)
                .foregroundColor(sudokuNumColor)
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
    
    @Binding var sudokuNumColor: [Color]
    
    @Binding var backgroundColor: [Color]
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0.5) {
                SudokuCell(index: row * 9 + 0, stopWatchManager: stopWatchManager, customize: $customize, selectedCell: $selectedCell, num: $num[0], fontSize: $fontSize[0], sudokuNumColor: $sudokuNumColor[0], backgroundColor: $backgroundColor[0]).frame(width: geometry.size.height, height: geometry.size.height)
                SudokuCell(index: row * 9 + 1, stopWatchManager: stopWatchManager, customize: $customize, selectedCell: $selectedCell, num: $num[1], fontSize: $fontSize[1], sudokuNumColor: $sudokuNumColor[1], backgroundColor: $backgroundColor[1]).frame(width: geometry.size.height, height: geometry.size.height)
                SudokuCell(index: row * 9 + 2, stopWatchManager: stopWatchManager, customize: $customize, selectedCell: $selectedCell, num: $num[2], fontSize: $fontSize[2], sudokuNumColor: $sudokuNumColor[2], backgroundColor: $backgroundColor[2]).frame(width: geometry.size.height, height: geometry.size.height)
                SudokuCell(index: row * 9 + 3, stopWatchManager: stopWatchManager, customize: $customize, selectedCell: $selectedCell, num: $num[3], fontSize: $fontSize[3], sudokuNumColor: $sudokuNumColor[3], backgroundColor: $backgroundColor[3]).frame(width: geometry.size.height, height: geometry.size.height)
                SudokuCell(index: row * 9 + 4, stopWatchManager: stopWatchManager, customize: $customize, selectedCell: $selectedCell, num: $num[4], fontSize: $fontSize[4], sudokuNumColor: $sudokuNumColor[4], backgroundColor: $backgroundColor[4]).frame(width: geometry.size.height, height: geometry.size.height)
                SudokuCell(index: row * 9 + 5, stopWatchManager: stopWatchManager, customize: $customize, selectedCell: $selectedCell, num: $num[5], fontSize: $fontSize[5], sudokuNumColor: $sudokuNumColor[5], backgroundColor: $backgroundColor[5]).frame(width: geometry.size.height, height: geometry.size.height)
                SudokuCell(index: row * 9 + 6, stopWatchManager: stopWatchManager, customize: $customize, selectedCell: $selectedCell, num: $num[6], fontSize: $fontSize[6], sudokuNumColor: $sudokuNumColor[6], backgroundColor: $backgroundColor[6]).frame(width: geometry.size.height, height: geometry.size.height)
                SudokuCell(index: row * 9 + 7, stopWatchManager: stopWatchManager, customize: $customize, selectedCell: $selectedCell, num: $num[7], fontSize: $fontSize[7], sudokuNumColor: $sudokuNumColor[7], backgroundColor: $backgroundColor[7]).frame(width: geometry.size.height, height: geometry.size.height)
                SudokuCell(index: row * 9 + 8, stopWatchManager: stopWatchManager, customize: $customize, selectedCell: $selectedCell, num: $num[8], fontSize: $fontSize[8], sudokuNumColor: $sudokuNumColor[8], backgroundColor: $backgroundColor[8]).frame(width: geometry.size.height, height: geometry.size.height)
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
    
    @Binding var sudokuNumColor: [[Color]]
    
    @State var centerGrayCell: [Color] = [Color(UIColor.systemBackground), Color(UIColor.systemBackground), Color(UIColor.systemBackground), Color.init(Color.RGBColorSpace.displayP3, red: 0.4, green: 0.4, blue: 0.4, opacity: 1), Color.init(Color.RGBColorSpace.displayP3, red: 0.4, green: 0.4, blue: 0.4, opacity: 1), Color.init(Color.RGBColorSpace.displayP3, red: 0.4, green: 0.4, blue: 0.4, opacity: 1), Color(UIColor.systemBackground), Color(UIColor.systemBackground), Color(UIColor.systemBackground)]
    @State var borderGrayCell: [Color] = [Color.init(Color.RGBColorSpace.displayP3, red: 0.4, green: 0.4, blue: 0.4, opacity: 1), Color.init(Color.RGBColorSpace.displayP3, red: 0.4, green: 0.4, blue: 0.4, opacity: 1), Color.init(Color.RGBColorSpace.displayP3, red: 0.4, green: 0.4, blue: 0.4, opacity: 1), Color(UIColor.systemBackground), Color(UIColor.systemBackground), Color(UIColor.systemBackground), Color.init(Color.RGBColorSpace.displayP3, red: 0.4, green: 0.4, blue: 0.4, opacity: 1), Color.init(Color.RGBColorSpace.displayP3, red: 0.4, green: 0.4, blue: 0.4, opacity: 1), Color.init(Color.RGBColorSpace.displayP3, red: 0.4, green: 0.4, blue: 0.4, opacity: 1)]
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0.5) {
                Spacer().frame(height: 28)
                Group {
                    SudokuCellRow(row: 0, stopWatchManager: stopWatchManager, customize: $customize, selectedCell: $selectedCell, num: $num[0], fontSize: $fontSize[0], sudokuNumColor: $sudokuNumColor[0], backgroundColor: $centerGrayCell).frame(width: geometry.size.height, height: (geometry.size.height - 4) / 9)
                    SudokuCellRow(row: 1, stopWatchManager: stopWatchManager, customize: $customize, selectedCell: $selectedCell, num: $num[1], fontSize: $fontSize[1], sudokuNumColor: $sudokuNumColor[1], backgroundColor: $centerGrayCell).frame(width: geometry.size.height, height: (geometry.size.height - 4) / 9)
                    SudokuCellRow(row: 2, stopWatchManager: stopWatchManager, customize: $customize, selectedCell: $selectedCell, num: $num[2], fontSize: $fontSize[2], sudokuNumColor: $sudokuNumColor[2], backgroundColor: $centerGrayCell).frame(width: geometry.size.height, height: (geometry.size.height - 4) / 9)
                    SudokuCellRow(row: 3, stopWatchManager: stopWatchManager, customize: $customize, selectedCell: $selectedCell, num: $num[3], fontSize: $fontSize[3], sudokuNumColor: $sudokuNumColor[3], backgroundColor: $borderGrayCell).frame(width: geometry.size.height, height: (geometry.size.height - 4) / 9)
                    SudokuCellRow(row: 4, stopWatchManager: stopWatchManager, customize: $customize, selectedCell: $selectedCell, num: $num[4], fontSize: $fontSize[4], sudokuNumColor: $sudokuNumColor[4], backgroundColor: $borderGrayCell).frame(width: geometry.size.height, height: (geometry.size.height - 4) / 9)
                    SudokuCellRow(row: 5, stopWatchManager: stopWatchManager, customize: $customize, selectedCell: $selectedCell, num: $num[5], fontSize: $fontSize[5], sudokuNumColor: $sudokuNumColor[5], backgroundColor: $borderGrayCell).frame(width: geometry.size.height, height: (geometry.size.height - 4) / 9)
                    SudokuCellRow(row: 6, stopWatchManager: stopWatchManager, customize: $customize, selectedCell: $selectedCell, num: $num[6], fontSize: $fontSize[6], sudokuNumColor: $sudokuNumColor[6], backgroundColor: $centerGrayCell).frame(width: geometry.size.height, height: (geometry.size.height - 4) / 9)
                    SudokuCellRow(row: 7, stopWatchManager: stopWatchManager, customize: $customize, selectedCell: $selectedCell, num: $num[7], fontSize: $fontSize[7], sudokuNumColor: $sudokuNumColor[7], backgroundColor: $centerGrayCell).frame(width: geometry.size.height, height: (geometry.size.height - 4) / 9)
                    SudokuCellRow(row: 8, stopWatchManager: stopWatchManager, customize: $customize, selectedCell: $selectedCell, num: $num[8], fontSize: $fontSize[8], sudokuNumColor: $sudokuNumColor[8], backgroundColor: $centerGrayCell).frame(width: geometry.size.height, height: (geometry.size.height - 4) / 9)
                }
                Spacer().frame(height: 28)
            }
        }
    }
    
}

struct ContentView: View {
    @State var selectedMode: String = "";
    @State var selectedDifficulty: String = "";
    @State var difficlty: DifficultyModes = DifficultyModes(difficulty: .customized, numOfBlankCells: .customizedNumOfBlankCells, difficultyString: LocalizedStringKey("Customize").toString())
    
    @State var numColor = [Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray]
    @State var clickedNum = 0
    @State var pencilColor = Color.gray
    
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
    
    @State var sudokuNumColor: [[Color]] = [[Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue],[Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue],[Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue],[Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue],[Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue],[Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue],[Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue],[Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue],[Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue]]
    
    var body: some View {
        GeometryReader { geometry in
            HStack {
                Spacer().frame(width: 28)
                
                VStack {
                    
                    HStack {
                        Text("00:00:00")
                        Spacer().frame(width: 56)
                        Text("Mistakes: 0/3")
                    }.frame(width: geometry.size.height - 96, height: 24, alignment: .center).padding(EdgeInsets.init(top: -56, leading: 0, bottom: 0, trailing: 0))
                    
                    SudokuPlate(stopWatchManager: stopWatchManager, customize: $customize, selectedCell: $selectedCell, num: $num, fontSize: $fontSize, sudokuNumColor: $sudokuNumColor).frame(width: geometry.size.height - 96, height: geometry.size.height - 96, alignment: .center).padding(EdgeInsets.init(top: -56, leading: 0, bottom: 0, trailing: 0))
                    
                }
                
                VStack(spacing: 8) {
                    
                    /*
                    HStack {
                        Spacer().frame(width: 56)
                        Text("Pro")
                        Spacer()
                        Text("Personnaliser")
                        Spacer().frame(width: 56)
                    }
                    
                    Text("Mistakes: 0/3")
                     */
                    
                    Spacer().frame(height: 24)
                    
                    List {
                        HStack {
                            Menu("Playing Mode") {
                                Button("AI", action: selectNormalMode)
                                Button("Pro", action: selectProMode)
                            }.font(Font.headline.weight(.bold))
                            Spacer()
                            Text("\(selectedMode)")
                        }
                        
                        HStack {
                            Menu("Difficulty") {
                                Button("Beginner", action: selectBeginner)
                                Button("Medium", action: selectMedium)
                                Button("Skilled", action: selectSkilled)
                                Button("Expert", action: selectExpert)
                                Button("Competition", action: selectCompetition)
                                Button("Customize", action: selectCustomize)
                            }.font(Font.headline.weight(.bold))
                            Spacer()
                            Text("\(selectedDifficulty)")
                        }
                        
                        Button(action: {
                            
                        }) {
                            Text("New Game").foregroundColor(Color.blue)
                                .font(Font.headline.weight(.bold))
                        }
                        
                        Button(action: {
                            
                        }) {
                            Text("Continue Game").foregroundColor(Color.blue)
                                .font(Font.headline.weight(.bold))
                        }
                        
                        Button(action: {
                            
                        }) {
                            Text("Restart Current Game").foregroundColor(Color.blue)
                                .font(Font.headline.weight(.bold))
                        }
                    }.frame(height: 320, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    
                    Spacer()
                    
                    Group {
                        KeyboardRow(row: 0, clickedNum: $clickedNum, numColor: $numColor).frame(width: (geometry.size.width - (geometry.size.height - 96)) / 8 * 3, height: (geometry.size.width - (geometry.size.height - 96)) / 8)
                        KeyboardRow(row: 1, clickedNum: $clickedNum, numColor: $numColor).frame(width: (geometry.size.width - (geometry.size.height - 96)) / 8 * 3, height: (geometry.size.width - (geometry.size.height - 96)) / 8)
                        KeyboardRow(row: 2, clickedNum: $clickedNum, numColor: $numColor).frame(width: (geometry.size.width - (geometry.size.height - 96)) / 8 * 3, height: (geometry.size.width - (geometry.size.height - 96)) / 8)
                        FuncKeyRow(pencilColor: $pencilColor, clickedNum: $clickedNum, numColor: $numColor).frame(width: (geometry.size.width - (geometry.size.height - 96)) / 8 * 3, height: (geometry.size.width - (geometry.size.height - 96)) / 8)
                    }
                    
                    Spacer().frame(height: 56)
                    
                }.frame(alignment: .leading)
            }
        }.onAppear {
            load()
        }
    }
    
    func save() {
        UserDefaults.standard.set(selectedMode, forKey: "selectedMode")
        UserDefaults.standard.set(selectedDifficulty, forKey: "selectedDifficulty")
        UserDefaults.standard.set(customize, forKey: "customize")
    }
    
    func load() {
        selectedMode = UserDefaults.standard.string(forKey: "selectedMode") ?? LocalizedStringKey("AI").toString()
        selectedDifficulty = UserDefaults.standard.string(forKey: "selectedDifficulty") ?? LocalizedStringKey("Beginner").toString()
        customize = UserDefaults.standard.bool(forKey: "customize")
        if selectedDifficulty == LocalizedStringKey("Beginner").toString() {
            selectBeginner()
        } else if selectedDifficulty == LocalizedStringKey("Medium").toString() {
            selectMedium()
        } else if selectedDifficulty == LocalizedStringKey("Skilled").toString() {
            selectSkilled()
        } else if selectedDifficulty == LocalizedStringKey("Expert").toString() {
            selectExpert()
        } else if selectedDifficulty == LocalizedStringKey("Competition").toString() {
            selectCompetition()
        } else {
            selectCustomize()
        }
    }
    
    func selectNormalMode() {
        selectedMode = LocalizedStringKey("AI").toString()
        save()
    }
    
    func selectProMode() {
        selectedMode = LocalizedStringKey("Pro").toString()
        save()
    }
    
    func selectBeginner() {
        selectedDifficulty = LocalizedStringKey("Beginner").toString()
        difficlty = beginner
        customize = false
        save()
    }
    
    func selectMedium() {
        selectedDifficulty = LocalizedStringKey("Medium").toString()
        difficlty = medium
        customize = false
        save()
    }
    
    func selectSkilled() {
        selectedDifficulty = LocalizedStringKey("Skilled").toString()
        difficlty = skilled
        customize = false
        save()
    }
    
    func selectExpert() {
        selectedDifficulty = LocalizedStringKey("Expert").toString()
        difficlty = expert
        customize = false
        save()
    }
    
    func selectCompetition() {
        selectedDifficulty = LocalizedStringKey("Competition").toString()
        difficlty = competition
        customize = false
        save()
    }
    
    func selectCustomize() {
        selectedDifficulty = LocalizedStringKey("Customize").toString()
        difficlty = customized
        customize = true
        save()
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

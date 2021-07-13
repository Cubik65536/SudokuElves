//
//  PlayingView.swift
//  Sudoku Elves
//
//  Created by Cubik65536 on 2021-07-13.
//

import SwiftUI

struct SudokuCell: View {
    @State var row: Int
    
    @ObservedObject var stopWatchManager: StopWatchManager
    
    @Binding var customize: Bool
    
    @Binding var selectedCell: Int
    @Binding var sudokuPlate: [String]
    @Binding var sudokuFontSize: [Int]
    @Binding var sudokuPlateColor: [Color]
    @Binding var sudokuNumColor: [Color]
    
    @Binding var grayCell: [Color]
    
    var body: some View {
        GeometryReader { geometry in
            HStack (spacing: 0.5) {
                Spacer()
                Group {
                    Text(sudokuPlate[0])
                        .font(.custom("Avenir", size: CGFloat(sudokuFontSize[0])))
                        .frame(width: (geometry.size.width - 24) / 9, height: (geometry.size.width - 4) / 9, alignment: .center)
                        .foregroundColor(sudokuNumColor[0])
                        .border(sudokuPlateColor[0], width: 1)
                        .background(grayCell[0])
                        .onTapGesture(count: 1, perform: {
                            if stopWatchManager.mode == .running || (customize && stopWatchManager.mode == .stopped) {
                                selectedCell = row * 9 + 0;
                            }
                        })
                    Text(sudokuPlate[1])
                        .font(.custom("Avenir", size: CGFloat(sudokuFontSize[1])))
                        .frame(width: (geometry.size.width - 24) / 9, height: (geometry.size.width - 4) / 9, alignment: .center)
                        .foregroundColor(sudokuNumColor[1])
                        .border(sudokuPlateColor[1], width: 1)
                        .background(grayCell[1])
                        .onTapGesture(count: 1, perform: {
                            if stopWatchManager.mode == .running || (customize && stopWatchManager.mode == .stopped) {
                                selectedCell = row * 9 + 1;
                            }
                        })
                    Text(sudokuPlate[2])
                        .font(.custom("Avenir", size: CGFloat(sudokuFontSize[2])))
                        .frame(width: (geometry.size.width - 24) / 9, height: (geometry.size.width - 4) / 9, alignment: .center)                    .foregroundColor(sudokuNumColor[2])
                        .border(sudokuPlateColor[2], width: 1)
                        .background(grayCell[2])
                        .onTapGesture(count: 1, perform: {
                            if stopWatchManager.mode == .running || (customize && stopWatchManager.mode == .stopped) {
                                selectedCell = row * 9 + 2;
                            }
                        })
                    Text(sudokuPlate[3])
                        .font(.custom("Avenir", size: CGFloat(sudokuFontSize[3])))
                        .frame(width: (geometry.size.width - 24) / 9, height: (geometry.size.width - 4) / 9, alignment: .center)
                        .foregroundColor(sudokuNumColor[3])
                        .border(sudokuPlateColor[3], width: 1)
                        .background(grayCell[3])
                        .onTapGesture(count: 1, perform: {
                            if stopWatchManager.mode == .running || (customize && stopWatchManager.mode == .stopped) {
                                selectedCell = row * 9 + 3;
                            }
                        })
                    Text(sudokuPlate[4])
                        .font(.custom("Avenir", size: CGFloat(sudokuFontSize[4])))
                        .frame(width: (geometry.size.width - 24) / 9, height: (geometry.size.width - 4) / 9, alignment: .center)
                        .foregroundColor(sudokuNumColor[4])
                        .border(sudokuPlateColor[4], width: 1)
                        .background(grayCell[4])
                        .onTapGesture(count: 1, perform: {
                            if stopWatchManager.mode == .running || (customize && stopWatchManager.mode == .stopped) {
                                selectedCell = row * 9 + 4;
                            }
                        })
                    Text(sudokuPlate[5])
                        .font(.custom("Avenir", size: CGFloat(sudokuFontSize[5])))
                        .frame(width: (geometry.size.width - 24) / 9, height: (geometry.size.width - 4) / 9, alignment: .center)
                        .foregroundColor(sudokuNumColor[5])
                        .border(sudokuPlateColor[5], width: 1)
                        .background(grayCell[5])
                        .onTapGesture(count: 1, perform: {
                            if stopWatchManager.mode == .running || (customize && stopWatchManager.mode == .stopped) {
                                selectedCell = row * 9 + 5;
                            }
                        })
                    Text(sudokuPlate[6])
                        .font(.custom("Avenir", size: CGFloat(sudokuFontSize[6])))
                        .frame(width: (geometry.size.width - 24) / 9, height: (geometry.size.width - 4) / 9, alignment: .center)
                        .foregroundColor(sudokuNumColor[6])
                        .border(sudokuPlateColor[6], width: 1)
                        .background(grayCell[6])
                        .onTapGesture(count: 1, perform: {
                            if stopWatchManager.mode == .running || (customize && stopWatchManager.mode == .stopped) {
                                selectedCell = row * 9 + 6;
                            }
                        })
                    Text(sudokuPlate[7])
                        .font(.custom("Avenir", size: CGFloat(sudokuFontSize[7])))
                        .frame(width: (geometry.size.width - 24) / 9, height: (geometry.size.width - 4) / 9, alignment: .center)
                        .foregroundColor(sudokuNumColor[7])
                        .border(sudokuPlateColor[7], width: 1)
                        .background(grayCell[7])
                        .onTapGesture(count: 1, perform: {
                            if stopWatchManager.mode == .running || (customize && stopWatchManager.mode == .stopped) {
                                selectedCell = row * 9 + 7;
                            }
                        })
                    Text(sudokuPlate[8])
                        .font(.custom("Avenir", size: CGFloat(sudokuFontSize[8])))
                        .frame(width: (geometry.size.width - 24) / 9, height: (geometry.size.width - 4) / 9, alignment: .center)
                        .foregroundColor(sudokuNumColor[8])
                        .border(sudokuPlateColor[8], width: 1)
                        .background(grayCell[8])
                        .onTapGesture(count: 1, perform: {
                            if stopWatchManager.mode == .running || (customize && stopWatchManager.mode == .stopped) {
                                selectedCell = row * 9 + 8;
                            }
                        })
                }
                Spacer()
            }
            .padding(.vertical, -3.0)
        }
    }
}

struct KeyboardRow: View {
    @State var row: Int
    
    @Binding var clickedNum: Int
    @Binding var numColor: [Color]
    
    var body: some View {
        HStack {
            Button(action: {
                clickedNum = row * 3 + 1
            }) {
                Text("\(row * 3 + 1)")
                    .frame(width: 9, height: 9)
                    .font(.custom("Avenir", size: 18))
                    .padding()
                    .foregroundColor(numColor[row * 3 + 1])
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(numColor[row * 3 + 1], lineWidth: 2)
                    )
            }
            
            Button(action: {
                clickedNum = row * 3 + 2
            }) {
                Text("\(row * 3 + 2)")
                    .frame(width: 9, height: 9)
                    .font(.custom("Avenir", size: 18))
                    .padding()
                    .foregroundColor(numColor[row * 3 + 2])
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(numColor[row * 3 + 2], lineWidth: 2)
                    )
            }
            
            Button(action: {
                clickedNum = row * 3 + 3
            }) {
                Text("\(row * 3 + 3)")
                    .frame(width: 9, height: 9)
                    .font(.custom("Avenir", size: 18))
                    .padding()
                    .foregroundColor(numColor[row * 3 + 3])
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(numColor[row * 3 + 3], lineWidth: 2)
                    )
            }
        }
        
    }
}

// Playing
struct PlayingView: View {
    @ObservedObject var viewModel: ContentViewModel
    
    @State var continued: Bool
    @State var customize: Bool
    @State var showAds: Bool
    @State var isNavigationBarHidden: Bool = true
    @Environment(\.presentationMode) var presentationMode
    var interstitial = Interstitial()
    
    @State private var saved = false
    @State private var showingAlert = false
    @State private var showingEmptyCellAlert = false
    @State private var showingNoResultAlert = false
    @State private var continuingAlert = false
    @State private var continueAlert = false
    
    @State private var mistakesCount = 0
    
    @ObservedObject var stopWatchManager = StopWatchManager()
    
    @State var difficulty: DifficultyModes
    @State var difficultyString: String = ""
    @State var aidMode = "lock.open.fill"
    @State var aid = true
    @State var playMode = "pause"
    @State var pencil = false
    @State var pencilColor = Color.gray
    
    @State var selectedCell = 0
    @State var clickedNum = 0
    
    @State var sudokuPlate = [[" ", " ", " ", " ", " ", " ", " ", " ", " "],
                              [" ", " ", " ", " ", " ", " ", " ", " ", " "],
                              [" ", " ", " ", " ", " ", " ", " ", " ", " "],
                              [" ", " ", " ", " ", " ", " ", " ", " ", " "],
                              [" ", " ", " ", " ", " ", " ", " ", " ", " "],
                              [" ", " ", " ", " ", " ", " ", " ", " ", " "],
                              [" ", " ", " ", " ", " ", " ", " ", " ", " "],
                              [" ", " ", " ", " ", " ", " ", " ", " ", " "],
                              [" ", " ", " ", " ", " ", " ", " ", " ", " "]]
    
    @State var sudokuNumPlate = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    @State var sudokuResPlate = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    @State var penFontSize = 24
    @State var pencilFontSize = 10
    @State var sudokuFontSize = [[24, 24, 24, 24, 24, 24, 24, 24, 24],
                                 [24, 24, 24, 24, 24, 24, 24, 24, 24],
                                 [24, 24, 24, 24, 24, 24, 24, 24, 24],
                                 [24, 24, 24, 24, 24, 24, 24, 24, 24],
                                 [24, 24, 24, 24, 24, 24, 24, 24, 24],
                                 [24, 24, 24, 24, 24, 24, 24, 24, 24],
                                 [24, 24, 24, 24, 24, 24, 24, 24, 24],
                                 [24, 24, 24, 24, 24, 24, 24, 24, 24],
                                 [24, 24, 24, 24, 24, 24, 24, 24, 24]]
    
    @State var sudokuPlateColor: [[Color]] = [[Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray],[Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray],[Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray],[Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray],[Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray],[Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray],[Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray],[Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray],[Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray]]
    
    @State var sudokuNumColor: [[Color]] = [[Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue],[Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue],[Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue],[Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue],[Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue],[Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue],[Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue],[Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue],[Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue]]
    
    @State var numColor = [Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray]
    
    @State var centerGrayCell: [Color] = [Color(UIColor.systemBackground), Color(UIColor.systemBackground), Color(UIColor.systemBackground), Color.init(Color.RGBColorSpace.displayP3, red: 0.4, green: 0.4, blue: 0.4, opacity: 1), Color.init(Color.RGBColorSpace.displayP3, red: 0.4, green: 0.4, blue: 0.4, opacity: 1), Color.init(Color.RGBColorSpace.displayP3, red: 0.4, green: 0.4, blue: 0.4, opacity: 1), Color(UIColor.systemBackground), Color(UIColor.systemBackground), Color(UIColor.systemBackground)]
    
    @State var borderGrayCell: [Color] = [Color.init(Color.RGBColorSpace.displayP3, red: 0.4, green: 0.4, blue: 0.4, opacity: 1), Color.init(Color.RGBColorSpace.displayP3, red: 0.4, green: 0.4, blue: 0.4, opacity: 1), Color.init(Color.RGBColorSpace.displayP3, red: 0.4, green: 0.4, blue: 0.4, opacity: 1), Color(UIColor.systemBackground), Color(UIColor.systemBackground), Color(UIColor.systemBackground), Color.init(Color.RGBColorSpace.displayP3, red: 0.4, green: 0.4, blue: 0.4, opacity: 1), Color.init(Color.RGBColorSpace.displayP3, red: 0.4, green: 0.4, blue: 0.4, opacity: 1), Color.init(Color.RGBColorSpace.displayP3, red: 0.4, green: 0.4, blue: 0.4, opacity: 1)]
    
    var body: some View {
        Group {
            VStack() {
                
                Spacer().frame(height: 8)
                
                Group {
                    HStack (spacing: 15) {
                        Spacer().frame(width: 15)
                        
                        Button(action: {
                            if UserDefaults.standard.bool(forKey: "Finished") {
                                UserDefaults.standard.set(false, forKey: "Finished")
                                self.stopWatchManager.stop()
                            } else {
                                self.stopWatchManager.pause()
                            }
                            save()
                            self.presentationMode.wrappedValue.dismiss()
                        }) {
                            Image(systemName: "house.circle")
                                .frame(width: 15, height: 15)
                                .font(.custom("Avenir", size: CGFloat(25)))
                        }.alert(isPresented: $continuingAlert) {
                            Alert(
                                title: Text("Do you want to give up the current game?"),
                                primaryButton: .destructive(Text("Yes")) {
                                    newGame()
                                },
                                secondaryButton: .default(Text("No")) {self.presentationMode.wrappedValue.dismiss()}
                            )
                        }
                        
                        Spacer()
                        
                        Text("\(difficultyString)")
                            .font(.custom("Avenir", size: CGFloat(15)))
                        
                        Text("\(LocalizedStringKey("Mistakes: ").toString())\(mistakesCount)/3")
                            //                        Text("\(LocalizedStringKey("Mistakes: ").toString())0/3")
                            .font(.custom("Avenir", size: CGFloat(15)))
                        
                        Spacer()
                        
                        Button(action: {
                            if UserDefaults.standard.bool(forKey: "Finished") {
                                return
                            }
                            save()
                            saved = true
                        }) {
                            Image("Save")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .font(.custom("Avenir", size: CGFloat(25)))
                        }.alert(isPresented: $saved) {
                            Alert(
                                title: Text("Saved"),
                                dismissButton: .default(Text("OK"))
                            )
                        }
                        
                        Spacer().frame(width: 15)
                        
                    }
                    
                    Spacer()
                        .frame(height: 15)
                    
                    GeometryReader { geometry in
                        Group {
                            VStack {
                                Group {
                                    SudokuCell(row: 0, stopWatchManager: stopWatchManager, customize: $customize, selectedCell: $selectedCell, sudokuPlate: $sudokuPlate[0], sudokuFontSize: $sudokuFontSize[0], sudokuPlateColor: $sudokuPlateColor[0], sudokuNumColor: $sudokuNumColor[0], grayCell: $centerGrayCell)
                                    
                                    SudokuCell(row: 1, stopWatchManager: stopWatchManager, customize: $customize, selectedCell: $selectedCell, sudokuPlate: $sudokuPlate[1], sudokuFontSize: $sudokuFontSize[1], sudokuPlateColor: $sudokuPlateColor[1], sudokuNumColor: $sudokuNumColor[1], grayCell: $centerGrayCell)
                                    
                                    SudokuCell(row: 2, stopWatchManager: stopWatchManager, customize: $customize, selectedCell: $selectedCell, sudokuPlate: $sudokuPlate[2], sudokuFontSize: $sudokuFontSize[2], sudokuPlateColor: $sudokuPlateColor[2], sudokuNumColor: $sudokuNumColor[2], grayCell: $centerGrayCell)
                                    
                                    SudokuCell(row: 3, stopWatchManager: stopWatchManager, customize: $customize, selectedCell: $selectedCell, sudokuPlate: $sudokuPlate[3], sudokuFontSize: $sudokuFontSize[3], sudokuPlateColor: $sudokuPlateColor[3], sudokuNumColor: $sudokuNumColor[3], grayCell: $borderGrayCell)
                                    
                                    SudokuCell(row: 4, stopWatchManager: stopWatchManager, customize: $customize, selectedCell: $selectedCell, sudokuPlate: $sudokuPlate[4], sudokuFontSize: $sudokuFontSize[4], sudokuPlateColor: $sudokuPlateColor[4], sudokuNumColor: $sudokuNumColor[4], grayCell: $borderGrayCell)
                                    
                                    SudokuCell(row: 5, stopWatchManager: stopWatchManager, customize: $customize, selectedCell: $selectedCell, sudokuPlate: $sudokuPlate[5], sudokuFontSize: $sudokuFontSize[5], sudokuPlateColor: $sudokuPlateColor[5], sudokuNumColor: $sudokuNumColor[5], grayCell: $borderGrayCell)
                                    
                                    SudokuCell(row: 6, stopWatchManager: stopWatchManager, customize: $customize, selectedCell: $selectedCell, sudokuPlate: $sudokuPlate[6], sudokuFontSize: $sudokuFontSize[6], sudokuPlateColor: $sudokuPlateColor[6], sudokuNumColor: $sudokuNumColor[6], grayCell: $centerGrayCell)
                                    
                                    SudokuCell(row: 7, stopWatchManager: stopWatchManager, customize: $customize, selectedCell: $selectedCell, sudokuPlate: $sudokuPlate[7], sudokuFontSize: $sudokuFontSize[7], sudokuPlateColor: $sudokuPlateColor[7], sudokuNumColor: $sudokuNumColor[7], grayCell: $centerGrayCell)
                                    
                                    SudokuCell(row: 8, stopWatchManager: stopWatchManager, customize: $customize, selectedCell: $selectedCell, sudokuPlate: $sudokuPlate[8], sudokuFontSize: $sudokuFontSize[8], sudokuPlateColor: $sudokuPlateColor[8], sudokuNumColor: $sudokuNumColor[8], grayCell: $centerGrayCell)
                                }.simultaneousGesture(
                                    TapGesture()
                                        .onEnded { _ in
                                            Timer.scheduledTimer(withTimeInterval: 0.001, repeats: false) { timer in
                                                selectCell()
                                            }
                                            
                                        }
                                )
                                
                                Spacer().frame(height: 18)
                                
                                HStack {
                                    VStack {
                                        Group {
                                            KeyboardRow(row: 0, clickedNum: $clickedNum, numColor: $numColor)
                                            KeyboardRow(row: 1, clickedNum: $clickedNum, numColor: $numColor)
                                            KeyboardRow(row: 2, clickedNum: $clickedNum, numColor: $numColor)
                                        }.simultaneousGesture(
                                            TapGesture()
                                                .onEnded { _ in
                                                    Timer.scheduledTimer(withTimeInterval: 0.001, repeats: false) { timer in
                                                        numClicked()
                                                    }
                                                    
                                                }
                                        )
                                        
                                        HStack {
                                            Button(action: {
                                                if stopWatchManager.mode == .paused || stopWatchManager.mode == .stopped {
                                                    return
                                                }
                                                if pencil {
                                                    pencil = false
                                                    pencilColor = Color.gray
                                                    clearAvailableNum()
                                                } else {
                                                    pencil = true
                                                    pencilColor = Color.blue
                                                    showAvailableNum(row: selectedCell / 9, col: selectedCell % 9)
                                                }
                                            }) {
                                                Image(systemName: "pencil")
                                                    .frame(width: 9, height: 9)
                                                    .font(.system(size: 21))
                                                    .padding()
                                                    .foregroundColor(pencilColor)
                                                    .overlay(
                                                        RoundedRectangle(cornerRadius: 12)
                                                            .stroke(Color.gray, lineWidth: 2)
                                                    )
                                            }
                                            
                                            Button(action: {
                                                if customize == true && aidMode == "camera.viewfinder" && stopWatchManager.mode == .stopped {
                                                    UIApplication.shared.windows.filter({$0.isKeyWindow}).first?.rootViewController?.present(viewModel.getDocumentCameraViewController(), animated: true, completion: nil)
                                                    return
                                                }
                                                if aid {
                                                    aid = false
                                                    UserDefaults.standard.set(aid, forKey: "aid")
                                                    aidMode = "lock.fill"
                                                    UserDefaults.standard.set(aidMode, forKey: "aidMode")
                                                    selectCell()
                                                } else {
                                                    save()
                                                    UserDefaults.standard.set(true, forKey: "running")
                                                    print("pause, \(UserDefaults.standard.bool(forKey: "AdsRemoved"))")
                                                    if !UserDefaults.standard.bool(forKey: "AdsRemoved") {
                                                        self.interstitial.showAd()
                                                    }
                                                    aid = true
                                                    UserDefaults.standard.set(aid, forKey: "aid")
                                                    aidMode = "lock.open.fill"
                                                    UserDefaults.standard.set(aidMode, forKey: "aidMode")
                                                    var row = 0
                                                    while row < sudokuPlate.count {
                                                        var col = 0
                                                        while col < sudokuPlate[row].count {
                                                            if sudokuFontSize[row][col] != pencilFontSize && sudokuPlate[row][col] != " " && sudokuPlate[row][col] != "\(sudokuResPlate[row * 9 + col])" {
                                                                sudokuPlateColor[row][col] = Color.red
                                                            }
                                                            col += 1
                                                        }
                                                        row += 1
                                                    }
                                                }
                                            }) {
                                                Image(systemName: aidMode)
                                                    .frame(width: 9, height: 9)
                                                    .font(.system(size: 21))
                                                    .padding()
                                                    .foregroundColor(numColor[0])
                                                    .overlay(
                                                        RoundedRectangle(cornerRadius: 12)
                                                            .stroke(numColor[0], lineWidth: 2)
                                                    )
                                            }.alert(isPresented: $continueAlert) {
                                                Alert(
                                                    title: Text("Do you want to continue this game?"),
                                                    primaryButton: .destructive(Text("Yes")) {
                                                        save()
                                                        UserDefaults.standard.set(true, forKey: "running")
                                                        if !UserDefaults.standard.bool(forKey: "AdsRemoved") {
                                                            self.interstitial.showAd()
                                                        }
                                                    },
                                                    secondaryButton: .default(Text("No")) {
                                                        stopWatchManager.stop()
                                                        UserDefaults.standard.set(false, forKey: "playing")
                                                        self.presentationMode.wrappedValue.dismiss()
                                                    }
                                                )
                                            }
                                            
                                            Button(action: {
                                                clickedNum = 0
                                                numClicked()
                                            }) {
                                                Image(systemName: "delete.left")
                                                    .frame(width: 9, height: 9)
                                                    .font(.system(size: 21))
                                                    .padding()
                                                    .foregroundColor(numColor[0])
                                                    .overlay(
                                                        RoundedRectangle(cornerRadius: 12)
                                                            .stroke(numColor[0], lineWidth: 2)
                                                    )
                                            }
                                            .alert(isPresented: $showingNoResultAlert) {
                                                Alert(
                                                    title: Text("Warning"),
                                                    message: Text("There‘s no solution for sudoku that you've entered, please double-check."),
                                                    dismissButton: .default(Text("OK"))
                                                )
                                            }
                                            
                                        }
                                    }
                                }
                                
                            }
                            .frame(height: geometry.size.width * 1.5, alignment: .center)
                        }
                        
                    }
                }
                
                Spacer()
                
                HStack (spacing: 15) {
                    Button(action: {
                        self.stopWatchManager.stop()
                        if UserDefaults.standard.bool(forKey: "Finished") {
                            UserDefaults.standard.set(false, forKey: "Finished")
                            UserDefaults.standard.set(true, forKey: "playing")
                        }
                        UserDefaults.standard.set(true, forKey: "running")
                        if !UserDefaults.standard.bool(forKey: "AdsRemoved") {
                            self.interstitial.showAd()
                        }
                        print("Replay, customize = \(customize), aidMode = \(aidMode), stopWatchManager.mode = \(stopWatchManager.mode)")
                        if customize == true && aidMode == "camera.viewfinder" && stopWatchManager.mode == .stopped {
                            initialize()
                            customize = true
                            aidMode = "camera.viewfinder"
                            selectCell()
                        } else {
                            initialize()
                            applySudoku()
                            selectCell()
                            self.stopWatchManager.start()
                        }
                    }) {
                        Image(systemName: "arrow.uturn.left")
                            .frame(width: 1, height: 1)
                            .font(.system(size: 16))
                            .padding()
                            .foregroundColor(Color.gray)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.gray, lineWidth: 2)
                            )
                    }
                    .alert(isPresented: $showingAlert) {
                        Alert(
                            title: Text("Congratulations!"),
                            message: Text("You have solved this sudoku puzzle correctly! If you liked our App, please share with your friends!"),
                            dismissButton: .default(Text("OK")) {
                                playMode = "play"
                                self.stopWatchManager.pause()
                                UserDefaults.standard.set(true, forKey: "Finished")
                            }
                        )
                    }
                    
                    Text(stopWatchManager.time)
                        //                    Text("00:00:00")
                        .font(.custom("Avenir", size: 24))
                    
                    Button(action: {
                        if UserDefaults.standard.bool(forKey: "Finished") {
                            return
                        }
                        if customize && stopWatchManager.mode == .stopped {
                            var nonEmptyCellCount = 0
                            var i = 0
                            while i < sudokuPlate.count {
                                nonEmptyCellCount += sudokuPlate[i].filter { $0 != " " }.count
                                i += 1
                            }
                            if nonEmptyCellCount < 17 {
                                showingEmptyCellAlert = true
                                return
                            } else {
                                var row = 0
                                while row < sudokuPlate.count {
                                    var col = 0
                                    while col < sudokuPlate[row].count {
                                        if sudokuPlate[row][col] == " " {
                                            sudokuNumPlate[row * 9 + col] = 0
                                        } else {
                                            sudokuNumPlate[row * 9 + col] = Int(sudokuPlate[row][col]) ?? 0
                                        }
                                        col += 1
                                    }
                                    row += 1
                                }
                                let solver = Solver()
                                sudokuResPlate = solver.solveSudoku(questionSudokuPlate: sudokuNumPlate, needConjecturer: true)
                                if sudokuResPlate[0] == -1 {
                                    sudokuResPlate = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
                                    showingNoResultAlert = true
                                    return
                                }
                                applySudoku()
                                selectedCell = 0
                                selectCell()
                                aidMode = UserDefaults.standard.string(forKey: "aidMode") ?? "lock.open.fill"
                                aid = UserDefaults.standard.bool(forKey: "aid")
                                if aidMode == "lock.open.fill" && aid == false {
                                    aid = true
                                    UserDefaults.standard.set(aid, forKey: "aid")
                                }
                                self.stopWatchManager.start()
                            }
                        } else {
                            if stopWatchManager.mode == .running {
                                playMode = "play"
                                save()
                                UserDefaults.standard.set(true, forKey: "running")
                                UserDefaults.standard.set(true, forKey: "paused")
                                if !UserDefaults.standard.bool(forKey: "AdsRemoved") {
                                    self.interstitial.showAd()
                                }
                                self.stopWatchManager.pause()
                            } else {
                                UserDefaults.standard.set(false, forKey: "paused")
                                playMode = "pause"
                                self.stopWatchManager.start()
                            }
                        }
                    }) {
                        Image(systemName: playMode)
                            .frame(width: 1, height: 1)
                            .font(.system(size: 16))
                            .padding()
                            .foregroundColor(Color.gray)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.gray, lineWidth: 2)
                            )
                    }
                    .alert(isPresented: $showingEmptyCellAlert) {
                        Alert(
                            title: Text("Warning"),
                            message: Text("You have to enter at least 17 numbers in your sudoku to start the game."),
                            dismissButton: .default(Text("OK"))
                        )
                    }
                    
                }
                Spacer().frame(height: 15)
            }.onAppear(perform: {
                print("PlayingView onAppear, UserDefaults.standard.bool(forKey: \"playing\") = \(UserDefaults.standard.bool(forKey: "playing"))")
                if UserDefaults.standard.bool(forKey: "Finished") {
                    UserDefaults.standard.set(false, forKey: "Finished")
                    oldGame()
                } else if UserDefaults.standard.bool(forKey: "playing") && continued {
                    oldGame()
                } else {
                    if UserDefaults.standard.bool(forKey: "playing") && UserDefaults.standard.bool(forKey: "running") {
                        oldGame()
                    } else if UserDefaults.standard.bool(forKey: "playing") && !continued {
                        if UserDefaults.standard.bool(forKey: "startingAds") {
                            UserDefaults.standard.set(false, forKey: "startingAds")
                        } else {
                            continuingAlert = true
                        }
                    } else {
                        newGame()
                    }
                }
                UserDefaults.standard.set(false, forKey: "running")
            })
            
        }
        .navigationBarHidden(self.isNavigationBarHidden)
        .onAppear {
            self.isNavigationBarHidden = true
        }
        .onDisappear {
            save()
        }
        .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification)) { _ in
            save()
        }
        
    }
    
    func oldGame() {
        stopWatchManager.stop()
        load()
        playMode = "play"
        var row = 0
        while row < sudokuPlate.count {
            var col = 0
            while col < sudokuPlate[row].count {
                let num = sudokuNumPlate[row * 9 + col]
                if num != 0 {
                    sudokuPlate[row][col] = "\(num)"
                    sudokuNumColor[row][col] = Color.primary
                }
                col += 1
            }
            row += 1
        }
        selectCell()
        row = 0
        while row < sudokuPlate.count {
            var col = 0
            while col < sudokuPlate[row].count {
                if sudokuPlate[row][col] != " " && sudokuFontSize[row][col] != pencilFontSize && sudokuPlate[row][col] != "\(sudokuResPlate[row * 9 + col])" {
                    sudokuPlateColor[row][col] = Color.red
                }
                col += 1
            }
            row += 1
        }
        if pencil {
            showAvailableNum(row: selectedCell / 9, col: selectedCell % 9)
        }
        difficultyString = UserDefaults.standard.string(forKey: "difficultyString") ?? difficulty.difficultyString
        if !UserDefaults.standard.bool(forKey: "paused") {
            print("oldGame start")
            stopWatchManager.start()
            playMode = "pause"
        }
    }
    
    func newGame() {
        print("newGame")
        initialize()
        if customize {
            aidMode = "camera.viewfinder"
            viewModel.setupVision()
            playMode = "play"
            Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { timer in
                sudokuPlate = viewModel.sudokuPlate
                print("scannedData: \(sudokuPlate)")
            }
        } else {
            generateSudoku()
            applySudoku()
            self.stopWatchManager.start()
        }
        selectCell()
        difficultyString = difficulty.difficultyString
        UserDefaults.standard.set(true, forKey: "playing")
        if showAds && !UserDefaults.standard.bool(forKey: "AdsRemoved") {
            showAds = false
            UserDefaults.standard.set(true, forKey: "startingAds")
            self.interstitial.showAd()
        }
    }
    
    func initialize() {
        print("initialize")
        stopWatchManager.stop()
        mistakesCount = 0
        
        showingAlert = false
        showingNoResultAlert = false
        showingEmptyCellAlert = false
        
        aidMode = UserDefaults.standard.string(forKey: "aidMode") ?? "lock.open.fill"
        aid = UserDefaults.standard.bool(forKey: "aid")
        if aidMode == "lock.open.fill" && aid == false {
            aid = true
            UserDefaults.standard.set(aid, forKey: "aid")
        }
        playMode = "pause"
        pencil = false
        pencilColor = Color.gray
        
        selectedCell = 0
        clickedNum = 0
        
        sudokuPlate = [[" ", " ", " ", " ", " ", " ", " ", " ", " "],
                       [" ", " ", " ", " ", " ", " ", " ", " ", " "],
                       [" ", " ", " ", " ", " ", " ", " ", " ", " "],
                       [" ", " ", " ", " ", " ", " ", " ", " ", " "],
                       [" ", " ", " ", " ", " ", " ", " ", " ", " "],
                       [" ", " ", " ", " ", " ", " ", " ", " ", " "],
                       [" ", " ", " ", " ", " ", " ", " ", " ", " "],
                       [" ", " ", " ", " ", " ", " ", " ", " ", " "],
                       [" ", " ", " ", " ", " ", " ", " ", " ", " "]]
        
        sudokuFontSize = [[penFontSize, penFontSize, penFontSize, penFontSize, penFontSize, penFontSize, penFontSize, penFontSize, penFontSize],
                          [penFontSize, penFontSize, penFontSize, penFontSize, penFontSize, penFontSize, penFontSize, penFontSize, penFontSize],
                          [penFontSize, penFontSize, penFontSize, penFontSize, penFontSize, penFontSize, penFontSize, penFontSize, penFontSize],
                          [penFontSize, penFontSize, penFontSize, penFontSize, penFontSize, penFontSize, penFontSize, penFontSize, penFontSize],
                          [penFontSize, penFontSize, penFontSize, penFontSize, penFontSize, penFontSize, penFontSize, penFontSize, penFontSize],
                          [penFontSize, penFontSize, penFontSize, penFontSize, penFontSize, penFontSize, penFontSize, penFontSize, penFontSize],
                          [penFontSize, penFontSize, penFontSize, penFontSize, penFontSize, penFontSize, penFontSize, penFontSize, penFontSize],
                          [penFontSize, penFontSize, penFontSize, penFontSize, penFontSize, penFontSize, penFontSize, penFontSize, penFontSize],
                          [penFontSize, penFontSize, penFontSize, penFontSize, penFontSize, penFontSize, penFontSize, penFontSize, penFontSize]]
        
        sudokuPlateColor = [[Color.blue, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray],[Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray],[Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray],[Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray],[Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray],[Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray],[Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray],[Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray],[Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray]]
        
        sudokuNumColor = [[Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue],[Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue],[Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue],[Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue],[Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue],[Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue],[Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue],[Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue],[Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue, Color.blue]]
        
        numColor = [Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray, Color.gray]
    }
    
    func generateSudoku() {
        let generatedSudoku = Generator().generate(forDifficulty: difficulty)
        sudokuResPlate = generatedSudoku.0
        sudokuNumPlate = generatedSudoku.1
    }
    
    func applySudoku() {
        selectedCell = 0
        var row = 0
        while row < sudokuPlate.count {
            var col = 0
            while col < sudokuPlate[row].count {
                let num = sudokuNumPlate[row * 9 + col]
                if num != 0 {
                    sudokuPlate[row][col] = "\(num)"
                    sudokuNumColor[row][col] = Color.primary
                }
                col += 1
            }
            row += 1
        }
        save()
    }
    
    func numClicked() {
        if customize && stopWatchManager.mode == .stopped {
            let row = selectedCell / 9;
            let col = selectedCell % 9;
            if clickedNum == 0 {
                sudokuPlate[row][col] = " "
            } else {
                sudokuPlate[row][col] = "\(clickedNum)"
            }
            return
        }
        if stopWatchManager.mode == .paused || stopWatchManager.mode == .stopped {
            return
        }
        let row = selectedCell / 9;
        let col = selectedCell % 9;
        if sudokuNumPlate[selectedCell] == 0 {
            if clickedNum == 0 {
                sudokuPlate[row][col] = " "
                sudokuPlateColor[row][col] = Color.blue
            } else {
                sudokuPlate[row][col] = "\(clickedNum)"
                if pencil {
                    sudokuNumColor[row][col] = Color.primary
                    sudokuFontSize[row][col] = penFontSize
                }
                renderNumColor()
                if aid {
                    if clickedNum == sudokuResPlate[selectedCell] {
                        sudokuPlateColor[row][col] = Color.green
                        highlightSameNum(num: sudokuPlate[row][col])
                    } else {
                        sudokuPlateColor[row][col] = Color.red
                        highlightSameNum(num: sudokuPlate[row][col])
                        processMistakes()
                        
                    }
                } else {
                    highlightSameNum(num: sudokuPlate[row][col])
                    if clickedNum != sudokuResPlate[selectedCell] {
                        processMistakes()
                    }
                }
            }
        }
        if isCompleted() {
            completed()
            return
        }
    }
    
    func isCompleted() -> Bool {
        var isCompleted = true
        if !(sudokuPlate.contains(where: {$0.contains(" ")})) {
            var row = 0
            while row < sudokuPlate.count {
                var col = 0
                while col < sudokuPlate[row].count {
                    if sudokuPlate[row][col] != "\(sudokuResPlate[row * 9 + col])" {
                        isCompleted = false
                        return isCompleted
                    }
                    col += 1
                }
                row += 1
            }
        } else {
            isCompleted = false
        }
        return isCompleted
    }
    
    func completed() {
        UserDefaults.standard.set(false, forKey: "playing")
        Timer.scheduledTimer(withTimeInterval: 0.05, repeats: false) { timer in
            showingAlert = true
        }
    }
    
    func selectCell() {
        if customize && stopWatchManager.mode == .stopped {
            let row = selectedCell / 9;
            let col = selectedCell % 9;
            var i = 0
            while i < sudokuPlateColor.count {
                var j = 0
                while j < sudokuPlateColor[i].count {
                    sudokuPlateColor[i][j] = Color.gray
                    j += 1;
                }
                i += 1;
            }
            sudokuPlateColor[row][col] = Color.blue
            return
        }
        if stopWatchManager.mode == .paused || stopWatchManager.mode == .stopped {
            return
        }
        let row = selectedCell / 9;
        let col = selectedCell % 9;
        renderNumColor()
        var i = 0
        while i < sudokuPlateColor.count {
            var j = 0
            while j < sudokuPlateColor[i].count {
                if aid {
                    if sudokuPlateColor[i][j] != Color.red {
                        sudokuPlateColor[i][j] = Color.gray
                    }
                } else {
                    sudokuPlateColor[i][j] = Color.gray
                }
                j += 1;
            }
            i += 1;
        }
        if sudokuPlate[row][col] == " " {
            sudokuPlateColor[row][col] = Color.blue
        } else if sudokuPlate[row][col] != " " && sudokuNumPlate[row * 9 + col] != 0 {
            sudokuPlateColor[row][col] = Color.blue
            highlightSameNum(num: sudokuPlate[row][col])
        } else if aid && sudokuPlate[row][col] == "\(sudokuResPlate[row * 9 + col])" {
            sudokuPlateColor[row][col] = Color.green
            highlightSameNum(num: sudokuPlate[row][col])
        } else if aid && sudokuPlate[row][col] != "\(sudokuResPlate[row * 9 + col])" && sudokuFontSize[row][col] != pencilFontSize {
            sudokuPlateColor[row][col] = Color.red
            highlightSameNum(num: sudokuPlate[row][col])
        } else {
            sudokuPlateColor[row][col] = Color.blue
        }
        if pencil {
            showAvailableNum(row:row, col:col)
        }
        i = 0
        while i < sudokuPlate.count {
            print("[\(i)]: \(sudokuPlate[i])")
            i += 1
        }    }
    
    func highlightSameNum (num: String) {
        var row = 0
        while row < sudokuPlate.count {
            var col = 0
            while col < sudokuPlate[row].count {
                if sudokuPlate[row][col] == num {
                    sudokuNumColor[row][col] = Color.orange
                }
                col += 1
            }
            row += 1
        }
    }
    
    func renderNumColor() {
        var row = 0
        while row < sudokuPlate.count {
            var col = 0
            while col < sudokuPlate[row].count {
                let sudokuNum = sudokuNumPlate[row * 9 + col]
                if sudokuNum != 0 {
                    sudokuNumColor[row][col] = Color.primary
                } else {
                    sudokuNumColor[row][col] = Color.blue
                }
                col += 1
            }
            row += 1
        }
    }
    
    func clearAvailableNum() {
        var row = 0
        while row < sudokuFontSize.count {
            var col = 0
            while col < sudokuFontSize[row].count {
                if sudokuFontSize[row][col] == pencilFontSize {
                    sudokuPlate[row][col] = " "
                    sudokuFontSize[row][col] = penFontSize
                }
                col += 1
            }
            row += 1
        }
    }
    
    func showAvailableNum (row: Int, col: Int) {
        clearAvailableNum()
        let util = Util()
        let availableNumPlate = util.getSudokuAvailableNumPlate(inputSududokuPlate: convertSudokuNumPlate())
        var tempRow = 0
        while tempRow < sudokuPlate[col].count {
            if sudokuPlate[tempRow][col] == " " {
                sudokuFontSize[tempRow][col] = pencilFontSize
                sudokuNumColor[tempRow][col] = Color.orange
                sudokuPlate[tempRow][col] = availableNumPlate[tempRow][col]
            }
            tempRow += 1
        }
        var tempCol = 0
        while tempCol < sudokuPlate.count {
            if sudokuPlate[row][tempCol] == " " {
                sudokuFontSize[row][tempCol] = pencilFontSize
                sudokuNumColor[row][tempCol] = Color.orange
                sudokuPlate[row][tempCol] = availableNumPlate[row][tempCol]
            }
            tempCol += 1
        }
        var startRow = row / 3 * 3
        let endRow = startRow + 3
        while startRow < endRow {
            var startCol = col / 3 * 3
            let endCol = startCol + 3
            while startCol < endCol {
                if sudokuPlate[startRow][startCol] == " " {
                    sudokuFontSize[startRow][startCol] = pencilFontSize
                    sudokuNumColor[startRow][startCol] = Color.orange
                    sudokuPlate[startRow][startCol] = availableNumPlate[startRow][startCol]
                }
                startCol += 1
            }
            startRow += 1
        }
    }
    
    func convertSudokuNumPlate() -> [Int] {
        var convertedSudokuNumPlate = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
        var row = 0
        while row < sudokuPlate.count {
            var col = 0
            while col < sudokuPlate[row].count {
                if sudokuPlate[row][col] != " " {
                    convertedSudokuNumPlate[row * 9 + col] = Int(sudokuPlate[row][col]) ?? 0
                }
                col += 1
            }
            row += 1
        }
        return convertedSudokuNumPlate
    }
    
    func processMistakes() {
        mistakesCount += 1
        if mistakesCount == 3 {
            continueAlert = true
            mistakesCount = 0
        }
    }
    
    func save() {
        print("save()")
        UserDefaults.standard.set(pencil, forKey: "pencil")
        UserDefaults.standard.set(selectedCell, forKey: "selectedCell")
        UserDefaults.standard.set(sudokuPlate, forKey: "sudokuPlate")
        UserDefaults.standard.set(sudokuNumPlate, forKey: "sudokuNumPlate")
        UserDefaults.standard.set(sudokuResPlate, forKey: "sudokuResPlate")
        UserDefaults.standard.set(sudokuFontSize, forKey: "sudokuFontSize")
        UserDefaults.standard.set(stopWatchManager.hour, forKey: "hour")
        UserDefaults.standard.set(stopWatchManager.minute, forKey: "minute")
        UserDefaults.standard.set(stopWatchManager.second, forKey: "second")
        UserDefaults.standard.set(stopWatchManager.time, forKey: "time")
        UserDefaults.standard.set(mistakesCount, forKey: "mistakesCount")
        UserDefaults.standard.set(difficultyString, forKey: "difficultyString")
        UserDefaults.standard.set(playMode, forKey: "playMode")
    }
    
    func load() {
        print("load()")
        pencil = UserDefaults.standard.bool(forKey: "pencil")
        if pencil {
            pencilColor = Color.blue
        } else {
            pencilColor = Color.gray
        }
        selectedCell = UserDefaults.standard.integer(forKey: "selectedCell")
        sudokuPlate = UserDefaults.standard.array(forKey: "sudokuPlate") as! [[String]]
        sudokuNumPlate = UserDefaults.standard.array(forKey: "sudokuNumPlate") as! [Int]
        sudokuResPlate = UserDefaults.standard.array(forKey: "sudokuResPlate") as! [Int]
        sudokuFontSize = UserDefaults.standard.array(forKey: "sudokuFontSize") as! [[Int]]
        stopWatchManager.stop()
        stopWatchManager.hour = UserDefaults.standard.integer(forKey: "hour")
        stopWatchManager.minute = UserDefaults.standard.integer(forKey: "minute")
        stopWatchManager.second = UserDefaults.standard.integer(forKey: "second")
        stopWatchManager.time = UserDefaults.standard.string(forKey: "time") ?? "00:00:00"
        mistakesCount = UserDefaults.standard.integer(forKey: "mistakesCount")
        playMode = UserDefaults.standard.string(forKey: "playMode") ?? "pause"
    }
    
}

struct PlayingView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PlayingView(viewModel: ContentViewModel(), continued: false, customize: true, showAds: false, difficulty: customized).preferredColorScheme(.dark).previewDevice("iPhone 12 Pro Max")
        }
    }
}

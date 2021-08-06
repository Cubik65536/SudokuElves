//
//  ContentView.swift
//  Sudoku Elves
//
//  Created by Cubik65536 on 2021-07-13.
//

import SwiftUI

let beginner = DifficultyModes(difficulty: .beginner, numOfBlankCells: .beginnerNumOfBlankCells, difficultyString: LocalizedStringKey("Beginner").toString())
let medium = DifficultyModes(difficulty: .medium, numOfBlankCells: .mediumNumOfBlankCells, difficultyString: LocalizedStringKey("Medium").toString())
let skilled = DifficultyModes(difficulty: .skilled, numOfBlankCells: .skilledNumOfBlankCells, difficultyString: LocalizedStringKey("Skilled").toString())
let expert = DifficultyModes(difficulty: .expert, numOfBlankCells: .expertNumOfBlankCells, difficultyString: LocalizedStringKey("Expert").toString())
let competition = DifficultyModes(difficulty: .competition, numOfBlankCells: .competitionNumOfBlankCells, difficultyString: LocalizedStringKey("Competition").toString())
let customized = DifficultyModes(difficulty: .customized, numOfBlankCells: .customizedNumOfBlankCells, difficultyString: LocalizedStringKey("Customize").toString())

extension View {
    func hasScrollEnabled(_ value: Bool) -> some View {
        self.onAppear {
            UITableView.appearance().isScrollEnabled = value
        }
    }
}

struct ContentView: View {
    @State var isNavigationBarHidden: Bool = true
    
    var interstitial = Interstitial()
    
    @State var playing = false
    
    @State var isShowingPlayingView: Bool = false
    @State var isShowingCompetitionPlayingView: Bool = false
    @State var isShowingContinuePlayingView: Bool = false
    @State var isShowingContinueCompetitionPlayingView: Bool = false
    
    @State var giveupAlert: Bool = false
    
    @State var selectedMode: String = "";
    @State var selectedDifficulty: String = "";
    @State var difficlty: DifficultyModes = DifficultyModes(difficulty: .customized, numOfBlankCells: .customizedNumOfBlankCells, difficultyString: LocalizedStringKey("Customize").toString())
    @State var customize: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                
                Spacer()
                
                Group {
                    Image("SudokuElvesLogo")
                        .resizable()
                        .frame(width: 150, height: 150, alignment: .center)
                    
                    Spacer().frame(height: 24)
                    
                    Text("Sudoku Elves").font(.headline)
                    
                    Spacer().frame(height: 75)
                    
                    Group {
                        List() {
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
                            
                            HStack {
                                Button(action: {
                                    if playing {
                                        giveupAlert = true
                                    } else {
                                        if selectedMode == LocalizedStringKey("Pro").toString() {
                                            isShowingCompetitionPlayingView = true
                                        } else {
                                            isShowingPlayingView = true
                                        }
                                    }
                                }) {
                                    Text("New Game").foregroundColor(Color.blue)
                                        .font(Font.headline.weight(.bold))
                                }.alert(isPresented: $giveupAlert) {
                                    Alert(
                                        title: Text("Do you want to give up the current game?"),
                                        primaryButton: .destructive(Text("Yes")) {
                                            if selectedMode == LocalizedStringKey("Pro").toString() {
                                                isShowingCompetitionPlayingView = true
                                            } else {
                                                isShowingPlayingView = true
                                            }
                                        },
                                        secondaryButton: .default(Text("No")) {
                                            giveupAlert = false
                                        }
                                    )
                                }.buttonStyle(PlainButtonStyle()).frame(alignment: .leading)
                                
                                Spacer()
                                
                                NavigationLink(destination: PlayingView(viewModel: ContentViewModel(), starting: true, continued: false, customize: customize, difficulty: difficlty), isActive: $isShowingPlayingView) { EmptyView() }.frame(width: 0, height: 0, alignment: .trailing)
                                NavigationLink(destination: CompetitionPlayingView(viewModel: ContentViewModel(), starting: true, continued: false, customize: customize, difficulty: difficlty), isActive: $isShowingCompetitionPlayingView) { EmptyView() }.frame(width: 0, height: 0, alignment: .trailing)
                                
                            }
                            
                            HStack {
                                Button(action: {
                                    print("UserDefaults.standard.string(forKey: \"gameMode\") = \(UserDefaults.standard.string(forKey: "gameMode") ?? "AI")")
                                    if UserDefaults.standard.string(forKey: "gameMode") == "Pro" {
                                        isShowingContinueCompetitionPlayingView = true
                                    } else {
                                        isShowingContinuePlayingView = true
                                    }
                                }) {
                                    Text("Continue Game").foregroundColor(Color.blue)
                                        .font(Font.headline.weight(.bold))
                                }.buttonStyle(PlainButtonStyle()).frame(alignment: .leading).disabled(!playing)
                                
                                Spacer()
                                
                                NavigationLink(destination: PlayingView(viewModel: ContentViewModel(), starting: false, continued: true, customize: false, difficulty: customized), isActive: $isShowingContinuePlayingView) { EmptyView() }.frame(width: 0, height: 0, alignment: .trailing).disabled(!playing)
                                NavigationLink(destination: CompetitionPlayingView(viewModel: ContentViewModel(), starting: false, continued: true, customize: false, difficulty: customized), isActive: $isShowingContinueCompetitionPlayingView) { EmptyView() }.frame(width: 0, height: 0, alignment: .trailing).disabled(!playing)
                                
                            }
                            
                        }.frame(height:240).hasScrollEnabled(false)
                        
                    }.listStyle(PlainListStyle())
                }
                
                Spacer()
            }
            
            .navigationBarTitle("Home")
            .navigationBarHidden(self.isNavigationBarHidden)
            .onAppear {
                self.isNavigationBarHidden = true
                isShowingPlayingView = false
                isShowingCompetitionPlayingView = false
                isShowingContinuePlayingView = false
                playing = UserDefaults.standard.bool(forKey: "playing")
                load()
            }
            
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
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 8")
    }
}


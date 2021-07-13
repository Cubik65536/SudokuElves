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
let guru = DifficultyModes(difficulty: .guru, numOfBlankCells: .guruNumOfBlankCells, difficultyString: LocalizedStringKey("Guru").toString())
let customized = DifficultyModes(difficulty: .customized, numOfBlankCells: .customizedNumOfBlankCells, difficultyString: LocalizedStringKey("Customize").toString())


struct ContentView: View {
    @State var isNavigationBarHidden: Bool = true
    
    var interstitial = Interstitial()
    
    @State var playing = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer().frame(height: 18)
                HStack {
                    Spacer().frame(width: 24)
                    
                    NavigationLink(destination: ShopView()) {
                        Image(systemName: "cart")
                            .frame(width: 1, height: 1)
                            .font(.system(size: 16))
                            .padding()
                            .foregroundColor(Color.blue)
                            .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.blue, lineWidth: 2)
                            )
                    }
                    
                    Spacer()
                    
                }
                
                Spacer()
                
                Group {
                    Image("SudokuElvesLogo")
                        .resizable()
                        .frame(width: 150, height: 150, alignment: .center)
                    
                    Spacer().frame(height: 24)
                    
                    Text("Sudoku Elves").font(.headline)
                    
                    Spacer().frame(height: 24)
                    
                    Group {
                        Group {
                            NavigationLink(destination: PlayingView(viewModel: ContentViewModel(), continued: false, customize: false, showAds: !UserDefaults.standard.bool(forKey: "AdsRemoved"), difficulty: beginner)) {
                                Text("Beginner")
                            }
                            
                            Spacer().frame(height: 5)
                            
                            NavigationLink(destination: PlayingView(viewModel: ContentViewModel(), continued: false, customize: false, showAds: !UserDefaults.standard.bool(forKey: "AdsRemoved"), difficulty: medium)) {
                                Text("Medium")
                            }
                            
                            Spacer().frame(height: 5)
                            
                            NavigationLink(destination: PlayingView(viewModel: ContentViewModel(), continued: false, customize: false, showAds: !UserDefaults.standard.bool(forKey: "AdsRemoved"), difficulty: skilled)) {
                                Text("Skilled")
                            }
                            
                            Spacer().frame(height: 5)
                            
                            NavigationLink(destination: PlayingView(viewModel: ContentViewModel(), continued: false, customize: false, showAds: !UserDefaults.standard.bool(forKey: "AdsRemoved"), difficulty: expert)) {
                                Text("Expert")
                            }
                            
                            Spacer().frame(height: 5)
                            
                            NavigationLink(destination: PlayingView(viewModel: ContentViewModel(), continued: false, customize: false, showAds: !UserDefaults.standard.bool(forKey: "AdsRemoved"), difficulty: guru)) {
                                Text("Guru")
                            }
                        }
                        
                        Spacer().frame(height: 5)
                        
                        NavigationLink(destination: PlayingView(viewModel: ContentViewModel(), continued: false, customize: true, showAds: !UserDefaults.standard.bool(forKey: "AdsRemoved"), difficulty: customized)) {
                            Text("Customize")
                        }
                        
                        Spacer().frame(height: 5)
                        
                        NavigationLink(destination: PlayingView(viewModel: ContentViewModel(), continued: true, customize: false, showAds: !UserDefaults.standard.bool(forKey: "AdsRemoved"), difficulty: customized)) {
                            Text("Continue")
                        }.disabled(!playing)
                        
                    }
                }
                
                Spacer()
            }
            
            .navigationBarTitle("Home")
            .navigationBarHidden(self.isNavigationBarHidden)
            .onAppear {
                self.isNavigationBarHidden = true
                playing = UserDefaults.standard.bool(forKey: "playing")
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//
//  ContentView.swift
//  Sudoku Elves
//
//  Created by Cubik65536 on 2021-07-13.
//

import SwiftUI

struct ContentView: View {
    var interstitial = Interstitial()
    
    var body: some View {
        Button(action: {self.interstitial.showAd()}){
                Text("My Button")
              }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

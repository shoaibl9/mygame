//
//  ContentView.swift
//  MyGame
//
//  Created by Shoaib Laghari on 10/27/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: MyGameViewModel
    
    let topRow = 0..<10
    let midRow = 10..<19
    let bottomRow = 19..<26
    
    let oneRowGrid = [GridItem(.flexible(minimum: 32))]
    
    var body: some View {
        ScrollView {
            _VSpacer(minHeight: 70)
            Text(viewModel.word)
                .font(.largeTitle)
                .fontWeight(.thin)
                .foregroundColor(.orange)
                .padding()
            _VSpacer(minHeight: 100)
            LazyHGrid(rows: oneRowGrid) {
//                ForEach(viewModel.keys) { key in
//                    KeyView(key: key).aspectRatio(2/3, contentMode: .fit)
//                        .onTapGesture {
//                            viewModel.select(key)
//                        }
//                }
                ForEach(topRow) { count in
                    KeyView(key: viewModel.keys[count])
                        .aspectRatio(2/3, contentMode: .fill)
                        .onTapGesture {
                            viewModel.select(viewModel.keys[count])
                        }
                }
            }
            
            LazyHGrid(rows: oneRowGrid) {
                ForEach(midRow) { count in
                    KeyView(key: viewModel.keys[count])
                        .aspectRatio(2/3, contentMode: .fill)
                        .onTapGesture {
                            viewModel.select(viewModel.keys[count])
                        }
                }
            }
            
            LazyHGrid(rows: oneRowGrid) {
                ForEach(bottomRow) { count in
                    KeyView(key: viewModel.keys[count])
                        .aspectRatio(2/3, contentMode: .fill)
                        .onTapGesture {
                            viewModel.select(viewModel.keys[count])
                        }
                }
            }
        }
    }
}

//Single card
struct KeyView: View {
    let key: MyGameModel<String>.Key
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 10)
            
            if key.isCurrentKey {
                shape.fill().foregroundColor(.green)
                Text(key.content)
            } else {
                shape.fill()
                Text(key.content).foregroundColor(.orange)
            }
            
            if key.isNextCorrectKey {
                shape.strokeBorder(lineWidth: 4).foregroundColor(.blue)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = MyGameViewModel()
        
        ContentView(viewModel: game)
            .preferredColorScheme(.dark)
        ContentView(viewModel: game)
            .preferredColorScheme(.light)
    }
}

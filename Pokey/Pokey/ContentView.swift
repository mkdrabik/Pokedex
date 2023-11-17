//
//  ContentView.swift
//  Pokey
//
//  Created by Mason Drabik on 11/16/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var p = PokedexService()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.systemGray6)
                    .ignoresSafeArea()
                VStack {
                    Text("Pokedex")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding()
                    List{
                        ForEach(p.pokemon){poke in
                            NavigationLink {
                                PokemonView(vm: PokemonViewModel(model: poke))
                            } label: {
                                Text(poke.name)
                            }
                        }
                    }
                .ignoresSafeArea(.all)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}

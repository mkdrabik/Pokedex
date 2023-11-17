//
//  PokemonView.swift
//  Pokey
//
//  Created by Mason Drabik on 11/16/23.
//

import SwiftUI

struct PokemonView: View {
    
    @StateObject var vm: PokemonViewModel
    
    var body: some View {
        VStack {
            Text(vm.model.name + " #" + vm.model.num)
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
            HStack {
                AsyncImage(url: vm.model.imageURL) { image in image
                    .resizable()
                    .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 200)
                VStack {
                    Text("Height \(vm.model.height)")
                    Text("Weight \(vm.model.weight)")
                }
                
            }
            .padding(.vertical, 40)
            HStack {
                Button{
                    vm.setPreviousPokemon()
                } label:{
                    Image(systemName: "arrowshape.left.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.black)
                }
                .padding(.leading, 40)
                Spacer()
                Button{
                    vm.setNextPokemon()
                } label:{
                    Image(systemName: "arrowshape.right.fill")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .foregroundColor(.black)
                }
                .padding(.trailing, 40)
            }
        }
    }
}

#Preview {
    PokemonView(vm: PokemonViewModel(model: .example))
}

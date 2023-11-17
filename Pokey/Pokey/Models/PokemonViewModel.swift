//
//  PokemonViewModel.swift
//  Pokey
//
//  Created by Mason Drabik on 11/16/23.
//

import Foundation

class PokemonViewModel: ObservableObject{
    @Published var model: Pokemon
    
    init(model: Pokemon){
        self.model = model
    }
    
    var name: String {
        model.name
    }
    
    var num: String{
        model.num
    }
    
    var typeString: String {
        model.type.map { $0.rawValue }.joined(separator: ", ")
    }
    
    var currentId: Int{
        model.id
    }
    
    func setNextPokemon(){
        if(currentId < 151){
            model = PokedexService.shared.getPokemonById(id: currentId + 1)
        }
    }
    
    func setPreviousPokemon(){
        if(currentId > 1){
            model = PokedexService.shared.getPokemonById(id: currentId - 1)
        }
    }
}

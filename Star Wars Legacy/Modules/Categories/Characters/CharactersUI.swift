//
//  CharactersUI.swift
//  Star Wars Legacy
//
//  Created by Omar Regalado Mendoza on 26/05/22.
//

import SwiftUI

struct CharactersUI: View {
    
    @StateObject private var viewModel = CharactersViewModel()
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyVGrid(columns: [GridItem(.fixed(150)),
                                GridItem(.fixed(150))]) {
                ForEach(viewModel.characterList ?? [StarWarsPeople](), id:\.self) {
                    
                    CharactersCellUI(imageName: "Characteres",
                                     name: $0.name)
                    
                    
                }
                
            }
        }
        .preferredColorScheme(.dark)
    }
}

struct CharactersUI_Previews: PreviewProvider {
    static var previews: some View {
        CharactersUI()
    }
}

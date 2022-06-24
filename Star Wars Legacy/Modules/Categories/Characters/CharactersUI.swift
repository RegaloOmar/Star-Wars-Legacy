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
        
        NavigationView {
            List{
                ForEach(viewModel.characterList) { character in
                    NavigationLink(destination: DetailsUI(character: character)) {
                        Text(character.name)
                            .foregroundColor(.yellow)
                            .fontWeight(.bold)
                            .font(.system(.title, design: .rounded))
                            .frame(minWidth: 100,
                                   maxWidth: .infinity,
                                   minHeight: 100,
                               maxHeight: 100)
                    }
                }
            }
            .onAppear {
                viewModel.fetchCharacters()
            }
            
            .navigationTitle("Characters")
        }
        .preferredColorScheme(.dark)
    }
    
    private func fetchData() {
        viewModel.fetchCharacters()
    }
}

struct CharactersUI_Previews: PreviewProvider {
    static var previews: some View {
        CharactersUI()
    }
}

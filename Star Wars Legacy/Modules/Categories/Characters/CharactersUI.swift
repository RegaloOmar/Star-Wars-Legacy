//
//  CharactersUI.swift
//  Star Wars Legacy
//
//  Created by Omar Regalado Mendoza on 26/05/22.
//

import SwiftUI

struct CharactersUI: View {
    
    @StateObject var viewModel = CharactersViewModel()
    
    var body: some View {
        
        List{
            ForEach(viewModel.characterList) { character in
                Text(character.name)
                    .foregroundColor(.yellow)
                    .fontWeight(.bold)
                    .font(.system(.title, design: .rounded))
            }
        }
        .onAppear {
            viewModel.fetchCharacters()
        }
        .preferredColorScheme(.dark)
    }
}

struct CharactersUI_Previews: PreviewProvider {
    static var previews: some View {
        CharactersUI()
    }
}

//
//  CharactersUI.swift
//  Star Wars Legacy
//
//  Created by Omar Regalado Mendoza on 26/05/22.
//

import SwiftUI

struct CharactersUI: View {
    
    @StateObject private var viewModel = CharactersViewModel()
    @StateObject private var imageLoader = ImageLoader()
    let url = URL(string: "https://starwars-visualguide.com/assets/img/characters/3.jpg")
    
    var body: some View {
        
        
        List{
            ForEach(viewModel.characterList) { character in
                NavigationLink(destination: DetailsUI(character: character)) {

                    AsyncImage(url: imageLoader.getImageURL(character.url)) {
                        $0.resizable()
                            .frame(width: 70, height: 70)
                            .clipShape(Circle())
                    } placeholder: {
                        Text("Loading..")
                    }

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

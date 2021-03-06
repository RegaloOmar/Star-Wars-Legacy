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
    
    var body: some View {
        
        List{
            ForEach(viewModel.characterList) { character in
                
                NavigationLink(destination: DetailsUI(character: character)) {

                    HStack {
                        AsyncImage(url: URL(string: imageLoader.getImageURL(character.url, categorie: .characters))) {
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
                    .onAppear {
                        if character == self.viewModel.characterList.last {
                            viewModel.getNextPage()
                        }
                    }
                }
            }
        }
        .frame(width: .infinity, height: .infinity, alignment: .center)
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

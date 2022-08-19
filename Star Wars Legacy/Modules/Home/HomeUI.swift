//
//  HomeUI.swift
//  Star Wars Legacy
//
//  Created by Omar Regalado on 15/05/22.
//

import SwiftUI

struct HomeUI: View {
    
    let logo = "Star_Wars_Logo"
    let characters = "Characters"
    let categories = ["Planets", "Species", "Vehicles", "Starships", "Films"]
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            VStack{
                Image(logo)
                    .resizable()
                    .frame(height: 180)
                    .padding(.vertical)
                
                NavigationLink(destination: CharactersListUI().navigationTitle("Characters")){
                    HomeCellUI(image: characters,
                               text: characters,
                               isMainCell: true)
                }
                
                ScrollView(.horizontal) {
                    LazyHGrid(rows: [GridItem(.flexible())], alignment: .top) {
                        ForEach(categories, id: \.self) {
                            HomeCellUI(image: $0,
                                       text: $0,
                                       isMainCell: false)
                                .frame(minWidth: 100,maxWidth: 320)
                        }
                    }
                }
                
                Spacer()
            }
            .preferredColorScheme(.dark)
            .navigationBarHidden(true)
        }
    }
}

struct HomeUI_Previews: PreviewProvider {
    static var previews: some View {
        HomeUI()
    }
}

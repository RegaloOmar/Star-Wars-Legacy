//
//  HomeUI.swift
//  Star Wars Legacy
//
//  Created by Omar Regalado on 15/05/22.
//

import SwiftUI

struct HomeUI: View {
    
    let logo = "Star_Wars_Logo"
    let characters = "characters"
    let subcategories = ["planets", "species", "vehicules", "starship", "films"]
    
    //Connect the View and the ViewModel (Runs init code on the VM)
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        VStack{
            Image(logo)
                .resizable()
                .frame(height: 180)
                .padding(.vertical)
            
            HomeCellUI(image: characters, text: "Characters", isMainCell: true)

            
            ScrollView(.horizontal) {
                LazyHGrid(rows: [GridItem(.flexible())], alignment: .top) {
                    ForEach((0...4), id: \.self) { _ in
                        HomeCellUI(image: characters, text: characters, isMainCell: false)
                    }
                }
            }
            .padding()
            
            Spacer()
        }
    }
}

struct HomeUI_Previews: PreviewProvider {
    static var previews: some View {
        HomeUI()
            .preferredColorScheme(.dark)
    }
}

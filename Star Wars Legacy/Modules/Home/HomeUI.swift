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
    
    //Connect the View and the ViewModel (Runs init code on the VM)
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        VStack{
            Image(logo)
                .resizable()
                .frame(height: 180)
                .padding(.vertical)
            Button {
                
            } label: {
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
            .padding()
            
            
            Spacer()
        }
        .preferredColorScheme(.dark)
    }
}

struct HomeUI_Previews: PreviewProvider {
    static var previews: some View {
        HomeUI()
    }
}

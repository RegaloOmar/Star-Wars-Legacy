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
    //Connect the View and the ViewModel (Runs init code on the VM)
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        VStack{
            Image(logo)
                .resizable()
                .frame(height: 220)
                .padding(.vertical)
            
            Image(characters)
                .frame(width: .infinity)
            
            ScrollView(.horizontal) {
                LazyHGrid(rows: [GridItem(.flexible())], alignment: .top) {
                    ForEach((0...222), id: \.self) { _ in
                        ColorView()
                    }
                }
            }
            .padding()
            
            
        }
        
    }
    
   let colors: [Color] = [.red, .green, .blue, .yellow, .purple]
    
   @ViewBuilder
   func ColorView() -> some View {
       (colors.randomElement() ?? .gray)
           .cornerRadius(10)
           .frame(minHeight: 40)
   }
}

struct HomeUI_Previews: PreviewProvider {
    static var previews: some View {
        HomeUI()
            .preferredColorScheme(.dark)
    }
}

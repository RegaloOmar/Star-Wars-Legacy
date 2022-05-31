//
//  CategoriesCellUI.swift
//  Star Wars Legacy
//
//  Created by Omar Regalado Mendoza on 23/05/22.
//

import SwiftUI

struct CharactersCellUI: View {
    
    var imageName: String
    var name: String
    
    var body: some View {
        
        VStack {
            
            Image(self.imageName)
                .resizable()
                .clipShape(Circle())
                .frame(width: 100, height: 100)
                .overlay(Circle()
                    .stroke(Color.yellow, lineWidth: 3))
            
            Text(self.name)
                .foregroundColor(.yellow)
                .fontWeight(.bold)
                .font(.system(.title))
        }
        .frame(minWidth: .zero, maxWidth: 200)
        .padding()
        .overlay(RoundedRectangle(cornerRadius: 20)
            .stroke(Color.yellow, lineWidth:  4))
        .preferredColorScheme(.dark)
    }
}

struct CategoriesCellUI_Previews: PreviewProvider {
    static var previews: some View {
        CharactersCellUI(imageName: "Characters",
                         name: "Baby Yoda")
    }
}

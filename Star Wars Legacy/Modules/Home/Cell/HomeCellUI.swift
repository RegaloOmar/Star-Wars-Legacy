//
//  HomeCellUI.swift
//  Star Wars Legacy
//
//  Created by Omar Regalado Mendoza on 19/05/22.
//

import SwiftUI

struct HomeCellUI: View {
    
    var image: String
    var text: String
    @State var isMainCell = true
    
    var body: some View {
        ZStack(alignment: .bottom) {
            Image(self.image)
                .resizable()
                .frame(minWidth: CGFloat.zero, maxWidth: .infinity, minHeight: isMainCell ? 200 : 160, maxHeight: isMainCell ? 250 : 160)
            
            
            Text(self.text)
                .foregroundColor(.yellow)
                .font(.system(.title, design: .rounded))
                .fontWeight(.heavy)
                .frame(minWidth: CGFloat.zero, maxWidth: .infinity, minHeight: 30, maxHeight: 50)
                .background(Color.black
                )
            
        }
        .cornerRadius(20)
        .overlay(RoundedRectangle(cornerRadius: 20)
            .stroke(Color.yellow, lineWidth: 3))
        .padding()
    }
}

struct HomeCellUI_Previews: PreviewProvider {
    static var previews: some View {
        HomeCellUI(image: "Planets", text: "Planets")
            .preferredColorScheme(.dark)
    }
}

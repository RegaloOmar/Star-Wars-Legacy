//
//  HomeUI.swift
//  Star Wars Legacy
//
//  Created by Omar Regalado on 15/05/22.
//

import SwiftUI

struct HomeUI: View {
    
    //Connect the View and the ViewModel (Runs init code on the VM)
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        VStack{
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
        
    }
}

struct HomeUI_Previews: PreviewProvider {
    static var previews: some View {
        HomeUI()
    }
}

//
//  PlanetsUI.swift
//  Star Wars Legacy
//
//  Created by Omar Regalado on 03/07/22.
//

import SwiftUI

struct PlanetsUI: View {
    
    @StateObject private var viewModel = PlanetsListViewModel()
    @StateObject private var imageLoader = ImageLoader()
    
    var body: some View {
        ScrollView{
            List {
                ForEach(viewModel.planetsList) { planet in
                    
                    
                    
                }
                
                
            }
            .preferredColorScheme(.dark)
        }
    }
}

struct PlanetsUI_Previews: PreviewProvider {
    static var previews: some View {
        PlanetsUI()
    }
}

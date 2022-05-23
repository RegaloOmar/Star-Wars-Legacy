//
//  SubCategoriesUI.swift
//  Star Wars Legacy
//
//  Created by Omar Regalado Mendoza on 20/05/22.
//

import SwiftUI

struct CategoriesUI: View {
    
    @ObservedObject private var viewModel = CategoriesViewModel()
    
    var body: some View {
        ScrollView(.vertical) {
            List( {
                
            }
        }
        .preferredColorScheme(.dark)
    }
}

struct SubCategoriesUI_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesUI()
    }
}

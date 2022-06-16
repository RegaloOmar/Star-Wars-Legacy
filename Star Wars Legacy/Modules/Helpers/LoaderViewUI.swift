//
//  LoaderViewUI.swift
//  Star Wars Legacy
//
//  Created by Omar Regalado on 15/06/22.
//

import SwiftUI

struct LoaderViewUI: View {
    let isFailed: Bool
    var body: some View {
        Text(isFailed ? "Failed. Tap to retry." : "Loading...")
            .foregroundColor(isFailed ? .red : .green)
            .padding()
        
    }
}

struct LoaderViewUI_Previews: PreviewProvider {
    static var previews: some View {
        LoaderViewUI(isFailed: false)
    }
}

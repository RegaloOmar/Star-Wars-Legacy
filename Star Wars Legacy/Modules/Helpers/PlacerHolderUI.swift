//
//  PlacerHolderUI.swift
//  Star Wars Legacy
//
//  Created by Omar Regalado Mendoza on 07/07/22.
//

import SwiftUI

struct PlacerHolderUI: View {
    var body: some View {
        Image(UtilsStrings.swPlaceholder)
            .resizable()
        .frame(width: 200, height: 200)
    }
}

struct PlacerHolderUI_Previews: PreviewProvider {
    static var previews: some View {
        PlacerHolderUI()
    }
}

//
//  Strings.swift
//  Star Wars Legacy
//
//  Created by Omar Regalado on 03/07/22.
//

import Foundation

extension String {
    
    public func transferLocalizedString() -> String {
    return NSLocalizedString(self, tableName: "StarWarsStrings", bundle: Bundle(for: HomeViewModel.self), value: "", comment: "")
    }
}

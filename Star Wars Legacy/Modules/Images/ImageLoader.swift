//
//  ImageLoader.swift
//  Star Wars Legacy
//
//  Created by Omar Regalado Mendoza on 28/06/22.
//

import Foundation
import Combine
import SwiftUI

class ImageLoader: ObservableObject {
    
    @Published var image: UIImage?
    var cancellable: AnyCancellable?
    private var cache: ImageCache?
    private var imageURL = "https://starwars-visualguide.com/assets/img/%categorie/%id.jpg"
    private var cacheURL: String?
    private(set) var isLoading = false
    
    init(cache: ImageCache? = nil) {
        self.cache = cache
    }
    
    deinit {
        cancel()
    }
    
    func getImageURL(_ str: String, categorie: Categories) -> String {
        let id = str.suffix(3).replacingOccurrences(of: "/", with: "")
        var newURL = imageURL.replacingOccurrences(of: "%id", with: id)
        
        switch categorie {
        case .characters:
            newURL = newURL.replacingOccurrences(of: "%categorie", with: "characters")
        case .planets:
            newURL = newURL.replacingOccurrences(of: "%categorie", with: "planets")
        }
        
        
        self.cacheURL = newURL
        return newURL
    }
    
    func load() {
        
        if let image = cache?[URL(string: cacheURL  ?? "")!] {
                    self.image = image
                    return
        }
        
        cancellable = NetworkManager.shared.fetchImages(imageURL)
            .map{ UIImage(data: $0.image)}
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .handleEvents(receiveSubscription: {[weak self] _ in self?.onStart()},
                          receiveOutput: {[weak self] in self?.cache($0)},
                          receiveCompletion: {[weak self] _ in self?.onFinish()},
                          receiveCancel: {[weak self] in self?.onFinish()})
            .sink(receiveValue: {[weak self] in self?.image = $0})
    }
    
    func cancel() {
        cancellable?.cancel()
    }
    
    private func onStart() {
        isLoading = true
    }
    
    private func onFinish() {
        isLoading = false
    }
    
    private func cache(_ image: UIImage?) {
        image.map { cache?[URL(string: cacheURL ?? "")!] = $0}
    }
    
    enum Categories {
        case characters
        case planets
    }
    
}

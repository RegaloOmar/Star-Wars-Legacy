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
    private let url = URL(string: "https://starwars-visualguide.com/assets/img/characters/1.jpg")
    private var imageURL = "https://starwars-visualguide.com/assets/img/characters/%id.jpg"
    private static let imageProcessingQueue = DispatchQueue(label: "image-processing")
    private(set) var isLoading = false
    
    init(cache: ImageCache? = nil) {
        self.cache = cache
    }
    
    deinit {
        cancel()
    }
    
    func getImageURL(_ str: String) -> URL {
        
        let id = str.suffix(3).replacingOccurrences(of: "/", with: "")
        let newURL = imageURL.replacingOccurrences(of: "%id", with: id)
        return URL(string: newURL)!
    }
    
    func load() {
        
        if let image = cache?[url!] {
                    self.image = image
                    return
        }
        
        cancellable = URLSession.shared.dataTaskPublisher(for: url!)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .handleEvents(receiveSubscription: {[weak self] _ in self?.onStart()},
                          receiveOutput: {[weak self] in self?.cache($0)},
                          receiveCompletion: {[weak self] _ in self?.onFinish()},
                          receiveCancel: {[weak self] in self?.onFinish()})
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Finished")
                case .failure(let error):
                    print(error.localizedDescription)
                }
                
            }, receiveValue: { [weak self] in self?.image = $0 })
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
        image.map { cache?[url!] = $0}
    }
    
    
}

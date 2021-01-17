//
//  ViewModel.swift
//  Listing
//
//  Created by Mohammad on 16/01/2021.
//

import Foundation


class ViewModel {
    
    // MARK: - Bindable Properties
    
    /// Error message to show if error occures on a request
    var errorMessage = Observable<String?>(nil)
    
    /// Progress indicator will show/hide once the value is changed
    var isProgress = Observable(false)
    
    /// NetworkRepository to handle network requests
    let repository: NetworkRepository
    
    // MARK: - Initialization
    init(_ repository: NetworkRepository = NetworkRepository()) {
        self.repository = repository
        
        // Initialize here
    }
    
    func processRequest<T: Codable>(_ type: RequestType,
                          completion: @escaping ((T) -> Void)) {
        if self.isProgress.value == false {
            self.isProgress.value = true
        }
        repository.decodedObject(for: type) { (reslut: Result<T, Error>) in
            self.isProgress.value = false
            DispatchQueue.main.async {
                switch reslut {
                case .success(let object):
                    completion(object)
                case .failure(let error):
                    self.errorMessage.value = error.localizedDescription
                }
            }
        }
    }
}

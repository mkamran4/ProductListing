//
//  DataRepository.swift
//  Listing
//
//  Created by Mohammad on 16/01/2021.
//

import Foundation

protocol DataRepository {
    func decodedObject<T: Decodable>(
        for requestType: RequestType,
        completion: @escaping ((Result<T, Error>) -> Void))
}

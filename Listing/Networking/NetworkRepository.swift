//
//  NetworkRepository.swift
//  Listing
//
//  Created by Mohammad on 16/01/2021.
//

import Foundation

enum RequestType: String {
    case listing = "https://ey3f2y0nre.execute-api.us-east-1.amazonaws.com/default/dynamodb-writer"
    
    var url: URL { URL(string: self.rawValue)! }
}

struct NetworkRepository: DataRepository {
    
    private var decoder: JSONDecoder
    
    private var session: URLSession
    // MARK: - Initialization
    init(_ decoder: JSONDecoder = JSONDecoder(), session: URLSession = .shared) {
        self.decoder = decoder
        self.session = session
    }
    
    // MARK: - Internal methods
    func decodedObject<T: Decodable>(
        for requestType: RequestType = .listing,
        completion: @escaping ((Result<T, Error>) -> Void)
    ) {
        session.dataTask(with: requestType.url) { (data, _, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            if let data = data {
                do {
                    let object = try decoder.decode(T.self, from: data)
                    completion(.success(object))
                } catch {
                    completion(.failure(error))
                }
            } else {
                completion(.failure(NSError.valueNotFound))
            }
        }.resume()
    }
}

extension NSError {
    
    static let valueNotFound = NSError(domain: Bundle.main.bundleIdentifier ?? "com.Mohammad.listing",
                                       code: NSCoderValueNotFoundError,
                                       userInfo: nil)

}

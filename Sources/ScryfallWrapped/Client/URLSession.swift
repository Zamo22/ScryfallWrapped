//
//  Created by Zaheer Moola on 2022/06/20.
//

import Foundation

public extension URLSession {
    typealias Handler<T: Codable> = (Result<T, Error>) -> Void

    private func dataTask<T: Codable>(
        with url: URL,
        expectedType: T.Type,
        handler: @escaping Handler<T>
    ) -> URLSessionDataTask {
        dataTask(with: url) { data, _, error in
            if let error = error {
                handler(.failure(error))
            } else {
                self.decodeData(data ?? Data(), expectedType: expectedType, handler: handler)
            }
        }
    }

    private func decodeData<T>(_ data: Data, expectedType: T.Type, handler: @escaping Handler<T>) {
        do {
            let model = try JSONDecoder().decode(expectedType, from: data)
            handler(.success(model))
        } catch {
            if let scryfallError = try? JSONDecoder().decode(ScryfallError.self, from: data) {
                handler(.failure(scryfallError))
            }
            handler(.failure(error))
        }
    }
    
    @discardableResult
    internal func endpointRequest<T: Codable>(
        _ endpoint: Endpoint,
        expectedType: T.Type,
        then handler: @escaping Handler<T>
    ) -> URLSessionDataTask {
        let task = dataTask(with: endpoint.url,
                            expectedType: expectedType,
                            handler: handler)
        task.resume()
        return task
    }
}

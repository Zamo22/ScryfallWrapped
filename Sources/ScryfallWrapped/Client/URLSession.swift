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
                do {
                    let model = try JSONDecoder().decode(expectedType, from: data ?? Data())
                    handler(.success(model))
                } catch {
                    handler(.failure(error))
                }


            }
        }
    }
    
    @discardableResult
    func endpointRequest<T: Codable>(
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

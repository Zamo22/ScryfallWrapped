//
//  Created by Zaheer Moola on 2022/06/20.
//

import Foundation

public extension URLSession {
    typealias Handler = (Result<Data, Error>) -> Void

    private func dataTask(
        with url: URL,
        handler: @escaping Handler
    ) -> URLSessionDataTask {
        dataTask(with: url) { data, _, error in
            if let error = error {
                handler(.failure(error))
            } else {
                handler(.success(data ?? Data()))
            }
        }
    }
    
    @discardableResult
    func endpointRequest(
        _ endpoint: Endpoint,
        then handler: @escaping Handler
    ) -> URLSessionDataTask {
        let task = dataTask(with: endpoint.url,
                            handler: handler)
        task.resume()
        return task
    }
}

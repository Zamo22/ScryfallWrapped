//
//  Created by Zaheer Moola on 2022/06/17.
//
// This approach was inspired by this wonderful piece:
// https://www.swiftbysundell.com/clips/4/

import Foundation

struct Endpoint {
    var path: String
    var queryItems: [URLQueryItem] = []

    var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = Constants.Endpoints.baseUrl
        components.path = "/" + path
        components.queryItems = queryItems

        guard let url = components.url else {
            preconditionFailure("Invalid parameters provided: \(components)")
        }
        return url
    }
}

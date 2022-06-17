//
//  Created by Zaheer Moola on 2022/06/17.
//
// This approach was inspired by this wonderful piece:
// https://www.swiftbysundell.com/clips/4/

import Foundation

public struct Endpoint {
    public var path: String
    public var queryItems: [URLQueryItem] = []

    public var url: URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.scryfall.com"
        components.path = "/" + path
        components.queryItems = queryItems

        guard let url = components.url else {
            preconditionFailure("Invalid parameters provided: \(components)")
        }
        return url
    }
}

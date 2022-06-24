//
//  Created by Zaheer Moola on 2022/06/24.
//

import Foundation

public struct ScryfallCatalog: Codable {
    /// An array of datapoints, as strings
    public let data: [String]
    /// A link to the current catalog on Scryfall’s API
    public let uri: String
    /// The number of items in the current catalog data array
    public let totalValues: Int

    enum CodingKeys: String, CodingKey {
        case data, uri
        case totalValues = "total_values"
    }
    
}

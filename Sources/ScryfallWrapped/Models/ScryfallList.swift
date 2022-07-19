//
//  Created by Zaheer Moola on 2022/06/20.
//

import Foundation

public struct ScryfallList<DataType: Codable>: Codable {
    public let data: [DataType]
    /// True if this List is paginated and there is a page beyond the current page
    public let hasMore: Bool?
    /// If there is a page beyond the current page, this field will contain a full API URI to that page
    public let nextPage: String?
    /// If this is a list of Card objects, this field will contain the total number of cards found across all pages
    public let totalCards: Int?
    /// An array of human-readable warnings issued when generating this list, as strings. Warnings are non-fatal issues that the API discovered with your input. In general, they indicate that the List will not contain the all of the information you requested. You should fix the warnings and re-submit your request.
    public let warnings: [String]?

    enum CodingKeys: String, CodingKey {
        case hasMore = "has_more"
        case nextPage = "next_page"
        case totalCards = "total_cards"
        case warnings, data
    }
}

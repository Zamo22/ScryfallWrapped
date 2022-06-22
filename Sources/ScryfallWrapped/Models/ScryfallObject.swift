//
//  Created by Zaheer Moola on 2022/06/20.
//

import Foundation

public enum ScryfallObject: String, Codable {
    case card
    case relatedCard = "related_card"
    case cardFace = "card_face"
    case set
    case ruling
    case error
}

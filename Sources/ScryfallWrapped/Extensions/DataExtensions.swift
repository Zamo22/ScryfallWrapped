//
//  Created by Zaheer Moola on 2022/06/17.
//

import Foundation

extension Bool {
    var nullableString: String? {
        String(self)
    }
}

extension Int {
    var nullableString: String? {
        String(self)
    }
}

public protocol CaseIterableDefaultsLast: Codable & CaseIterable & RawRepresentable
where RawValue: Decodable, AllCases: BidirectionalCollection { }

public extension CaseIterableDefaultsLast {
    init(from decoder: Decoder) throws {
        self = try Self(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? Self.allCases.last!
    }
}

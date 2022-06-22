//
//  Created by Zaheer Moola on 2022/06/22.
//

import Foundation

struct ScryfallError: Error, Codable {
    public let object: ScryfallObject
    /// A computer-friendly string representing the appropriate HTTP status code
    public let code: String
    /// An integer HTTP status code for this error
    public let status: Int
    /// A human-readable string explaining the error
    public let details: String
    /// A computer-friendly string that provides additional context for the main error. For example, an endpoint many generate HTTP 404 errors for different kinds of input. This field will provide a label for the specific kind of 404 failure, such as ambiguous
    public let type: String?
    /// If your input also generated non-failure warnings, they will be provided as human-readable strings in this array
    public let warnings: [String]?
}

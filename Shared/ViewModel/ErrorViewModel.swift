import Foundation
struct ErrorViewModel {
    let description: String
}
extension ErrorViewModel {
    static func from(_ errorDescription: String?) -> ErrorViewModel {
        return ErrorViewModel(description: errorDescription ?? "Something went wrong!")
    }
}

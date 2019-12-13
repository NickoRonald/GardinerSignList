import UIKit
extension UITableView {
    func register<T: UITableViewCell>(_: T.Type,
                                      reuseIdentifier: String? = nil) {
        self.register(T.self,
                      forCellReuseIdentifier: reuseIdentifier ?? String(describing: T.self))
    }
    func dequeue<T: UITableViewCell>(_: T.Type,
                                     for indexPath: IndexPath) -> T {
        guard
            let cell = dequeueReusableCell(withIdentifier: String(describing: T.self),
                                             for: indexPath) as? T
            else { fatalError("Could not deque cell with type \(T.self)") }
        return cell
    }
}

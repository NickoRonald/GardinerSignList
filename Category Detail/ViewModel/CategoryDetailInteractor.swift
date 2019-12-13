import Foundation
import RxSwift
import RxCocoa
class CategoryDetailInteractor {
    let categoryViewModel: CategoryViewModel
    let viewModel: BehaviorRelay<CategoryDetailViewModel>
    let title: String
    init(categoryViewModel: CategoryViewModel) {
        self.categoryViewModel = categoryViewModel
        title = categoryViewModel.name
        viewModel = BehaviorRelay(value: .init(with: .initialized))
    }
    func fetchHieroglyphs() {
        viewModel.accept(.init(with: .loaded(categoryViewModel)))
    }
}

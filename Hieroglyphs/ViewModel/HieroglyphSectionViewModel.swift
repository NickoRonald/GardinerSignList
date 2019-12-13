import Foundation
struct HieroglyphSectionViewModel {
    enum ViewModelType {
        case hieroglyph(HieroglyphViewModel)
    }
    let viewModels: [ViewModelType]
    let sectionTitle: String
    init(with category: Category) {
        sectionTitle = category.name
        let hieroglyphViewModels = HieroglyphViewModel.from(category.hieroglyphs)
        viewModels = hieroglyphViewModels.map(ViewModelType.hieroglyph)
    }
}
extension HieroglyphSectionViewModel {
    var numberOfItem: Int {
        return viewModels.count
    }
    func viewModelType(at indexPath: IndexPath) -> ViewModelType {
        return viewModels[indexPath.row]
    }
}

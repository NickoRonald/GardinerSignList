import UIKit
import AloeStackView
class HieroglyphDetailViewController: AloeStackViewController {
    let interactor: HieroglyphDetailInteractor
    init(interactor: HieroglyphDetailInteractor) {
        self.interactor = interactor
        super.init()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        stackView.backgroundColor = pinkBack
        setupNavigationBar()
        setupStackView()
    }
    private func setupNavigationBar() {
        if #available(iOS 11.0, *) {
            navigationController?.navigationBar.prefersLargeTitles = true
        }
        title = interactor.hieroglyphViewModel.id
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.backgroundColor = pinkBack
        let dismissBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop,
                                                   target: self,
                                                   action: #selector(onDismissBarButtonitem))
        navigationItem.leftBarButtonItem = dismissBarButtonItem
    }
    @objc
    private func onDismissBarButtonitem() {
        dismiss(animated: true)
    }
    private func setupStackView() {
        stackView.bounces = true
        setupHeaderView()
        setupDescriptionView()
        setupTransliterationView()
        setupPhoneticView()
        setupNoteView()
    }
    private func setupHeaderView() {
        let view = HieroglyphsDetailHeaderView()
        view.configure(with: interactor.hieroglyphViewModel)
        stackView.addRow(view)
    }
    private func setupDescriptionView() {
        let view = HieroglyphDetailInformationView()
        view.configure(with: "Description:", information: interactor.hieroglyphViewModel.description)
        stackView.addRow(view)
    }
    private func setupTransliterationView() {
        let view = HieroglyphDetailInformationView()
        view.configure(with: "Transliteration:", information: interactor.hieroglyphViewModel.transliteration)
        stackView.addRow(view)
    }
    private func setupPhoneticView() {
        let view = HieroglyphDetailInformationView()
        view.configure(with: "Phonetic:", information: interactor.hieroglyphViewModel.phonetic)
        stackView.addRow(view)
    }
    private func setupNoteView() {
        let view = HieroglyphDetailInformationView()
        view.configure(with: "Note:", information: interactor.hieroglyphViewModel.note)
        stackView.addRow(view)
        stackView.hideSeparator(forRow: view)
    }
}

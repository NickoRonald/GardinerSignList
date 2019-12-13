import UIKit
class CategoryHeaderCell: UICollectionViewCell {
    let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.numberOfLines = 0
        label.textColor = .white
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = pinkBack
        contentView.addSubview(nameLabel)
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 14),
            nameLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Styles.Sizes.gutter),
            nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: Styles.Sizes.gutter),
            ])
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override var layer: CALayer {
        let layer = super.layer
        layer.zPosition = 0 
        return layer
    }
    func configure(with text: String) {
        nameLabel.text = text
    }
}

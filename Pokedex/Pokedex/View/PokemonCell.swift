//
//  PokemonCell.swift
//  Pokedex
//
//  Created by Gabriele Namie on 29/08/23.
//

import UIKit

final class PokemonCell: UICollectionViewCell {

    override init(frame: CGRect) {
        super.init(frame: frame)
        buildView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.imageView.image = nil
        self.idLabel.text = nil
        self.nameLabel.text = nil
    }

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.tintColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()

    private lazy var idLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.tintColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()

    func configure(with viewModel: PokedexCellViewModel) {
        self.nameLabel.text = viewModel.name
        self.idLabel.text = "#\(viewModel.id)"
        setImage(id: viewModel.id)
    }
    
    private func setImage(id: String) {
        guard let url = URL(string: "\(PublicAPI.imageUrl)\(id).png") else {
            return
        }

        ImageCache.getImage(with: url) { [weak self] (image) in
            guard let self = self,
                  let image = image else { return }
            self.imageView.image = image
        }
    }
}

extension PokemonCell: MinimumViewMethodsProtocol {

    func setupHierarchy() {
        contentView.addSubview(nameLabel)
        contentView.addSubview(idLabel)
        contentView.addSubview(imageView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            idLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            idLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
        ])

        NSLayoutConstraint.activate([
            nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -6),
            nameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
        ])

        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: nameLabel.topAnchor)
        ])
    }
    
    func additionalSetup() {
        layer.cornerRadius = 16
        contentView.backgroundColor = .systemGray6
        contentView.layer.masksToBounds = true
        contentView.layer.cornerRadius = 12
    }
}


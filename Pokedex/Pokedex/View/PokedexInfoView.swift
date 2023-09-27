//
//  PokedexInfoView.swift
//  Pokedex
//
//  Created by Gabriele Namie on 28/08/23.
//

import UIKit

final class PokedexInfoView: UIView {

    private var viewModel: PokedexInfoViewModelProtocol

    init(viewModel: PokedexInfoViewModelProtocol) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        self.viewModel.view = self
        buildView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private lazy var containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var nameStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillProportionally
        return stackView
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    
    private lazy var idLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24)
        label.textColor = .darkGray
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        return label
    }()
    
    private lazy var heightDescription: PokemonInfoView = {
        return PokemonInfoView(title: "Height")
    }()
    
    private lazy var weightDescription: PokemonInfoView = {
        return PokemonInfoView(title: "Weight")
    }()
    
    private lazy var typesDescription: PokemonInfoView = {
        return PokemonInfoView(title: "Types")
    }()
    
    private lazy var abilitiesDescription: PokemonInfoView = {
        return PokemonInfoView(title: "Abilities")
    }()
    
    private lazy var formDescription: PokemonInfoView = {
        return PokemonInfoView(title: "Forms")
    }()

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
    
    private func configure() {
        let detail = viewModel.pokemonDetail
        let types = detail.types.map({$0.type.name.capitalized}).joined(separator: ", ")
        let abilities = detail.abilities.map({$0.ability.name.capitalized}).joined(separator: ", ")
        let forms = detail.forms.map({$0.name.capitalized}).joined(separator: ", ")
        let weight = String(format: "%.1fkg", Double(detail.weight) / 10.0)
        let height = String(format: "%.1fm", Double(detail.height) / 10.0)

        nameLabel.text = detail.name.capitalized
        idLabel.text = "#\(detail.id)"
        heightDescription.setText(height)
        weightDescription.setText(weight)
        typesDescription.setText(types)
        abilitiesDescription.setText(abilities)
        formDescription.setText(forms)

        setImage(id: detail.idString)
    }
}

extension PokedexInfoView: PokedexInfoProtocol {}

extension PokedexInfoView: MinimumViewMethodsProtocol {

    func setupHierarchy() {
        nameStackView.addArrangedSubview(idLabel)
        nameStackView.addArrangedSubview(nameLabel)

        containerStackView.addArrangedSubview(imageView)
        containerStackView.addArrangedSubview(nameStackView)
        containerStackView.addSpacing(18)
        containerStackView.addArrangedSubview(heightDescription)
        containerStackView.addSpacing(9)
        containerStackView.addArrangedSubview(weightDescription)
        containerStackView.addSpacing(18)
        containerStackView.addArrangedSubview(typesDescription)
        containerStackView.addSpacing(18)
        containerStackView.addArrangedSubview(formDescription)
        containerStackView.addSpacing(18)
        containerStackView.addArrangedSubview(abilitiesDescription)

        scrollView.addSubview(containerStackView)
        addSubview(scrollView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            scrollView.widthAnchor.constraint(equalTo: widthAnchor)
        ])

        NSLayoutConstraint.activate([
            containerStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -30),
            containerStackView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10),
            containerStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            containerStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)
        ])
        
        NSLayoutConstraint.activate([
            imageView.widthAnchor.constraint(equalTo: containerStackView.widthAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 250),
        ])
    }
    
    func additionalSetup() {
        backgroundColor = .white
        configure()
    }
}



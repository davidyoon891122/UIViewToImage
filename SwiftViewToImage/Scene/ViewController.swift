//
//  ViewController.swift
//  SwiftViewToImage
//
//  Created by 112751 on 2023/09/06.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "mbti")
        imageView.contentMode = .scaleToFill
        
        return imageView
    }()
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.text = "OOO님의 수익률은 상당하군요."
        label.font = .systemFont(ofSize: 24, weight: .bold)
        
        return label
    }()
    
    
    private lazy var targetView: UIView = {
        let view = UIView()
        
        [
            imageView
        ]
            .forEach {
                view.addSubview($0)
            }
        
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        imageView.addSubview(textLabel)
        
        textLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(16)
            $0.leading.equalToSuperview().offset(16)
        }
        
        return view
    }()
    
    private lazy var createImageButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 8.0
        
        button.setTitle("CreateImage", for: .normal)
        button.setTitleColor(.label, for: .normal)
        
        button.addTarget(self, action: #selector(didTapCreateImageButton), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var moveTestViewButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 8.0
        
        button.setTitle("Move", for: .normal)
        button.setTitleColor(.label, for: .normal)
        
        button.addTarget(self, action: #selector(didTapMoveButton), for: .touchUpInside)
        
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }


}

private extension ViewController {
    func setupViews() {
        view.backgroundColor = .systemBackground
        [
            moveTestViewButton,
            targetView,
            createImageButton
        ]
            .forEach {
                view.addSubview($0)
            }
        
        moveTestViewButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(16)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(50)
        }
        
        targetView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(500)
        }
        
        createImageButton.snp.makeConstraints {
            $0.top.equalTo(targetView.snp.bottom).offset(32)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(50)
        }
    }
    
    @objc
    func didTapCreateImageButton() {
        let createdImage = targetView.asImage()
        
        let showImageVC = ShowImageViewController(image: createdImage)
        present(showImageVC, animated: true)
    }
    
    @objc
    func didTapMoveButton() {
        navigationController?.pushViewController(TestViewController(), animated: true)
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct ViewControllerPreview: PreviewProvider {
    static var previews: some View {
        ViewController()
            .showPreview()
    }
    
}
#endif

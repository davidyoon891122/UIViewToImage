//
//  ShowImageViewController.swift
//  SwiftViewToImage
//
//  Created by 112751 on 2023/09/06.
//

import UIKit
import SnapKit

final class ShowImageViewController: UIViewController {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Show Create Image"
        label.textColor = .label
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24, weight: .bold)
        
        
        return label
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "")
        
        
        return imageView
    }()
    
    private lazy var createPngButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 8.0
        
        button.setTitle("Create PNG", for: .normal)
        button.setTitleColor(.label, for: .normal)
        
        button.addTarget(self, action: #selector(didTapCreatePNGButton), for: .touchUpInside)
        
        return button
    }()
    
    private var targetImage: UIImage
    
    init(image: UIImage?) {
        targetImage = image!
        super.init(nibName: nil, bundle: nil)
        self.imageView.image = image
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

private extension ShowImageViewController {
    func setupViews() {
        view.backgroundColor = .systemBackground
        [
            titleLabel,
            imageView,
            createPngButton
        ]
            .forEach {
                view.addSubview($0)
            }
        
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide)
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        imageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.height.equalTo(500.0)
        }
        
        createPngButton.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).offset(32)
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.height.equalTo(50)
        }
    }
    
    @objc
    func didTapCreatePNGButton() {
        ImageProcesor.saveImageToPngFile(image: targetImage)
    }
}


#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct ShowImageViewControllerPreview: PreviewProvider {
    static var previews: some View {
        ShowImageViewController(image: UIImage(named: ""))
            .showPreview()
    }
    
}
#endif

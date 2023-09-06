//
//  ViewController.swift
//  SwiftViewToImage
//
//  Created by 112751 on 2023/09/06.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        return scrollView
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
    
    private var customView: UIView?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

private extension ViewController {
    func setupViews() {
        view.backgroundColor = .systemBackground
        [
            scrollView,
            createImageButton
        ]
            .forEach {
                view.addSubview($0)
            }
        
        view.backgroundColor = .systemBackground
        
        customView = ImageProcesor.createView(
            image: UIImage(named: "mbti")!,
            title: "최재현님의 9월 첫째주 투자 MBTI",
            content: "상위 5%"
        )
        
        [
            scrollView
        ]
            .forEach {
                view.addSubview($0)
            }
        
        guard let customView = customView else { return }
        
        scrollView.addSubview(customView)
        scrollView.contentSize = customView.bounds.size
        
        scrollView.snp.makeConstraints {
            $0.top.leading.trailing.equalToSuperview()
            $0.bottom.equalTo(createImageButton.snp.top).offset(-16.0)
        }
        
        
        createImageButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(16)
            $0.trailing.equalToSuperview().offset(-16)
            $0.bottom.equalToSuperview()
            $0.height.equalTo(50)
            
        }
    }
    
    @objc
    func didTapCreateImageButton() {
        if let customView = customView {
            ImageProcesor.saveUIImageToPNGFile(image: customView.asImage())
            print("이미지 저장 완료!")
        } else {
            print("이미지가 없어요.")
        }
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct ViewControllerPreview: PreviewProvider {
    static var previews: some View {
        ViewController()
            .showPreview(.iPad)
    }
    
}
#endif

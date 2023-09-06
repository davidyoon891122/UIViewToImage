//
//  TestViewController.swift
//  SwiftViewToImage
//
//  Created by 112751 on 2023/09/06.
//

import UIKit
import SnapKit

final class TestViewController: UIViewController {
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        
        return scrollView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}

private extension TestViewController {
    func setupViews() {
        view.backgroundColor = .systemBackground
        
        let customView = ImageProcesor.createView(
            image: UIImage(named: "mbti")!,
            title: "최재현님의 9월 첫째주 투자 MBTI",
            content: "상위 5%"
        )
        
        ImageProcesor.saveUIImageToPNGFile(image: customView.asImage())
        
        [
            scrollView
        ]
            .forEach {
                view.addSubview($0)
            }
        
        scrollView.addSubview(customView)
        scrollView.contentSize = customView.bounds.size
        
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct TestViewControllerPreview: PreviewProvider {
    static var previews: some View {
        TestViewController()
            .showPreview()
    }
    
}
#endif

//
//  ImageProcessor.swift
//  SwiftViewToImage
//
//  Created by 112751 on 2023/09/06.
//

import UIKit
import SnapKit

final class ImageProcesor {
    static func saveUIImageToPNGFile(image: UIImage) {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let fileName = "target.png"
        let fileURL = documentsDirectory.appendingPathComponent(fileName)
        
        if let imageData = image.pngData() {
            do {
                try imageData.write(to: fileURL)
                print("이미지가 \(fileURL)에 저장 되었어요.")
            } catch {
                print("Error: \(error.localizedDescription)")
                print("에러 발생")
            }
        } else {
            print("이미지 데이터를 찾을 수 없어요.")
        }
    }
    
    static func createView(
        image: UIImage,
        title: String?,
        titleFontSize: CGFloat = 30,
        titleColor: UIColor = .black,
        content: String?,
        contentFontSize: CGFloat = 80,
        contentColor: UIColor = .black,
        offset: CGFloat = 32
    ) -> UIView {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: image.size.width, height: image.size.height))
        
        imageView.image = image
        
        view.addSubview(imageView)

        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        let titleLabel = UILabel()
        titleLabel.text = title
        titleLabel.textColor = titleColor
        titleLabel.font = .systemFont(ofSize: titleFontSize, weight: .bold)
        
        imageView.addSubview(titleLabel)
        
        titleLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(offset)
            $0.leading.equalToSuperview().offset(offset)
        }
        
        if let content = content {
            let contentLabel = UILabel()
            contentLabel.text = content
            contentLabel.textColor = contentColor
            contentLabel.font = .systemFont(ofSize: contentFontSize, weight: .bold)
            imageView.addSubview(contentLabel)
            
            contentLabel.snp.makeConstraints {
                $0.top.equalTo(titleLabel.snp.bottom).offset(offset)
                $0.leading.equalToSuperview().offset(offset)
            }
            
        }
        
        view.layoutIfNeeded()
        
        return view
    }
}

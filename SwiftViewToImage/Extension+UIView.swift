//
//  Extension+UIView.swift
//  SwiftViewToImage
//
//  Created by 112751 on 2023/09/06.
//

import UIKit

extension UIView {
    func asImage() -> UIImage {
        let renderer = UIGraphicsImageRenderer(bounds: bounds)
        return renderer.image { rendererContext in
            layer.render(in: rendererContext.cgContext)
        }
    }
}

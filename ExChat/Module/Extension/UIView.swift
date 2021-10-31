//
//  UIView.swift
//  ExChat
//
//  Created by 김종권 on 2021/10/31.
//

import UIKit

extension UIView {
    func addTipViewToLeftTop(with color: UIColor?) {

        let path = CGMutablePath()
        path.move(to: CGPoint(x: -8, y: 16))
        path.addLine(to: CGPoint(x: 12, y: 16))
        path.addLine(to: CGPoint(x: 12, y: 2))

        let shape = CAShapeLayer()
        shape.path = path
        shape.fillColor = color?.cgColor
        layer.insertSublayer(shape, at: 0)
    }

    func addTipViewToRightBottom(with color: UIColor?) {

        // frame 값을 얻기 위해서 layoutIfNeeded() 호출 (호출 안하면 width, height값 모두 0인 상태)
        layoutIfNeeded()

        print(frame)

        let height = frame.height
        let width = frame.width

        let path = CGMutablePath()
        path.move(to: CGPoint(x: width + 12, y: height - 18))
        path.addLine(to: CGPoint(x: width - 8, y: height - 18))
        path.addLine(to: CGPoint(x: width - 8, y: height - 4))

        let shape = CAShapeLayer()
        shape.path = path
        shape.fillColor = color?.cgColor
        layer.insertSublayer(shape, at: 0)
    }
}

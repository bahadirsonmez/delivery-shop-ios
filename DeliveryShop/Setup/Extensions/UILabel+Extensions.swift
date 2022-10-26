//
//  UILabel+Extensions.swift
//  bolomio
//
//  Created by ssaylanc on 21.10.2020.
//  Copyright © 2020 Serdar Aylanc. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {

    // MARK: - spacingValue is spacing that you need
    func addInterlineSpacing(spacingValue: CGFloat = 2, alignment: NSTextAlignment) {

        // MARK: - Check if there's any text
        guard let textString = text else { return }

        // MARK: - Create "NSMutableAttributedString" with your text
        let attributedString = NSMutableAttributedString(string: textString)

        // MARK: - Create instance of "NSMutableParagraphStyle"
        let paragraphStyle = NSMutableParagraphStyle()

        // MARK: - Actually adding spacing we need to ParagraphStyle
        paragraphStyle.lineSpacing = spacingValue
        paragraphStyle.alignment = alignment
        // MARK: - Adding ParagraphStyle to your attributed String
        attributedString.addAttribute(
            .paragraphStyle,
            value: paragraphStyle,
            range: NSRange(location: 0, length: attributedString.length
        ))

        // MARK: - Assign string that you've modified to current attributed Text
        attributedText = attributedString
    }

    func style(_ font: UIFont, color: UIColor) {
        self.font = font
        self.textColor = color
    }

    func apply(style: Style) {
        backgroundColor = style.backgroundColor
        font = style.font
        textAlignment = style.textAlignment
        lineBreakMode = style.lineBreakMode
        backgroundColor = style.backgroundColor
        numberOfLines = style.numberOfLines ?? 0
        textColor = style.textColor
        translatesAutoresizingMaskIntoConstraints = false
    }

}

extension UILabel {

    struct Style {
        let font: UIFont
        let textAlignment: NSTextAlignment
        let lineBreakMode: NSLineBreakMode
        let backgroundColor: UIColor?
        let numberOfLines: Int?
        let textColor: UIColor

        init(font: UIFont = Constants.Fonts.medium14, textAlignment: NSTextAlignment = .center, lineBreakMode: NSLineBreakMode = .byCharWrapping, backgroundColor: UIColor = .clear, numberOfLines: Int = 0, textColor: UIColor = Constants.Colors.mainTextColor) {
            self.font = font
            self.textAlignment = textAlignment
            self.lineBreakMode = lineBreakMode
            self.backgroundColor = backgroundColor
            self.numberOfLines = numberOfLines
            self.textColor = textColor
        }
    }
}

extension UILabel {

    func addLeading(image: UIImage, text: String) {
        let attachment = NSTextAttachment()
        attachment.image = image

        let imageOffsetY: CGFloat = -8
        attachment.bounds = CGRect(x: 0, y: imageOffsetY, width: attachment.image!.size.width, height: attachment.image!.size.height)

        let attachmentString = NSAttributedString(attachment: attachment)
        let mutableAttributedString = NSMutableAttributedString()
        mutableAttributedString.append(NSMutableAttributedString(string: "  "))
        mutableAttributedString.append(attachmentString)

        let string = NSMutableAttributedString(string: text, attributes: [:])
        mutableAttributedString.append(NSAttributedString(string: "  "))
        mutableAttributedString.append(string)
        self.attributedText = mutableAttributedString
    }
}


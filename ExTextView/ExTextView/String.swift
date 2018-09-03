//
//  String.swift
//  ExTextView
//
//  Created by muhlenXi on 2018/8/30.
//  Copyright © 2018年 muhlenXi. All rights reserved.
//

import UIKit

extension String {
    /// 根据字符串 获取 TextView 字符串的高度
    func getTextViewStringHeightFrom(textViewWidth: CGFloat, font: UIFont, textView: UITextView) -> CGFloat {
        let lineFragmentPading = textView.textContainer.lineFragmentPadding
        let textContainerInset = textView.textContainerInset
        let topOffset = textContainerInset.top
        let bottomOffset = textContainerInset.bottom
        let leadingOffset = textContainerInset.left
        let trailingOffset = textContainerInset.right
        let textContentWidth = textViewWidth-leadingOffset-trailingOffset-lineFragmentPading*2
        let normalText: NSString = self as NSString
        let size = CGSize(width: textContentWidth, height: 1000)
        let attributes = [NSAttributedStringKey.font: font]
        let stringSize = normalText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context:nil).size
        
        return  CGFloat(ceilf(Float(stringSize.height)))+topOffset+bottomOffset
    }
    
    /// 根据字符串 获取 Label 控件的高度
    func getLabelStringHeightFrom(labelWidth: CGFloat, font: UIFont) -> CGFloat {
        let topOffset = CGFloat(0)
        let bottomOffset = CGFloat(0)
        let textContentWidth = labelWidth
        let normalText: NSString = self as NSString
        let size = CGSize(width: textContentWidth, height: 1000)
        let attributes = [NSAttributedStringKey.font: font]
        let stringSize = normalText.boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context:nil).size
        return  CGFloat(ceilf(Float(stringSize.height)))+topOffset+bottomOffset
    }
}

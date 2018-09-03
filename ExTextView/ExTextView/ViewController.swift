//
//  ViewController.swift
//  ExTextView
//
//  Created by muhlenXi on 2018/8/30.
//  Copyright © 2018年 muhlenXi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var textView: UITextView!
    @IBOutlet weak var textViewHeight: NSLayoutConstraint!
    
    
    @IBOutlet weak var testLabel: UILabel!
    @IBOutlet weak var testLabelHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupTextView()
        self.setupTextLabel()
    }

    func setupTextView() {
        let text = "专注EA交易感谢您的留言。不知道您说的延迟是哪方面的。因为，交易速度由多方面的因数影响。专注EA交易感谢您的留言。不知道您说的延迟是哪方面的。因为，交易速度由多方面的因数影响。专注EA交易感谢您的留言。不知道您说的延迟是哪方面的。因为，交易啊啊…"
        let font = UIFont(name: "PingFang SC", size: 16)
        self.textView.text = text
        self.textView.font = font
        let width = UIScreen.main.bounds.size.width - CGFloat(30)
        
        self.textView.textContainer.lineFragmentPadding = 50
        self.textView.textContainerInset = .zero
        
        print(textView.textContainerInset)
        print(textView.textContainer.lineFragmentPadding)
        
        let calHeight = text.getTextViewStringHeightFrom(textViewWidth: width, font: font!, textView: self.textView)
        self.textViewHeight.constant = calHeight
        
        print(calHeight)
        print(textView.font?.lineHeight)
        print((textView.font?.lineHeight)!*8)
        
        let lineHeight = textView.font?.lineHeight ?? CGFloat(22.5)
        self.textViewHeight.constant = lineHeight * CGFloat(4)
    }
   
    
    func setupTextLabel() {
        let text = "专注EA交易感谢您的留言。不知道您说的延迟是哪方面的。因为，交易速度由多方面的因数影响。专注EA交易感谢您的留言。不知道您说的延迟是哪方面的。因为，交易速度由多方面的因数影响。专注EA交易感谢您的留言。不知道您说的延迟是哪方面的。因为，交易啊啊…"
        let font = UIFont(name: "PingFang SC", size: 16)
        self.testLabel.text = text
        self.testLabel.font = font
        self.testLabel.numberOfLines = 0
        
        let width = UIScreen.main.bounds.size.width - CGFloat(30)
        self.testLabelHeight.constant = text.getLabelStringHeightFrom(labelWidth: width, font: font!)
    }
}


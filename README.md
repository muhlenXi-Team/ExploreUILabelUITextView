# ExploreUILabelUITextView
calculate UILabel or UITextView Height

### 精确计算 UITextView 的高度

想要根据 String 来精确的计算 UITextView 的高度的前提是准确的确认 UITextView 中文本内容实际显示的宽度。那么就要从 UITextView 的视图结构入手，通过查阅 Apple 的官方文档得知，UITextView 中的 text 是存放在一个名为 **textContainer** 的容器中，通过 **textContainerInset** 属性可以得到该容器与 UITextView 的内边距，除此之外，还有一个属性影响内容显示的宽度，那就是容器的 **lineFragmentPadding** 属性，该属性用来控制文字的实际显示区域与容器左右两边的边距。

综上，UITextView 的文本内容实际显示区域宽度为：

```swift
let textContentWidth = textViewWidth-leadingOffset-trailingOffset-lineFragmentPading*2
```

所以，我们可以通过以下方法精确计算 UITextView 的宽度：

```Swift
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
}
```



### 精确计算 UILabel 的高度

由于 Label 的实际文本显示的宽度和 UILabel 控件显示的宽度是一致的。因此，我们很方便的通过下面的代码就能算出 UILabel 的高度了。

```swift
extension String {
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
```

*如果有不对的地方欢迎指正！谢谢！*


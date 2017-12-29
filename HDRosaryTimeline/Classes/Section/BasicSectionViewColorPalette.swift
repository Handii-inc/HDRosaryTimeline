import Foundation

class BasicSectionViewColorPalette: SectionViewColorPalette {
    private let borderColor: UIColor
    private let dotColor: UIColor
    private let textColor: UIColor
    
    init(borderColor: UIColor,
         dotColor: UIColor,
         textColor: UIColor)
    {
        self.borderColor = borderColor
        self.dotColor = dotColor
        self.textColor = textColor
    }
    
    //MARK:- SectionViewColorPalette
    public func coloring(titleLabel: UILabel, with font: UIFont)
    {
        let attributes: [NSAttributedStringKey : Any] = [
            .font : font,
            .foregroundColor : self.textColor,
        ]
        titleLabel.attributedText = NSAttributedString(string: titleLabel.text ?? "",
                                                  attributes: attributes)
        return
    }
    
    public func coloring(dot layer: CALayer)
    {
        layer.backgroundColor = self.dotColor.cgColor
        layer.borderColor = self.borderColor.cgColor
        return
    }
    
    public func coloring(shadow layer: CALayer)
    {
        layer.backgroundColor = self.borderColor.cgColor
        return
    }
}

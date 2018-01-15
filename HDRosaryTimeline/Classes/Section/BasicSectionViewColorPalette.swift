import Foundation

class BasicSectionViewColorPalette: SectionViewColorPalette {
    private let borderColor: UIColor
    private let dotColor: UIColor
    private let textColor: UIColor
    private let backGroundColor: UIColor
    
    init(borderColor: UIColor,
         dotColor: UIColor,
         textColor: UIColor,
         backGroundColor: UIColor)
    {
        self.borderColor = borderColor
        self.dotColor = dotColor
        self.textColor = textColor
        self.backGroundColor = backGroundColor
    }
    
    //MARK:- SectionViewColorPalette
    public func colorting(section: UIView)
    {
        section.backgroundColor = self.backGroundColor
        return
    }
    
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

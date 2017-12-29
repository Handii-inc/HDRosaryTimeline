import Foundation

class Normal: HDRosaryTimelineViewStyle {
    init(borderColor: UIColor,
         backGroundColor: UIColor,
         cardMargin: CGFloat,
         cardHeight: CGFloat)
    {
        self.backingField = BackingField(borderColor: borderColor,
                                         backGroundColor: backGroundColor,
                                         titleTextColor: borderColor,
                                         textColor: backGroundColor.invert(),
                                         detailTextColor: backGroundColor.invert().adjust(brightness: 0.4),
                                         cardMargin: cardMargin,
                                         cardHeight: cardHeight)
    }
    
    //MARK:- CellViewColorPalette
    public func coloring(titleLabel: UILabel, with font: UIFont)
    {
        titleLabel.textColor = self.backingField.titleTextColor
        titleLabel.font = font
        return
    }
    
    public func coloring(dot layer: CALayer)
    {
        layer.backgroundColor = self.backingField.backGroundColor.cgColor
        layer.borderColor = self.backingField.borderColor.cgColor
        return
    }
    
    public func coloring(shadow layer: CALayer)
    {
        layer.backgroundColor = self.backingField.borderColor.cgColor
        return
    }

    //MARK:- SectionViewSizeManager
    var gapFromLeft: CGFloat {
        get {
            return 20
        }
    }
    
    var ratioOfDot: CGFloat {
        get {
            return 0.5
        }
    }
    
    var thickness: CGFloat {
        get {
            return 2
        }
    }
    
    var titleFontSize: CGFloat {
        get {
            return 15
        }
    }
    
    //MARK:- SectionViewColorPalette
    func coloring(textLabel: UILabel, with font: UIFont) {
        textLabel.textColor = self.backingField.textColor
        textLabel.font = font
        return
    }
    
    func coloring(detailTextLabel: UILabel, with font: UIFont) {
        detailTextLabel.textColor = self.backingField.detailTextColor
        detailTextLabel.font = font
        return
    }
    
    func coloring(line layer: CALayer) {
        layer.backgroundColor = self.backingField.borderColor.cgColor
        return
    }
    
    func coloring(card layer: CALayer) {
        layer.backgroundColor = self.backingField.backGroundColor.cgColor
        layer.borderColor = self.backingField.borderColor.cgColor
        return
    }

    //MARK:- CellViewSizeManager
    var gapFromRight: CGFloat {
        get {
            return 20
        }
    }
    
    var gapFromLine: CGFloat {
        get {
            return 20
        }
    }
    
    var gapFromSection: CGFloat {
        get {
            return 15
        }
    }
    
    var gapFromLeftEdgeOfCard: CGFloat {
        get {
            return 30
        }
    }
    
    var gapFromRightEdgeOfCard: CGFloat {
        get {
            return 30
        }
    }
    
    var fontSize: CGFloat {
        get {
            return 17
        }
    }
    
    var detailFontSize: CGFloat {
        get {
            return 13
        }
    }
    
    func height(of _: Single) -> CGFloat {
        return self.backingField.cardMargin
            + self.backingField.cardHeight
            + self.backingField.cardMargin
    }
    
    func height(of _: Top) -> CGFloat {
        return self.backingField.cardMargin
            + self.backingField.cardHeight
    }
    
    func height(of _: Middle) -> CGFloat {
        return self.backingField.cardHeight
    }
    
    func height(of _: Bottom) -> CGFloat {
        return self.backingField.cardHeight
            + self.backingField.cardMargin
    }
    
    func height(of _: SingleOfLastSection) -> CGFloat {
        return self.height(of: Single())
    }
    
    func height(of _: TopOfLastSection) -> CGFloat {
        return self.height(of: Top())
    }
    
    func height(of _: MiddleOfLastSection) -> CGFloat {
        return self.height(of: Middle())
    }
    
    func height(of _: BottomOfLastSection) -> CGFloat {
        return self.height(of: Bottom())
    }
    
    //Backingfield
    private let backingField : BackingField
    
    class BackingField {
        let borderColor: UIColor
        let backGroundColor: UIColor
        let titleTextColor: UIColor
        let textColor: UIColor
        let detailTextColor: UIColor
        let cardMargin: CGFloat
        let cardHeight: CGFloat
        
        init(borderColor: UIColor,
             backGroundColor: UIColor,
             titleTextColor: UIColor,
             textColor: UIColor,
             detailTextColor: UIColor,
             cardMargin: CGFloat,
             cardHeight: CGFloat)
        {
            self.borderColor = borderColor
            self.backGroundColor = backGroundColor
            self.titleTextColor = titleTextColor
            self.textColor = textColor
            self.detailTextColor = detailTextColor
            self.cardMargin = cardMargin
            self.cardHeight = cardHeight
        }
    }
}

import Foundation

class Normal: HDRosaryTimelineViewStyle {
    private let borderColor: UIColor
    private let backGroundColor: UIColor
    private let dotColor: UIColor
    private let titleTextColor: UIColor
    private let textColor: UIColor
    private let detailTextColor: UIColor
    private let cardMargin: CGFloat
    private let cardHeight: CGFloat
    
    init(borderColor: UIColor,
         backGroundColor: UIColor,
         dotColor: UIColor,
         cardMargin: CGFloat,
         cardHeight: CGFloat)
    {
        self.borderColor = borderColor
        self.backGroundColor = backGroundColor
        self.dotColor = dotColor
        self.titleTextColor = borderColor
        self.textColor = backGroundColor.invert()
        self.detailTextColor = backGroundColor.invert().adjust(brightness: 0.5)
        self.cardMargin = cardMargin
        self.cardHeight = cardHeight
    }
    
    //MARK:- CellViewColorPalette
    func coloring(cell: UIView) {
        cell.backgroundColor = self.backGroundColor
    }
    
    func coloring(titleLabel: UILabel, with font: UIFont)
    {
        titleLabel.textColor = self.titleTextColor
        titleLabel.font = font
        return
    }
    
    func coloring(dot layer: CALayer)
    {
        layer.backgroundColor = self.dotColor.cgColor
        layer.borderColor = self.borderColor.cgColor
        return
    }
    
    func coloring(shadow layer: CALayer)
    {
        layer.backgroundColor = self.borderColor.cgColor
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
    func colorting(section: UIView) {
        section.backgroundColor = self.backGroundColor
    }
    
    func coloring(textLabel: UILabel, with font: UIFont) {
        textLabel.textColor = self.textColor
        textLabel.font = font
        return
    }
    
    func coloring(detailTextLabel: UILabel, with font: UIFont) {
        detailTextLabel.textColor = self.detailTextColor
        detailTextLabel.font = font
        return
    }
    
    func coloring(line layer: CALayer) {
        layer.backgroundColor = self.borderColor.cgColor
        return
    }
    
    func coloring(card layer: CALayer) {
        layer.backgroundColor = self.backGroundColor.cgColor
        layer.borderColor = self.borderColor.cgColor
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
        return self.cardMargin
            + self.cardHeight
            + self.cardMargin
    }
    
    func height(of _: Top) -> CGFloat {
        return self.cardMargin
            + self.cardHeight
    }
    
    func height(of _: Middle) -> CGFloat {
        return self.cardHeight
    }
    
    func height(of _: Bottom) -> CGFloat {
        return self.cardHeight
            + self.cardMargin
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
}

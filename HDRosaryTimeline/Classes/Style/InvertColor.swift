import Foundation

class InvertColor: HDRosaryTimelineViewStyle {
    private let original: HDRosaryTimelineViewStyle
    
    init(original: HDRosaryTimelineViewStyle)
    {
        self.original = original
    }
    
    func colorting(section: UIView) {
        self.original.colorting(section: section)
    }

    func coloring(titleLabel: UILabel, with font: UIFont) {
        self.original.coloring(titleLabel: titleLabel, with: font)
    }
    
    func coloring(dot layer: CALayer) {
        self.original.coloring(dot: layer)
        layer.backgroundColor = layer.borderColor
    }
    
    func coloring(shadow layer: CALayer) {
        self.original.coloring(shadow: layer)
    }
    
    var gapFromLeft: CGFloat {
        get {
            return self.original.gapFromLeft
        }
    }
    
    var ratioOfDot: CGFloat {
        get {
            return self.original.ratioOfDot
        }
    }
    
    var thickness: CGFloat {
        get {
            return self.original.thickness
        }
    }
    
    var titleFontSize: CGFloat {
        get {
            return self.original.titleFontSize
        }
    }
    
    func coloring(cell: UIView) {
        self.original.coloring(cell: cell)
    }

    func coloring(textLabel: UILabel, with font: UIFont) {
        self.original.coloring(textLabel: textLabel, with: font)
        textLabel.textColor = textLabel.textColor.invert()
    }
    
    func coloring(detailTextLabel: UILabel, with font: UIFont) {
        self.original.coloring(detailTextLabel: detailTextLabel, with: font)
        detailTextLabel.textColor = detailTextLabel.textColor.invert()
    }
    
    func coloring(line layer: CALayer) {
        self.original.coloring(line: layer)
    }
    
    func coloring(card layer: CALayer) {
        self.original.coloring(card: layer)
        layer.backgroundColor = layer.borderColor
    }
    
    var gapFromRight: CGFloat {
        get {
            return self.original.gapFromRight
        }
    }
    
    var gapFromLine: CGFloat {
        get {
            return self.original.gapFromLine
        }
    }
    
    var gapFromSection: CGFloat {
        get {
            return self.original.gapFromSection
        }
    }
    
    var gapFromLeftEdgeOfCard: CGFloat {
        get {
            return self.original.gapFromLeftEdgeOfCard
        }
    }
    
    var gapFromRightEdgeOfCard: CGFloat {
        get {
            return self.original.gapFromRightEdgeOfCard
        }
    }
    
    var fontSize: CGFloat {
        get {
            return self.original.fontSize
        }
    }
    
    var detailFontSize: CGFloat {
        get {
            return self.original.detailFontSize
        }
    }
    
    func height(of _: Single) -> CGFloat {
        return self.original.height(of: Single())
    }
    
    func height(of _: Top) -> CGFloat {
        return self.original.height(of: Top())
    }
    
    func height(of _: Middle) -> CGFloat {
        return self.original.height(of: Middle())
    }
    
    func height(of _: Bottom) -> CGFloat {
        return self.original.height(of: Bottom())
    }
    
    func height(of _: SingleOfLastSection) -> CGFloat {
        return self.original.height(of: SingleOfLastSection())
    }
    
    func height(of _: TopOfLastSection) -> CGFloat {
        return self.original.height(of: TopOfLastSection())
    }
    
    func height(of _: MiddleOfLastSection) -> CGFloat {
        return self.original.height(of: MiddleOfLastSection())
    }
    
    func height(of _: BottomOfLastSection) -> CGFloat {
        return self.original.height(of: BottomOfLastSection())
    }
}

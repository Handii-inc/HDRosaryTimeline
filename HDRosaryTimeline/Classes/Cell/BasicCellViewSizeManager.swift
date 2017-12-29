import Foundation

class BasicCellViewSizeManager : CellViewSizeManager {
    private let height: CGFloat
    private let margin: CGFloat
    private let textFontSize: CGFloat
    private let detailTextFontSize: CGFloat
    
    init(height: CGFloat,
         margin: CGFloat,
         textFontSize: CGFloat,
         detailTextFontSize: CGFloat)
    {
        self.height = height
        self.margin = margin
        self.textFontSize = textFontSize
        self.detailTextFontSize = detailTextFontSize
    }

    public var gapFromLeft: CGFloat { get { return 20 } }
    public var gapFromRight: CGFloat { get { return 20 } }
    public var gapFromLine: CGFloat { get { return 20 } }
    public var gapFromSection: CGFloat { get { return 15 } }
    public var gapFromLeftEdgeOfCard: CGFloat { get { return 30 } }
    public var gapFromRightEdgeOfCard: CGFloat { get { return 30 } }
    public var thickness: CGFloat { get { return 2 } }
    public var fontSize: CGFloat { get { return self.textFontSize } }
    public var detailFontSize: CGFloat { get { return self.detailTextFontSize } }

    func height(of _: Single) -> CGFloat {
        return self.margin + self.height + self.margin
    }
    
    func height(of _: Top) -> CGFloat {
        return self.margin + self.height
    }
    
    func height(of _: Middle) -> CGFloat {
        return self.height
    }
    
    func height(of _: Bottom) -> CGFloat {
        return self.height + self.margin
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

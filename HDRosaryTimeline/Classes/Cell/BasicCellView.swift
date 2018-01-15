import UIKit

class BasicCellView<P: CellPosition>: BasicCellViewAdaptor, CellView {
    //MARK:- Sublayers
    private lazy var card: CALayer = {
        let layer = CALayer()
        layer.cornerRadius = 15
        return layer
    }()
    private lazy var line = CALayer()
    private lazy var hideUpperOfCard = CALayer()
    private lazy var hideLowerOfCard = CALayer()
    
    //MARK:- Initializer
    public override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)

        self.contentView.layer.addSublayer(self.line)
        self.contentView.layer.addSublayer(self.card)
        self.contentView.layer.addSublayer(self.hideUpperOfCard)
        self.contentView.layer.addSublayer(self.hideLowerOfCard)

        self.detailTextLabel?.textAlignment = .right
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- UIView
    open override func layoutSubviews() {
        super.layoutSubviews()
        
        guard let sizeManagerNotNil = self.sizeManager else { return }
        
        self.colorPalette?.coloring(cell: self)
        self.colorPalette?.coloring(line: self.line)
        self.line.frame = CGRect(x: sizeManagerNotNil.gapFromLeft - sizeManagerNotNil.thickness * 0.5,
                                 y: 0,
                                 width: sizeManagerNotNil.thickness,
                                 height: self.frame.height)

        P.init().cell(self)
        self.card.borderWidth = sizeManagerNotNil.thickness
        
        self.hideUpperOfCard.frame = CGRect(x: self.card.frame.minX + self.card.borderWidth,
                                            y: self.card.frame.minY - 0.1,
                                            width: self.card.frame.width - self.card.borderWidth * 2,
                                            height: self.card.borderWidth + 0.15)
        self.hideLowerOfCard.frame = CGRect(x: self.hideUpperOfCard.frame.minX,
                                            y: self.card.frame.maxY - self.card.borderWidth - 0.1,
                                            width: self.card.frame.width - self.card.borderWidth * 2,
                                            height: self.card.borderWidth + 0.15)
        
        let textPadding: CGFloat = 20
        let textWidth: CGFloat
            = self.card.frame.width
            - (sizeManagerNotNil.gapFromLeftEdgeOfCard + sizeManagerNotNil.gapFromRightEdgeOfCard)
        let textHeight: CGFloat = self.card.frame.height * 0.5 - textPadding
        
        if let textLabelNotNil = self.textLabel {
            colorPalette?.coloring(textLabel: textLabelNotNil,
                                   with: UIFont.systemFont(ofSize: sizeManagerNotNil.fontSize))
            textLabelNotNil.frame = CGRect(x: self.card.frame.minX + sizeManagerNotNil.gapFromLeftEdgeOfCard,
                                           y: self.card.frame.minY + textPadding,
                                           width: textWidth,
                                           height: textHeight)
        }
        if let detailTextLabelNotNil = self.detailTextLabel {
            colorPalette?.coloring(detailTextLabel: detailTextLabelNotNil,
                                   with: UIFont.systemFont(ofSize: sizeManagerNotNil.detailFontSize))
            detailTextLabelNotNil.frame = CGRect(x: self.card.frame.minX + sizeManagerNotNil.gapFromLeftEdgeOfCard,
                                                 y: self.card.frame.maxY - (textHeight + textPadding),
                                                 width: textWidth,
                                                 height: textHeight)
        }
    }
    
    //MARK:- CellView
    func layout(on _: Single) {
        guard let sizeManagerNotNil = self.sizeManager else { return }
        
        let xOfCard = self.line.frame.minX + sizeManagerNotNil.gapFromLine
        let yOfCard = sizeManagerNotNil.gapFromSection
        self.card.frame = CGRect(x: xOfCard,
                                 y: yOfCard,
                                 width: self.contentView.frame.width - xOfCard - sizeManagerNotNil.gapFromRight,
                                 height: self.contentView.frame.height - yOfCard - sizeManagerNotNil.gapFromSection)
        self.colorPalette?.coloring(card: self.card)

        self.hideUpperOfCard.backgroundColor = UIColor.clear.cgColor
        self.hideLowerOfCard.backgroundColor = UIColor.clear.cgColor

        return
    }
    
    func layout(on _: Top) {
        guard let sizeManagerNotNil = self.sizeManager else { return }
        
        let xOfCard = self.line.frame.minX + sizeManagerNotNil.gapFromLine
        let yOfCard = sizeManagerNotNil.gapFromSection
        self.card.frame = CGRect(x: xOfCard,
                                 y: yOfCard,
                                 width: self.contentView.frame.width - xOfCard - sizeManagerNotNil.gapFromRight,
                                 height: self.contentView.frame.height - yOfCard)
        self.colorPalette?.coloring(card: self.card)

        self.card.maskedCorners = [
            .layerMinXMinYCorner,
            .layerMaxXMinYCorner
        ]

        self.hideUpperOfCard.backgroundColor = UIColor.clear.cgColor
        self.hideLowerOfCard.backgroundColor = self.card.backgroundColor
        
        return
    }
    
    func layout(on _: Middle) {
        guard let sizeManagerNotNil = self.sizeManager else { return }
        
        let xOfCard = self.line.frame.minX + sizeManagerNotNil.gapFromLine
        self.card.frame = CGRect(x: xOfCard,
                                 y: 0,
                                 width: self.contentView.frame.width - xOfCard - sizeManagerNotNil.gapFromRight,
                                 height: self.contentView.frame.height)
        self.colorPalette?.coloring(card: self.card)

        self.card.maskedCorners = []

        self.hideUpperOfCard.backgroundColor = self.card.backgroundColor
        self.hideLowerOfCard.backgroundColor = self.card.backgroundColor
        
        return
    }
    
    func layout(on _: Bottom) {
        guard let sizeManagerNotNil = self.sizeManager else { return }
        
        let xOfCard = self.line.frame.minX + sizeManagerNotNil.gapFromLine
        self.card.frame = CGRect(x: xOfCard,
                                 y: 0,
                                 width: self.contentView.frame.width - xOfCard - sizeManagerNotNil.gapFromRight,
                                 height: self.contentView.frame.height - sizeManagerNotNil.gapFromSection)
        self.colorPalette?.coloring(card: self.card)

        self.card.maskedCorners = [
            .layerMinXMaxYCorner,
            .layerMaxXMaxYCorner
        ]

        self.hideUpperOfCard.backgroundColor = self.card.backgroundColor
        self.hideLowerOfCard.backgroundColor = UIColor.clear.cgColor
        
        return
    }
    
    func layout(on _: SingleOfLastSection) {
        self.layout(on: Single())
        self.line.backgroundColor = UIColor.clear.cgColor
        return
    }
    
    func layout(on _: TopOfLastSection) {
        self.layout(on: Top())
        self.line.backgroundColor = UIColor.clear.cgColor
        return
    }
    
    func layout(on _: MiddleOfLastSection) {
        self.layout(on: Middle())
        self.line.backgroundColor = UIColor.clear.cgColor
        return
    }
    
    func layout(on _: BottomOfLastSection) {
        self.layout(on: Bottom())
        self.line.backgroundColor = UIColor.clear.cgColor
        return
    }
}

import UIKit

open class HDRosaryTimelineViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //MARK:- Sub components
    private lazy var table: UITableView = {
        let view = UITableView(frame: .zero, style: .plain)
        view.dataSource = self
        view.delegate = self
        view.allowsSelection = false
        
        CellQueueUtility.register(cellOn: Single(), to: view)
        CellQueueUtility.register(cellOn: Top(), to: view)
        CellQueueUtility.register(cellOn: Middle(), to: view)
        CellQueueUtility.register(cellOn: Bottom(), to: view)
        CellQueueUtility.register(cellOn: SingleOfLastSection(), to: view)
        CellQueueUtility.register(cellOn: TopOfLastSection(), to: view)
        CellQueueUtility.register(cellOn: MiddleOfLastSection(), to: view)
        CellQueueUtility.register(cellOn: BottomOfLastSection(), to: view)
        
        CellQueueUtility.register(cellOn: Single(), to: view, with: Constants.invert)
        CellQueueUtility.register(cellOn: Top(), to: view, with: Constants.invert)
        CellQueueUtility.register(cellOn: Middle(), to: view, with: Constants.invert)
        CellQueueUtility.register(cellOn: Bottom(), to: view, with: Constants.invert)
        CellQueueUtility.register(cellOn: SingleOfLastSection(), to: view, with: Constants.invert)
        CellQueueUtility.register(cellOn: TopOfLastSection(), to: view, with: Constants.invert)
        CellQueueUtility.register(cellOn: MiddleOfLastSection(), to: view, with: Constants.invert)
        CellQueueUtility.register(cellOn: BottomOfLastSection(), to: view, with: Constants.invert)
        
        return view
    }()

    //MARK:- Initializer
    public init(borderColor: UIColor,
                backGroundColor: UIColor)
    {
        self.style = Normal(borderColor: borderColor,
                            backGroundColor: backGroundColor,
                            dotColor: backGroundColor,
                            cardMargin: Constants.cardMargin,
                            cardHeight: Constants.cardHeight)
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Properties
    private let style: HDRosaryTimelineViewStyle
    private lazy var invertStyle: HDRosaryTimelineViewStyle = InvertColor(original: self.style)

    public weak var dataSource: HDRosaryTimelineViewDataSource?

    private class Constants {
        static let invert = "INVERT"
        static let cardMargin: CGFloat = 25
        static let cardHeight: CGFloat = 100
        static let sectionHeight: CGFloat = 30
    }

    //MARK:- Life cycle events
    open override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.addSubview(self.table)
    }
    
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.table.frame = CGRect(x: 0,
                                  y: 0,
                                  width: self.view.frame.width,
                                  height: self.view.frame.height)
        self.table.separatorStyle = .none
    }
    
    //MARK:- UITableViewDelegate
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return Constants.sectionHeight
    }
    
    public func tableView(_ tableView: UITableView,
                          viewForHeaderInSection section: Int) -> UIView?
    {
        guard let dataSourceNotNil = self.dataSource else { return nil }
        guard let position = createPosition(of: section, in: dataSourceNotNil) else { return nil }
        
        let style = self.isInvert(section: section) ? self.invertStyle : self.style
        let view = BasicSectionView(colorPalette: style,
                                    sizeManager: style,
                                    on: position)
        view.text = self.tableView(tableView, titleForHeaderInSection: section)
        
        return view
    }
    
    public func tableView(_ tableView: UITableView,
                          heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        guard let dataSourceNotNil = self.dataSource else { return 0 }
        guard let positionNotNil = createPosition(of: indexPath, in: dataSourceNotNil) else { return 0 }
        return positionNotNil.height(self.style)
    }
    
    //MARK:- UITableViewDataSource
    public func numberOfSections(in tableView: UITableView) -> Int
    {
        guard let dataSourceNotNil = self.dataSource else { return 0 }
        return dataSourceNotNil.getNumberOfSections()
    }
    
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        guard let dataSourceNotNil = self.dataSource else { return nil }
        return dataSourceNotNil.getHeaderText(at: section)
    }
    
    public func tableView(_ tableView: UITableView,
                          numberOfRowsInSection section: Int) -> Int
    {
        guard let dataSourceNotNil = self.dataSource else { return 0 }
        return dataSourceNotNil.getNumberOfItems(in: section)
    }
    
    public func tableView(_ tableView: UITableView,
                          cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        guard let cell = self.isInvert(section: indexPath.section)
            ? CellQueueUtility.dequeue(cellFor: indexPath, from: tableView, with: self.dataSource)
            : CellQueueUtility.dequeue(cellFor: indexPath, for: Constants.invert, from: tableView, with: self.dataSource) else {
            return UITableViewCell()
        }
        
        let style = self.isInvert(section: indexPath.section) ? self.invertStyle : self.style
        cell.sizeManager = style
        cell.colorPalette = style
        cell.textLabel?.text = self.dataSource?.getText(at: indexPath)
        cell.detailTextLabel?.text = self.dataSource?.getDetailText(at: indexPath)
        return cell
    }
    
    //MARK:- Others
    /**
     Please override me, if you want to invert color of some sections.
     */
    open func isInvert(section: Int) -> Bool {
        return false
    }
    
    private class CellQueueUtility {
        static func cellReuseIdentifier(of: CellPosition,
                                        with prefix: String?) -> String
        {
            if let prefixNotNil = prefix {
                return prefixNotNil + CellQueueUtility.cellReuseIdentifier(of: of, with: nil)
            }
            return String(describing: type(of: of))
        }
        
        static func register<T: CellPosition>(cellOn position: T,
                                              to: UITableView,
                                              with prefix: String? = nil)
        {
            to.register(BasicCellView<T>.self,
                        forCellReuseIdentifier: cellReuseIdentifier(of: position, with: prefix))
            return
        }
        
        static func dequeue(cellFor indexPath: IndexPath,
                            for prefix: String? = nil,
                            from table: UITableView,
                            with dataSource: HDRosaryTimelineViewDataSource?) -> BasicCellViewAdaptor?
        {
            guard let dataSourceNotNil = dataSource else {
                return nil
            }
            
            guard let position = createPosition(of: indexPath, in: dataSourceNotNil) else {
                return nil
            }
            
            let reuseIdentifier = CellQueueUtility.cellReuseIdentifier(of: position,
                                                                       with: prefix)
            guard let cell = table.dequeueReusableCell(withIdentifier: reuseIdentifier) as? BasicCellViewAdaptor else {
                return nil
            }
            return cell
        }
    }
}

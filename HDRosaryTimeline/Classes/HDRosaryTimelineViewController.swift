import UIKit

open class HDRosaryTimelineViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    //MARK:- Sub components
    private lazy var table: UITableView = {
        let view = UITableView(frame: .zero, style: .plain)
        view.dataSource = self
        view.delegate = self
        view.allowsSelection = false
        
        view.register(BasicCellView<Single>.self, forCellReuseIdentifier: String(describing: type(of: Single())))
        view.register(BasicCellView<Top>.self, forCellReuseIdentifier: String(describing: type(of: Top())))
        view.register(BasicCellView<Middle>.self, forCellReuseIdentifier: String(describing: type(of: Middle())))
        view.register(BasicCellView<Bottom>.self, forCellReuseIdentifier: String(describing: type(of: Bottom())))
        view.register(BasicCellView<SingleOfLastSection>.self, forCellReuseIdentifier: String(describing: type(of: SingleOfLastSection())))
        view.register(BasicCellView<TopOfLastSection>.self, forCellReuseIdentifier: String(describing: type(of: TopOfLastSection())))
        view.register(BasicCellView<MiddleOfLastSection>.self, forCellReuseIdentifier: String(describing: type(of: MiddleOfLastSection())))
        view.register(BasicCellView<BottomOfLastSection>.self, forCellReuseIdentifier: String(describing: type(of: BottomOfLastSection())))
        
        return view
    }()
    
    //MARK:- Properties
    public weak var dataSource: HDRosaryTimelineViewDataSource?
    private let style: HDRosaryTimelineViewStyle = Normal(borderColor: .black,
                                                          backGroundColor: .white,
                                                          cardMargin: 25,
                                                          cardHeight: 100)
        
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
        return 30
    }
    
    public func tableView(_ tableView: UITableView,
                          viewForHeaderInSection section: Int) -> UIView?
    {
        guard let dataSourceNotNil = self.dataSource else { return nil }
        guard let position = createPosition(of: section, in: dataSourceNotNil) else { return nil }
        
        let view = BasicSectionView(colorPalette: self.style,
                                    sizeManager: self.style,
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
        guard let cell = self.generate(cellForRowAt: indexPath) else {
            return UITableViewCell()
        }
        return cell
    }
    
    private func generate(cellForRowAt indexPath: IndexPath) -> UITableViewCell?
    {
        guard let dataSourceNotNil = self.dataSource else { return nil }
        guard let position = createPosition(of: indexPath, in: dataSourceNotNil) else { return nil }
        let reuseIdentifier = String(describing: type(of: position))
        guard let cell = self.table.dequeueReusableCell(withIdentifier: reuseIdentifier) as? BasicCellViewAdaptor else { return nil }
        cell.sizeManager = self.style
        cell.colorPalette = self.style
        cell.textLabel?.text = dataSourceNotNil.getText(at: indexPath)
        cell.detailTextLabel?.text = dataSourceNotNil.getDetailText(at: indexPath)
        return cell
    }

}

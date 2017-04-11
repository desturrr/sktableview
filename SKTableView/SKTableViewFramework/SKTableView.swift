//
// Created by suat.karakusoglu on 11/04/2017.
// Copyright (c) 2017 sk.tableview. All rights reserved.
//

import UIKit

class SKTableView: UITableView, UITableViewDataSource, UITableViewDelegate {

    var tableDatas: [SKTableData] = [SKTableData]()
    private var alreadyRegisteredTableCellIdentifiers: [String] = []

    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        self.delegate = self
        self.dataSource = self
    }

    override init(frame: CGRect, style: UITableViewStyle)
    {
        super.init(frame: frame, style: style)
        self.delegate = self
        self.dataSource = self
    }

    convenience init(tableDatas: [SKTableData], frame: CGRect, tableViewStyle: UITableViewStyle = UITableViewStyle.plain)
    {
        self.init(frame: frame, style: tableViewStyle)
        self.tableDatas = tableDatas
        self.registerTableModels(tableDatas: tableDatas)
    }

    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return self.tableDatas[section].headerModel?.viewHeight() ?? 0.0
    }

    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return self.tableDatas[section].footerModel?.viewHeight() ?? 0.0
    }

    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView?
    {
        guard let headerModel = self.tableDatas[section].headerModel else { return nil }
        let headerView = Bundle.main.loadNibNamed(headerModel.viewTypeIdentifier(), owner: nil)![0] as! SKTableReusableView
        headerView.applyReusableModel(reusableModel: headerModel)
        return headerView
    }

    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView?
    {
        guard let footerModel = self.tableDatas[section].footerModel else { return nil }
        let footerView = Bundle.main.loadNibNamed(footerModel.viewTypeIdentifier(), owner: nil)![0] as! SKTableReusableView
        footerView.applyReusableModel(reusableModel: footerModel)
        return footerView
    }

    public func numberOfSections(in tableView: UITableView) -> Int {
        return self.tableDatas.count
    }

    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableDatas[section].models.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let currentTableModel = self.getModelAtIndexPath(indexPath: indexPath)
        if let currentTableCell = tableView.dequeueReusableCell(withIdentifier: currentTableModel.cellTypeIdentifier(), for: indexPath) as? SKTableCell
        {
            currentTableCell.applyModel(tableModel: currentTableModel)
            return currentTableCell
        }
        fatalError("Cell identifier related cell is not found !")
    }

    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let tableModel = self.getModelAtIndexPath(indexPath: indexPath)
        return tableModel.cellHeight()
    }

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let tableModel = self.getModelAtIndexPath(indexPath: indexPath)
        tableModel.selectionBlock?()
    }

    private func registerTableModels(tableDatas:[SKTableData])
    {
        tableDatas.forEach { (tableData: SKTableData) in
            tableData.models.forEach { (tableModel: SKTableModel) in
                self.registerCellFor(tableModelToRegister: tableModel)
             }
        }
    }

    private func registerCellFor(tableModelToRegister: SKTableModel)
    {
        let reuseIdentifier = tableModelToRegister.cellTypeIdentifier()
        let isAlreadyRegistered = self.alreadyRegisteredTableCellIdentifiers.contains{ $0 == reuseIdentifier}
        guard !isAlreadyRegistered else { return }
        let nibCell = UINib(nibName: reuseIdentifier, bundle: nil)
        self.register(nibCell, forCellReuseIdentifier: reuseIdentifier)
        self.alreadyRegisteredTableCellIdentifiers.append(reuseIdentifier)
    }

    private func getModelAtIndexPath(indexPath: IndexPath) -> SKTableModel
    {
        return self.tableDatas[indexPath.section].models[indexPath.row]
    }

    func buildTableDatas(tableDatas: [SKTableData]) -> SKTableView
    {
        self.tableDatas = tableDatas
        self.registerTableModels(tableDatas: tableDatas)
        self.reloadData()
        return self
    }
}

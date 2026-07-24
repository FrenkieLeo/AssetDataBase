# 资产管理流程

## 1. 购置 / 入库

需要记录：

- 资产名称、类别、品牌、型号、序列号
- 购置日期、金额、币种、供应商
- 初始部门、责任人、地点
- 保修截止日期和折旧年限

维护动作：

1. 在 `data/assets.csv` 新增资产主档。
2. 在 `data/asset_events.csv` 追加 `purchase` 或 `register` 事件。

## 2. 领用 / 调拨

需要记录：

- 资产编号
- 原部门、原责任人、原地点
- 新部门、新责任人、新地点
- 调拨日期、经办人、审批或单据编号

维护动作：

1. 更新 `data/assets.csv` 中该资产的 `department`、`owner`、`location`、`status`、`last_updated`。
2. 在 `data/asset_events.csv` 追加 `assign` 或 `transfer` 事件。

## 3. 维修

需要记录：

- 资产编号
- 故障描述
- 维修开始日期、完成日期
- 维修费用、供应商或维修人
- 维修结果

维护动作：

1. 维修开始时，将主档 `status` 改为 `repairing`，追加 `repair_start` 事件。
2. 维修完成时，将主档 `status` 改为 `in_use` 或 `in_stock`，追加 `repair_done` 事件。

## 4. 盘点

需要记录：

- 盘点日期
- 盘点人
- 资产是否在账、在位、状态是否正常
- 差异说明

维护动作：

1. 对有差异的资产更新主档。
2. 对所有关键资产或差异资产追加 `inventory_check` 事件。

## 5. 报废 / 处置

需要记录：

- 资产编号
- 报废原因
- 审批编号
- 处置收入或成本
- 处置日期

维护动作：

1. 将 `data/assets.csv` 中该资产 `status` 改为 `disposed`。
2. 在 `data/asset_events.csv` 追加 `dispose` 事件。

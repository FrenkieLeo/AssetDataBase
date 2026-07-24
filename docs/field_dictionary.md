# 字段字典

## `data/assets.csv`

| 字段 | 必填 | 说明 | 示例 |
|---|---:|---|---|
| `asset_id` | 是 | 资产唯一编号，建议格式 `OA-YYYY-0001` | `OA-2026-0001` |
| `asset_name` | 是 | 资产名称 | `ThinkPad X1 Carbon` |
| `category` | 是 | 资产类别 | `电脑设备` |
| `brand` | 否 | 品牌 | `Lenovo` |
| `model` | 否 | 型号 | `X1 Carbon Gen 12` |
| `serial_number` | 否 | 序列号/机身号 | `PF5XXXXX` |
| `purchase_date` | 否 | 购置日期，格式 `YYYY-MM-DD` | `2026-07-24` |
| `purchase_price` | 否 | 含税或实际入账金额，口径在备注中说明 | `8999` |
| `currency` | 否 | 币种，默认 `CNY` | `CNY` |
| `vendor` | 否 | 供应商/购买渠道 | `京东自营` |
| `department` | 否 | 当前使用部门 | `行政部` |
| `owner` | 否 | 当前责任人/使用人 | `张三` |
| `location` | 否 | 当前存放地点 | `上海办公室 A 区` |
| `status` | 是 | 当前状态：`in_stock`、`in_use`、`repairing`、`lost`、`disposed` | `in_use` |
| `warranty_end_date` | 否 | 保修截止日期，格式 `YYYY-MM-DD` | `2029-07-23` |
| `depreciation_years` | 否 | 折旧年限 | `3` |
| `notes` | 否 | 备注 | `含鼠标和电源适配器` |
| `last_updated` | 是 | 主档最后更新时间，格式 `YYYY-MM-DD` | `2026-07-24` |

## `data/asset_events.csv`

| 字段 | 必填 | 说明 | 示例 |
|---|---:|---|---|
| `event_id` | 是 | 事件唯一编号，建议格式 `EVT-YYYYMMDD-0001` | `EVT-20260724-0001` |
| `event_date` | 是 | 业务发生日期，格式 `YYYY-MM-DD` | `2026-07-24` |
| `asset_id` | 是 | 对应资产编号 | `OA-2026-0001` |
| `event_type` | 是 | 事件类型，见下表 | `transfer` |
| `from_department` | 否 | 调出部门 | `行政部` |
| `to_department` | 否 | 调入部门 | `研发部` |
| `from_owner` | 否 | 原责任人 | `张三` |
| `to_owner` | 否 | 新责任人 | `李四` |
| `from_location` | 否 | 原地点 | `上海办公室 A 区` |
| `to_location` | 否 | 新地点 | `上海办公室 B 区` |
| `amount` | 否 | 涉及金额，如维修费、处置收入 | `300` |
| `currency` | 否 | 币种 | `CNY` |
| `handler` | 否 | 经办人 | `行政专员` |
| `document_ref` | 否 | 单据、合同、发票或审批编号 | `PO-2026-001` |
| `notes` | 否 | 备注 | `屏幕维修` |
| `created_at` | 是 | 记录创建时间，格式 `YYYY-MM-DD HH:MM` | `2026-07-24 10:30` |

## 事件类型

| `event_type` | 含义 |
|---|---|
| `register` | 补录历史资产 |
| `purchase` | 新购置 |
| `stock_in` | 入库 |
| `assign` | 领用/分配 |
| `transfer` | 调拨 |
| `repair_start` | 开始维修 |
| `repair_done` | 维修完成 |
| `inventory_check` | 盘点 |
| `loss` | 遗失 |
| `dispose` | 报废/处置 |

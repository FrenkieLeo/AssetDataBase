# AssetDataBase

办公固定资产明细数据库，用于通过 ChatGPT / Codex 持续维护公司的资产主档与全生命周期流水。

## 用途

- 记录固定资产主档：资产编号、名称、类别、使用部门、责任人、存放地点、状态、购置金额等。
- 记录资产事件流水：购置、入库、领用、调拨、维修、盘点、报废、处置等。
- 保留可审计历史：主档反映当前状态，流水保留每一次变化。
- 通过 GitHub 同步：所有变更提交到 `FrenkieLeo/AssetDataBase`，便于多设备持续维护。

## 目录结构

| 路径 | 说明 |
|---|---|
| `data/assets.csv` | 资产主档，反映每项资产的当前状态 |
| `data/asset_events.csv` | 资产事件流水，记录所有新增和变更动作 |
| `templates/asset_intake_template.csv` | 批量导入资产模板 |
| `docs/field_dictionary.md` | 字段字典与填写规则 |
| `docs/asset_workflow.md` | 资产购置、调拨、维修、报废流程 |
| `docs/chat_update_protocol.md` | 通过聊天维护资产数据库的操作约定 |
| `scripts/sync.sh` | 本地仓库同步脚本 |

## 推荐维护方式

1. 新增资产：在 `data/assets.csv` 新增一行，并在 `data/asset_events.csv` 追加一条 `purchase` 或 `register` 事件。
2. 调拨资产：更新 `assets.csv` 的部门、责任人、地点，并在 `asset_events.csv` 追加 `transfer` 事件。
3. 维修资产：主档状态改为 `repairing` 或维修完成后的状态，并追加 `repair_start` / `repair_done` 事件。
4. 报废资产：主档状态改为 `disposed`，追加 `dispose` 事件。
5. 每次修改后提交到 GitHub，保持所有设备同步。

## 状态枚举

| 状态 | 含义 |
|---|---|
| `in_stock` | 闲置在库 |
| `in_use` | 使用中 |
| `repairing` | 维修中 |
| `lost` | 遗失 |
| `disposed` | 已报废/已处置 |

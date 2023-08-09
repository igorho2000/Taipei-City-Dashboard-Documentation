## 地圖配置
為了正確呈現地圖資料，需要將地圖配置填入組件配置中的`map_config`參數，正如 [這篇先前的文章](/front-end/introduction-to-components#component-configuration) 所述。

為讓每個組件可以包含數個地圖圖層，地圖配置的形式為 Array ，清單的每個項目即為一個圖層的設定。當在地圖頁面展開組件時，所有附屬於該組件的地圖將同時被呼叫並渲染。

以下是完整的地圖配置物件。

```json
"map_config": [
    {
        // String; 必須是唯一的並與地圖資料之檔案名稱相同
        "index": "socl_welfare", 
        // Object; 支援所有 Mapbox 的Paint屬性。詳情參見第一個資訊框。
        "paint": {
            "fill-color": [] // 詳見第一個警告框。
        }, 
        "property": [
            // key: String; 地圖資料中的屬性名稱
            // name: String; 在使用者介面中顯示的名稱
            { "key": "vil", "name": "里界" },
            { "key": "cnt_low_income", "name": "低收入人口數" },
        ], // Array of Objects; 在地圖的彈出式視窗中顯示的屬性
        "title": "社福人口", // String; 地圖名稱
        "type": "fill", // String; 輸入 5 種任一種可用的地圖類型
        "size": null, // String || null; 額外預設樣式設定，參見下一節
        "icon": null // String || null; 額外預設樣式設定，參見下一節
    },
    …
],
```

>**i01**
>在 Mapbox 中，每個地圖類型均支援數個Paint屬性，用於控制地圖視覺呈現，如顏色、大小、模糊度等。如要微調地圖的預設形式，只需傳遞任何 Mapbox 支援的Paint屬性即可。 ([Mapbox 圖層文件](https://docs.mapbox.com/mapbox-gl-js/style-spec/layers/))

>**w01**
>各地圖類型的顏色預設皆為黑色，因此所有地圖類型的顏色Paint屬性(e.g `fill-color`, `circle-color`, etc.)都應該被指定。

## 地圖類型
本專案支援 5 種地圖類型。每個地圖類型都有預設的樣式，相關設定位於 `/src/assets/configs/mapbox` 的 `mapConfig.js` 檔案中。有些地圖亦支援一些預設變形。這可以透過在地圖配置中指定大小(size)或圖示(icon)參數來實現。

### Circle
Circle地圖類型在地圖上將點(Point)渲染為圓圈。`size`變化包括 `small` 和 `big`。`icon`變化包括 `heatmap`，此效果在地圖拉遠時會將點變模糊，形成類似熱力圖的效果。

### Fill
Fill地圖類型在地圖上渲染多邊形(Polygon)。沒有預設變化。

### Fill-extrusion
Fill-extrusion地圖類型從地圖上突出顯示多邊形(Polygon)的 3D 渲染。沒有預設變化。

### Line
Line地圖類型在地圖上渲染線條(Line)。`size`變化包括 `wide`。`icon`變化包括 `dash`，呈現虛線而不是實線。

### Symbol
Symbol地圖類型在地圖上將點(Point)渲染為圖示。如使用symbol地圖，必須將`icon`參數傳遞給地圖配置。目前可用的圖示包括 `metro`、`metro-density`、`triangle_green`、`triangle_white`、`youbike` 和 `bus`。
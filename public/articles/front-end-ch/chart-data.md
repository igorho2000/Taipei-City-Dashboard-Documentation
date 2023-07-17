## 支援的資料類型
本專案目前支援 4 種主要的圖表資料類型。每種資料類型都有預定的格式和支援一組可用於視覺化的圖表。要了解更多有關支援的圖表類型的資訊，請參考[稍後的文章](/front-end/supported-chart-types)。

### 二維資料
二維資料（以下簡稱 2D 資料）是可以使用簡單的**key-value（x-y）**編排的資料。對於 2D 資料，key（x）和value（y）都應以以下格式在 `json` 檔案中列出。

**格式：**
```json
{
  "data": [
    {
      "name": "", // 2D 資料不需要 name 參數
      "data": [
        // key (x): String，value (y): Number
        { "x": "機車竊盜", "y": 17 }, 
        { "x": "住宅竊盜", "y": 12 },
        { "x": "汽車竊盜", "y": 3 },
        { "x": "搶奪", "y": 0 },
        { "x": "強盜", "y": 0 }
      ]
    }
  ]
}
```

**支援的圖表類型：** 圓餅圖、橫向長條圖、縱向長條圖、矩形圖、行政區圖、捷運行駛圖、雷達圖

>**i01**
>行政區圖的key (x) 必須以以下順序列出台北市 12 個行政區的全名（例如：大安區）：
>
>["北投區", "士林區", "內湖區", "南港區", "松山區", "信義區", "中山區", "大同區", "中正區", "萬華區", "大安區", "文山區"]

>**i02**
>有關捷運行駛圖的key-value格式，請參[閱稍後的文章](/front-end/supported-chart-types#metro-chart)。

### 三維資料
三維資料（以下簡稱 3D 資料）是可以以 **key-子類別-value（x-y-z）** 格式編排的資料。對於 3D 資料，key（x）應在圖表配置中以Array的形式列出（如[稍後的文章](/front-end/supported-chart-types#chart-config)中所述），而子類別（y）和value（z）則應以以下格式在 `json` 檔案中列出。

**格式：**
```json
// keys (x): 字串 Array
// ["士林區","大安區","文山區","松山區","南港區","大同區","中山區","內湖區","北投區","中正區","萬華區","信義區"]
// 鍵在圖表配置中單獨列出
{
  "data": [
    {
      // 子類別 (y): String
      "name": "低收", 
      // value (z): Array of Numbers
      // value 的位置對應到keys (x)的排序
      "data": [
        5330, 1889, 5752, 1702, 2542, 3019, 2441, 3183, 4519, 1773, 6770, 3065
      ] 
    },
    {
      "name": "中低收",
      "data": [
        1740, 754, 2204, 561, 1170, 980, 921, 1423, 1508, 518, 2540, 1215
      ]
    },
    {
      "name": "身障補助",
      "data": [696, 252, 688, 186, 425, 343, 351, 565, 635, 234, 751, 442]
    },
    {
      "name": "身障",
      "data": [
        13240, 11383, 12378, 7970, 6084, 6387, 9481, 10683, 11800, 6401, 11299,
        10196
      ]
    }
  ]
}
```

**支援的圖表類型：** 縱向長條圖、長條圖(%)、雷達圖

### 時間序列資料
時間序列資料（以下簡稱時間資料）是可以以簡單的 **key-value (x-y)** 格式編排的資料，其中key是時間戳記。對於時間資料，key（x）和value（y）都應以以下格式列在一個 `json` 檔案中。

**格式：**
```json
{
  "data": [
    {
      // 系列名稱：String
      // 如果只有一個系列則為非必填
      "name": "進站",
      "data": [
        // key (x)：String（時間戳記），value (y)：Number
        { "x": "2023-05-25T06:29:00Z", "y": 19891  },
        { "x": "2023-05-25T06:59:00Z", "y": 42930  },
        { "x": "2023-05-25T07:29:00Z", "y": 83705  },
        { "x": "2023-05-25T07:59:00Z", "y": 121326 },
        { "x": "2023-05-25T08:29:00Z", "y": 128056 }
      ]
    },
    // 附加系列（非必填）
    { 
      "name": "出站",
      "data": [
        // key (x) 必須與第一個系列相同
        { "x": "2023-05-25T06:29:00Z", "y": 9263  }, 
        { "x": "2023-05-25T06:59:00Z", "y": 23142  },
        { "x": "2023-05-25T07:29:00Z", "y": 49352  },
        { "x": "2023-05-25T07:59:00Z", "y": 92718  },
        { "x": "2023-05-25T08:29:00Z", "y": 124858  }
      ]
    }
  ]
}
```

**支援的圖表類型：** 折線圖(比較)、折線圖(堆疊)

### 百分比資料
百分比資料是可以以簡單的 **key-value (x-y)** 格式編排的資料，其中value是百分比。如希望顯示百分比資料應提供除數和餘數（將除數從總數中減去），百分比的計算會由圖表Vue元件執行。對於百分比資料，key（x）應在圖表配置中以Array的形式列出（如 [此後續文章](/front-end/supported-chart-types#chart-config) 所述），而除數和餘數應以以下格式列在一個 `json` 檔案中。

**格式：**
```json
// key (x)：Array of Strings
// ["運行中公車", "運行中路線"]
// key應於圖表配置中列出
{
  "data": [
    // 系列 1：除數
    {
      // 除數的標題
      "name": "營運中",
      // 除數：Array of Numbers
      // value 的位置對應到 keys 的排序 (x)
      "data": [1564, 273]
    },
    // 系列 2：餘數
    {
      // 餘數的標題
      "name": "未營運",
      // 餘數：Array of Numbers
      // value 的位置對應到 keys 的排序 (x)
      "data": [164, 109]
    }
  ]
}
// *百分比由圖表自動計算
```

**支援的圖表類型：** 量表圖、長條圖(%)
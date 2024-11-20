//
//  AllNewsPreview.swift
//  News-SUI
//
//  Created by KsArT on 19.11.2024.
//

import Foundation

enum AllNewsPreview {
    static var news: [NewsData] = {
        var list: [NewsData] = []
        list.append(
            NewsData(
                id: "f845e6a9-9fd4-4370-8e9c-3fa1d7751865",
                title: "Shanghai scraps residential housing distinction to accelerate home sales",
                description: "",
                keywords: "",
                snippet: "Shanghai on Monday further relaxed its real estate policies, eliminating distinction between ordinary and non-ordinary homes and expanding tax incentives for pr...",
                url: "http://www.ecns.cn/news/economy/2024-11-18/detail-ihekectp0358339.shtml",
                imageUrl: "https://image.chinanews.com/cspimp/2024/11-18/19a99394-b7f2-46e8-88e7-d72b6be22579_big.JPG",
                image: nil,
                language: "en",
                publishedAt: "2024-11-18T16:01:35.000000Z".toDateFromIso8601(),
                source: "ecns.cn",
                categories: "general",
                locale: ""
            )
        )
        list.append(
            NewsData(
                id: "7122e6cc-9ed0-479b-bbac-b23d75a31139",
                title: "Listed firms' operating profits hit record high during Jan.-Sept. period.",
                description: "SEOUL, Nov. 18 (Yonhap) -- South Korean listed firms reported record earnings during the f...",
                keywords: "",
                snippet: "SEOUL, Nov. 18 (Yonhap) -- South Korean listed firms reported record earnings during the first nine months of 2024 on strong demand for semiconductors and a glo...",
                url: "https://en.yna.co.kr/view/AEN20241118007300320?section=news&input=rss",
                imageUrl: "https://img9.yna.co.kr/etc/inner/EN/2024/11/18/AEN20241118007300320_03_i_P4.jpg",
                image: nil,
                language: "en",
                publishedAt: "2024-11-18T16:00:11.000000Z".toDateFromIso8601(),
                source: "yna.co.kr",
                categories: "general",
                locale: ""
            )
        )
        list.append(
            NewsData(
                id: "b098c0bc-8508-46c2-80f2-4f8264b40260",
                title: "Reserve Bank of India",
                description: "",
                keywords: "",
                snippet: "A. Source Security 7.27% GS 2026 6.99% GS 2026 6.99% GS 2026 8.33% GS 2026 5.74% GS 2026 B. Notified Amount (amount in ₹ cr) 1,000 3,000 1,000 1,000 2,000 Des...",
                url: "https://www.rbi.org.in/scripts/BS_PressReleaseDisplay.aspx?prid=59122",
                imageUrl: "https://www.rbi.org.in/images/Rbinote.jpeg",
                image: nil,
                language: "en",
                publishedAt: "2024-11-18T16:00:00.000000Z".toDateFromIso8601(),
                source: "rbi.org.in",
                categories: "business,general",
                locale: ""
            )
        )
        return list
    }()
}

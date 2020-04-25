var serviceJson = '''
{
  "services": {
    "apiVersion": "0.0.1",
    "service_configurations": [
      {
        "name": "discoverallservices",
        "apiVersion": "10.3.0",
        "error": false,
        "display": "matrix",
        "serviceTypes": {
          "service": 0
        },
        "value": [
          {
            "groupName": "车辆服务",
            "displayOrder": 1,
            "services": [
              {
                "id": "4093",
                "image": "https://bmwstaticresourcedst.blob.core.chinacloudapi.cn/discovericons/28dfc652-1eaf-4463-8c76-dad561103175.png",
                "name": "mock车辆服务",
                "serviceCode": "Tyre Sales",
                "description": "null",
                "shortDescription": "",
                "type": "service",
                "uri": "https://bmwgatewayservicedst.chinacloudsites.cn/api/gateway/views/CampaignCenterAppH5/index.html#/tyre-list",
                "transitionType": "internal",
                "storeURI": "",
                "position": 1,
                "status": 0
              }
            ]
          },
          {
            "groupName": "BMW商城",
            "displayOrder": 2,
            "services": [
              {
                "id": "4093",
                "image": "https://bmwstaticresourcedst.blob.core.chinacloudapi.cn/discovericons/28dfc652-1eaf-4463-8c76-dad561103175.png",
                "name": "轮胎特惠",
                "serviceCode": "Tyre Sales",
                "description": "null",
                "shortDescription": "",
                "type": "service",
                "uri": "https://bmwgatewayservicedst.chinacloudsites.cn/api/gateway/views/CampaignCenterAppH5/index.html#/tyre-list",
                "transitionType": "internal",
                "storeURI": "",
                "position": 1,
                "status": 0
              },
              {
                "id": "4092",
                "image": "https://bmwstaticresourcestg.blob.core.chinacloudapi.cn/discovericons/iOS/9.0.0/icon_BMW_Online_Genius_BMW_3x.png",
                "name": "移动展厅",
                "serviceCode": "BMW Online-Genius",
                "description": "null",
                "shortDescription": "",
                "type": "service",
                "uri": "https://og.bba-app.biz?channel=cdapp",
                "transitionType": "external",
                "storeURI": "",
                "position": 2,
                "status": 0
              },
              {
                "id": "4091",
                "image": "https://bmwstaticresourcestg.blob.core.chinacloudapi.cn/discovericons/iOS/8.1.0/icon_CD-store.png",
                "name": "互联驾驶商店",
                "serviceCode": "ConnectedDrive Store",
                "description": "null",
                "shortDescription": "",
                "type": "service",
                "uri": "https://bmwgatewayservicedst.chinacloudsites.cn/api/gateway/views/CDStoreApp/index.html#/?serviceEntranceName=ConnectedDriveStore",
                "transitionType": "internal",
                "storeURI": "",
                "position": 3,
                "status": 0
              },
              {
                "id": "4090",
                "image": "https://bmwstaticresourcestg.blob.core.chinacloudapi.cn/discovericons/iOS/8.1.0/icon_Tmall.png",
                "name": "BMW天猫商城",
                "serviceCode": "BMW Tmall",
                "description": "null",
                "shortDescription": "",
                "type": "service",
                "uri": "https://bmw.tmall.com/",
                "transitionType": "external",
                "storeURI": "",
                "position": 4,
                "status": 0
              },
              {
                "id": "4089",
                "image": "https://bmwstaticresourcedst.blob.core.chinacloudapi.cn/discovericons/0c6bcb54-e942-4775-b0f7-3b93909930f1.png",
                "name": "BMW售后商店",
                "serviceCode": "BMW One Shop",
                "description": "null",
                "shortDescription": "",
                "type": "service",
                "uri": "https://aftersales.bmw.com.cn/aftersales/c/index",
                "transitionType": "external",
                "storeURI": "",
                "position": 5,
                "status": 0
              },
              {
                "id": "4088",
                "image": "https://bmwstaticresourcestg.blob.core.chinacloudapi.cn/discovericons/iOS/9.0.0/icon_Personal_Assistant_BMW_3x.png",
                "name": "在线客服",
                "serviceCode": "Personal Assistant",
                "description": "null",
                "shortDescription": "",
                "type": "service",
                "uri": "https://cncms-int.bmw.com.cn/content/BMW-Loyalty/zh/index.html#/connected/chat/?serviceEntranceName=PersonalAssistant",
                "transitionType": "internal",
                "storeURI": "",
                "position": 6,
                "status": 0
              }
            ]
          },
          {
            "groupName": "会员积分与卡券",
            "displayOrder": 3,
            "services": [
              {
                "id": "4087",
                "image": "https://bmwstaticresourcestg.blob.core.chinacloudapi.cn/discovericons/iOS/9.0.0/BMW_Icon_LoyaltyCard_promotion_3x.png",
                "name": "会员卡片和积分",
                "serviceCode": "Loyalty Virtual Card",
                "description": "null",
                "shortDescription": "",
                "type": "service",
                "uri": "https://bmwgatewayservicedst.chinacloudsites.cn/api/gateway/views/LoyaltyApp/index.html?serviceEntranceName=LoyaltyProgramme#/virtual-card",
                "transitionType": "internal",
                "storeURI": "",
                "position": 1,
                "status": 0
              },
              {
                "id": "4099",
                "image": "https://bmwstaticresourcestg.blob.core.chinacloudapi.cn/discovericons/iOS/8.1.0/icon_voucher.png",
                "name": "BMW礼券",
                "serviceCode": "BMW Voucher",
                "description": "null",
                "shortDescription": "",
                "type": "service",
                "uri": "https://bmwgatewayservicedst.chinacloudsites.cn/api/gateway/views/LoyaltyApp/index.html?serviceEntranceName=BMWVoucher",
                "transitionType": "internal",
                "storeURI": "",
                "position": 2,
                "status": 0
              },
              {
                "id": "4086",
                "image": "https://bmwstaticresourcestg.blob.core.chinacloudapi.cn/discovericons/iOS/9.0.0/icon_Loyalty_Partner_Benefit_BMW_3x.png",
                "name": "BMW中国会员联盟合作伙伴",
                "serviceCode": "BMW CN Loyalty Partner Benefits",
                "description": "null",
                "shortDescription": "",
                "type": "service",
                "uri": "https://bmwgatewayservicedst.chinacloudsites.cn/api/gateway/views/apmhat/index.html?BrandCode=2",
                "transitionType": "internal",
                "storeURI": "",
                "position": 3,
                "status": 0
              }
            ]
          },
          {
            "groupName": "优选出行服务",
            "displayOrder": 4,
            "services": [
              {
                "id": "4084",
                "image": "https://bmwstaticresourceint.blob.core.chinacloudapi.cn/discovericons/bmw20190508/icon_traffic_violation_query_BMW_3x.png",
                "name": "违章代缴",
                "serviceCode": "Traffic Violation Payment",
                "description": "null",
                "shortDescription": "",
                "type": "service",
                "uri": "https://bmwgatewayservicedst.chinacloudsites.cn/api/gateway/views/TrafficViolationV6/index.html?serviceEntranceName=TrafficViolationPayment",
                "transitionType": "internal",
                "storeURI": "",
                "position": 1,
                "status": 0
              },
              {
                "id": "4083",
                "image": "https://bmwstaticresourceint.blob.core.chinacloudapi.cn/discovericons/bmw20190508/icon_ETC_BMW_free.png",
                "name": "ETC在线办理",
                "serviceCode": "ETC",
                "description": "null",
                "shortDescription": "",
                "type": "service",
                "uri": "https://bmwgatewayservicedst.chinacloudsites.cn/api/gateway/views/ETCApp/index.html",
                "transitionType": "internal",
                "storeURI": "",
                "position": 2,
                "status": 0
              },
              {
                "id": "4082",
                "image": "https://bmwstaticresourcestg.blob.core.chinacloudapi.cn/discovericons/iOS/8.1.0/icon_discover_fuel_card.png",
                "name": "加油卡在线充值",
                "serviceCode": "Fuel Card Recharge",
                "description": "null",
                "shortDescription": "",
                "type": "service",
                "uri": "https://bmwgatewayservicedst.chinacloudsites.cn/api/gateway/views/FuelCardRecharge/index.html?serviceEntranceName=FuelCardRecharge",
                "transitionType": "internal",
                "storeURI": "",
                "position": 3,
                "status": 0
              },
              {
                "id": "4081",
                "image": "https://bmwstaticresourceint.blob.core.chinacloudapi.cn/discovericons/bmw20190508/icon_Chauffeur_BMW_3x.png",
                "name": "代驾服务",
                "serviceCode": "Designated Driving",
                "description": "null",
                "shortDescription": "",
                "type": "service",
                "uri": "https://bmwgatewayservicedst.chinacloudsites.cn/api/gateway/views/Chauffeur/index.html?serviceEntranceName=Chauffeur",
                "transitionType": "internal",
                "storeURI": "",
                "position": 4,
                "status": 0
              },
              {
                "id": "4080",
                "image": "https://bmwstaticresourcestg.blob.core.chinacloudapi.cn/discovericons/iOS/8.1.0/icon_discover_valet_parking.png",
                "name": "代客泊车",
                "serviceCode": "Valet Parking",
                "description": "null",
                "shortDescription": "",
                "type": "service",
                "uri": "https://bmwgatewayservicedst.chinacloudsites.cn/api/gateway/views/ValetParking/index.html?serviceEntranceName=ValetParking?serviceEntranceName=ValetParking",
                "transitionType": "internal",
                "storeURI": "",
                "position": 5,
                "status": 0
              },
              {
                "id": "4079",
                "image": "https://bmwstaticresourcestg.blob.core.chinacloudapi.cn/discovericons/iOS/9.0.0/icon_Lounge_CIP_Service_BMW_3x.png",
                "name": "商旅出行",
                "serviceCode": "Airport Mobility Service",
                "description": "null",
                "shortDescription": "",
                "type": "service",
                "uri": "https://bmwgatewayservicedst.chinacloudsites.cn/api/gateway/views/PremiumAirportDp/index.html?serviceEntranceName=LoungeCIPService",
                "transitionType": "internal",
                "storeURI": "",
                "position": 6,
                "status": 0
              },
              {
                "id": "4078",
                "image": "https://bmwstaticresourcestg.blob.core.chinacloudapi.cn/discovericons/iOS/9.0.0/annual_document_renewal.png",
                "name": "年检代办",
                "serviceCode": "Annual Document Renewal",
                "description": "null",
                "shortDescription": "",
                "type": "service",
                "uri": "https://bmwgatewayservicedst.chinacloudsites.cn/api/gateway/views/AnnualInspectionApp/index.html",
                "transitionType": "internal",
                "storeURI": "",
                "position": 7,
                "status": 0
              },
              {
                "id": "4077",
                "image": "https://bmwstaticresourceint.blob.core.chinacloudapi.cn/discovericons/bmw20190508/icon_Smart_Parking_Payment_BMW_3x.png",
                "name": "智慧停车",
                "serviceCode": "Smart Parking",
                "description": "NULL",
                "shortDescription": "",
                "type": "service",
                "uri": "https://bmwgatewayservicedst.chinacloudsites.cn/api/gateway/views/MGUSmartParkingAppH5/index.html?serviceEntranceName=SmartParking",
                "transitionType": "internal",
                "storeURI": "",
                "position": 8,
                "status": 0
              },
              {
                "id": "4076",
                "image": "https://bmwstaticresourceint.blob.core.chinacloudapi.cn/discovericons/20190428-icon_AQI_BMW_3x.png",
                "name": "空气质量指数",
                "serviceCode": "AirQualityIndex",
                "description": "null",
                "shortDescription": "",
                "type": "service",
                "uri": "AirQualityIndex",
                "transitionType": "native",
                "storeURI": "",
                "position": 9,
                "status": 0
              }
            ]
          },
          {
            "groupName": "BMW小工具",
            "displayOrder": 5,
            "services": [
              {
                "id": "4075",
                "image": "https://bmwstaticresourcedst.blob.core.chinacloudapi.cn/discovericons/f18fb1ab-621e-422c-8cf5-bf8869d34b7c.png",
                "name": "指示灯查询",
                "serviceCode": "Indicator Lights",
                "description": "null",
                "shortDescription": "",
                "type": "service",
                "uri": "https://bmwgatewayservicedst.chinacloudsites.cn/api/gateway/views/LightGuide/index.html",
                "transitionType": "internal",
                "storeURI": "",
                "position": 1,
                "status": 0
              },
              {
                "id": "4074",
                "image": "https://bmwstaticresourcedst.blob.core.chinacloudapi.cn/discovericons/2f6a360d-0fbb-4770-b8b1-5dd66d10b880.png",
                "name": "宝马金融移动管家",
                "serviceCode": "E-statement",
                "description": "null",
                "shortDescription": "",
                "type": "service",
                "uri": "https://mlp-prod.bmwgroup.com/MLP",
                "transitionType": "external",
                "storeURI": "",
                "position": 2,
                "status": 0
              },
              {
                "id": "4073",
                "image": "https://bmwstaticresourcestg.blob.core.chinacloudapi.cn/discovericons/iOS/8.1.0/icon_user_manual.png",
                "name": "驾驶指南",
                "serviceCode": "Driver's Guide",
                "description": "",
                "shortDescription": "",
                "type": "service",
                "uri": "?serviceEntranceName=DriverGuide",
                "transitionType": "externalApp",
                "storeURI": "",
                "position": 3,
                "status": 0
              },
              {
                "id": "4085",
                "image": "https://bmwstaticresourcestg.blob.core.chinacloudapi.cn/discovericons/iOS/8.1.0/icon_BMW-website.png",
                "name": "BMW官网",
                "serviceCode": "BMW Official Website",
                "description": "null",
                "shortDescription": "",
                "type": "service",
                "uri": "http://www.bmw.com.cn/",
                "transitionType": "external",
                "storeURI": "",
                "position": 4,
                "status": 0
              },
              {
                "id": "4100",
                "image": "https://bmwstaticresourcestg.blob.core.chinacloudapi.cn/discovericons/iOS/8.1.0/icon_loan-calculator.png",
                "name": "车贷计算器",
                "serviceCode": "Loan Calculator",
                "description": "null",
                "shortDescription": "",
                "type": "service",
                "uri": "http://www.bmw.com.cn/zh/topics/experience/bmw-financial-services/calculator.html",
                "transitionType": "external",
                "storeURI": "",
                "position": 5,
                "status": 0
              }
            ]
          }
        ]
      }
    ]
  },
  "news": [
    {
      "id": 171,
      "serviceTitle": "【延保早知道】关于价格，你需要知道真相！",
      "bannerImageUrl": "https://accpad.bmw.com.cn/news1566271177005",
      "serviceNewsUrl": "https://dealerapp.bmw.com.cn/news/newsInfo.html?newsId=1242090",
      "thirdPartyNewsId": 1242090
    },
    {
      "id": 172,
      "serviceTitle": "【Test】关于价格，你需要知道真相！",
      "bannerImageUrl": "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1573620203106&di=a126ddd9237b6a7cf6c3aa9cdbd5f2f5&imgtype=0&src=http%3A%2F%2Ffile03.16sucai.com%2F2016%2F10%2F240%2F16sucai_p20161023007_028.JPG",
      "serviceNewsUrl": "https://dealerapp.bmw.com.cn/news/newsInfo.html?newsId=1242090",
      "thirdPartyNewsId": 1242090
    }
  ]
}
''';

//这里有问题：342行原来是非法的json数据
//"description": "{\n    \"bmwdriversguide\": {\n        \"scheme\": \"bmwdriversguide\",\n        \"command\": \"open\",\n        \"appID\": \"839558781\"\n    },\n    \"bmwidriversguide\": {\n        \"scheme\": \"bmwidriversguide\",\n        \"command\": \"open\",\n        \"appID\": \"839567603\"\n    }\n}",

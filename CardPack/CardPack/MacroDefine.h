//
//  MacroDefine.h
//  BeaconTower
//
//  Created by dev on 2017/5/27.
//  Copyright © 2017年 周伟. All rights reserved.
//

#ifndef MacroDefine_h
#define MacroDefine_h

// 是否连接测试服
#define NetConnectedTest 1

#ifdef NetConnectedTest   //测试

#define KHTTPURL @"http://oyyxdev2.91uda.com/api"

#else   //正式

#define KHTTPURL @"http://oyyx.oybus.com/api"

#endif

#define KResprotocolProtobuf  @"protobuf"
#define KResprotocolJSON      @"json"


#define MakeEmptyClientInfo(var) PbBaseClientInfoBuilder *baseClientInfoBuilder = [PbBaseClientInfo builder]; \
[baseClientInfoBuilder setToken:@""]; \
[baseClientInfoBuilder setSessionId:@""]; \
PbBaseClientInfo *var = [baseClientInfoBuilder build];


#define FORMAT(string, args...) [NSString stringWithFormat:string, args]
#define URL(url) [NSURL URLWithString:url]


#ifdef DEBUG
#define DLog(...) printf("[%s %d行]:\n%s\n", __PRETTY_FUNCTION__, __LINE__,[[NSString stringWithFormat:__VA_ARGS__]UTF8String]);
#define DLog_CURRENT_METHOD NSLog(@"%@-%@", NSStringFromClass([self class]), NSStringFromSelector(_cmd))
#else
#define DLog(...) ;
#define DLog_CURRENT_METHOD ;
#endif

//
#define kSCREEN_WIDTH          ([UIScreen mainScreen].bounds.size.width)
#define kSCREEN_HEIGHT         ([UIScreen mainScreen].bounds.size.height)

#define kStatusBarHeight ([[UIApplication sharedApplication] statusBarFrame].size.height)
#define kNavigationBarHeight 44.f
#define kTabBarHeight (kStatusBarHeight == 20.f?(49.f):(34.f + 49.f))
#define KISIphoneX (kStatusBarHeight == 20.f?NO:YES)

#define KHomeIndicatorHeight (iPhoneX?(34.f):(0.f))

#define kNavigationAndStatusBarHeight (kStatusBarHeight + 44.f)

#pragma mark - ios版本判断
#define kIOS8_OR_LATER   ([[[UIDevice currentDevice] systemVersion] compare:@"8.0"] != NSOrderedAscending)
#define kIOS9_OR_LATER   ([[[UIDevice currentDevice] systemVersion] compare:@"9.0"] != NSOrderedAscending)
#define kIOS10_OR_LATER   ([[[UIDevice currentDevice] systemVersion] compare:@"10.0"] != NSOrderedAscending)
#define kIOS11_OR_LATER   ([[[UIDevice currentDevice] systemVersion] compare:@"11.0"] != NSOrderedAscending)
/*
 iPhone 6          w:375  h:667
 iPhone 6 Plus     w:414  h:736
 iPhone 6s         w:375  h:667
 iPhone 6s Plus    w:414  h:736
 iPhone 7          w:375  h:667
 iPhone 7 Plus     w:414  h:736
 iPhone 8          w:375  h:667
 iPhone 8 Plus     w:414  h:736
 iPhone SE         w:320  h:568
 iPhone X          w:375  h:812
 */

// iPhone5 or iPhone5s
#define  iPhone5_5s_SE     (kSCREEN_WIDTH == 320.f && kSCREEN_HEIGHT == 568.f)

//iPhone6 or iPhone6s or iPhone7 or iPhone8
#define  iPhone6_6s_7_8     (kSCREEN_WIDTH == 375.f && kSCREEN_HEIGHT == 667.f)

//iPhone6Plus or iPhone6sPlus or iPhone7Plus or iPhone8Plus
#define  iPhone6Plus_6sPlus_7Plus_8Plus (kSCREEN_WIDTH == 414.f && kSCREEN_HEIGHT == 736.f)

//iPhone X
#define iPhoneX     (kSCREEN_WIDTH == 375.f && kSCREEN_HEIGHT == 812.f)

//设备信息
#define kIOS_VERSION    [[[UIDevice currentDevice] systemVersion] floatValue]
#define kDEVICE_MODEL   [[UIDevice currentDevice] model]
#define kIS_IPAD        ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad)
#define kisRetina       ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO)
#define kAPP_NAME            [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"]
#define kAPP_VERSION         [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
#define kAPP_SUB_VERSION     [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"]
#define kUDeviceIdentifier   [[UIDevice currentDevice] uniqueDeviceIdentifier]

//
#define kWidth(x)             (x)/(750.f)  * ([UIScreen mainScreen].bounds.size.width)
#define kHeight(x)            (x)/(1334.f) * ([UIScreen mainScreen].bounds.size.height)

// 分割线的粗细
#define SEP_LINE_SIZE 0.8f

//颜色
#define RGB_HEX(V)		[UIColor colorWithHex:V]
#define RGBA_HEX(V, A)	[UIColor colorWithHex:V alpha:A]

//proto
#define PbBuilder(pbstruct) pbstruct##Builder *builder = [pbstruct builder];\
[builder setBaseClientInfo:kSharedClientInfo];

//用户
#define kSharedClientInfo	[DataManager sharedManager].userInfo.baseClientInfo

//服务端数据返回验证
#ifdef DEBUG
#define PbResult(pbstruct, data) pbstruct *result = nil;\
@try {\
result = [pbstruct parseFromData:data];\
} @catch (NSException *exception) {\
DLog(@"%@", exception.callStackSymbols);	\
UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@#pbstruct message:@"服务端数据解析出错" delegate:nil cancelButtonTitle:@"知道了" otherButtonTitles:nil];	\
[alert show];	\
}
#else
#define PbResult(pbstruct, data) pbstruct *result = nil;\
@try {\
result = [pbstruct parseFromData:data];\
} @catch (NSException *exception) {}
#endif

//数组
#define MUL_ARRAY_ADD_OR_CREATE(arrayDes, arraySrc) if (arrayDes == nil) {\
arrayDes = [NSMutableArray arrayWithArray:arraySrc];\
}else{\
[arrayDes addObjectsFromArray:arraySrc];\
}

//适配iOS11 --->scrollView下移间距
#define  KAdjustsScrollViewInsets_NO(scrollView,vc)\
_Pragma("clang diagnostic push") \
_Pragma("clang diagnostic ignored \"-Wdeprecated-declarations\"") \
if (@available(iOS 11.0,*))  {\
scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;\
} else {\
self.automaticallyAdjustsScrollViewInsets = NO;\
}\
_Pragma("clang diagnostic pop") \

//获取某View安全区域范围的宏
#define VIEWSAFEAREAINSETS(view) ({UIEdgeInsets i; if(@available(iOS 11.0, *)) {i = view.safeAreaInsets;} else {i = UIEdgeInsetsZero;} i;})

//cell分割线增加宽度
#define SET_CELL_LINE_SIZE(x) - (void)setFrame:(CGRect)frame{\
frame.origin.y    += (x);\
frame.size.height -= (x);\
[super setFrame:frame];\
}

#endif /* MacroDefine_h */

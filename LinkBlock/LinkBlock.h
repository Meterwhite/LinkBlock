//
//  LinkBlock.h
//
//  Created by NOVO on 15/8/13.
//  Copyright (c) 2015年 NOVO. All rights reserved.
//

#import "NSNil.h"
#import "NSObject+LinkBlock.h"
#import "NSArray+LinkBlock.h"
#import "NSAttributedString+LinkBlock.h"
#import "NSDictionary+LinkBlock.h"
#import "NSMutableArray+LinkBlock.h"
#import "NSMutableAttributedString+LinkBlock.h"
#import "NSMutableDictionary+LinkBlock.h"
#import "NSMutableString+LinkBlock.h"
#import "NSString+LinkBlock.h"
#import "NSNumber+LinkBlock.h"
#import "NSObject+LinkBlock.h"
#import "NSDate+LinkBlock.h"
#import "NSURL+LinkBlock.h"
#import "NSValue+LinkBlock.h"
#import "NSIndexPath+LinkBlock.h"
#import "NSError+LinkBlock.h"

#import "JavaScriptCore+LinkBlock.h"

#import "UIImage+LinkBlock.h"
#import "UILabel+LinkBlock.h"
#import "UIControl+LinkBlock.h"
#import "UIColor+LinkBlock.h"
#import "UIView+LinkBlock.h"
#import "UIButton+LinkBlock.h"
#import "UIScrollView+LinkBlock.h"
#import "UIImageView+LinkBlock.h"
#import "UIViewController+LinkBlock.h"
#import "UITextView+LinkBlock.h"
#import "UITextField+LinkBlock.h"
#import "UISearchBar+LinkBlock.h"
#import "CALayer+LinkBlock.h"
#import "CAShapeLayer+LinkBlock.h"
#import "CAAnimations+LinkBlock.h"
#import "UIBezierPath+LinkBlock.h"
#import "UIWebView+LinkBlock.h"
#import "UITableView+LinkBlock.h"
#import "UIFont+LinkBlock.h"

//////////////////////////////////////////////////////////////////////
//MARK:新增！动态解析LinkCode
//////////////////////////////////////////////////////////////////////
#ifndef linkEvalCode
#define linkEvalCode(code , args...) linkEvalCode(code , ##args, nil, NSNotFound)
#endif

#ifndef linkCodeEval
#define linkCodeEval(obj , args...) linkCodeEval(obj, ##args, nil, NSNotFound)
#endif

#ifndef linkArgsToEvalCode
#define linkArgsToEvalCode linkArgsToEvalCode
#endif


//////////////////////////////////////////////////////////////////////
//MARK:基础
//////////////////////////////////////////////////////////////////////
//包装一个对象为安全链条起始对象（需要取值时），参数为id类型时使用linkObj_id(obj)来实现.语法
#ifndef linkObj
#define linkObj(object) ((typeof(object))_LB_MakeObj(object))
#endif

//包装一个对象为安全链条起始对象（需要取值时），并指定类型为NSObject
#ifndef linkObj_id
#define linkObj_id(object) ((NSObject*)_LB_MakeObj(object))
#endif

/**
 <- linkEnd>获取链条返回值，并将错误转nil
 ... = linkObj(..)...linkEnd;
 ... = linkObj(..)...linkIF(...)...linkEnd;
 */
#ifndef linkEnd
#define linkEnd linkEnd
#endif

//////////////////////////////////////////////////////////////////////
//MARK:条件
//////////////////////////////////////////////////////////////////////
/**
 <^(id obj)>以新对象执行其后链条，可以与linkIf，linkElse配合
 linkObjs(,,)...linkTo(aNewObj)...
 ...linkIf(...)...linkTo(aNewObj)...linkElse...
 */
#ifndef linkTo
#define linkTo linkTo
#endif
/**
 <^()>根据条件是否中断其后语句，如果当前语句已中断则由当前条件决定其后是否执行
 ...linkIF(...)...linkIF(...)...linkElse...
 ... = ...linkLoop(...)...linkIF(...)...linkEnds;
 */
#ifndef linkIf
#define linkIf linkIf
#endif
/**
 <^()>从中断语句中恢复执行其后语句，与前一个linkIf配合使用
 ...linkIF(...)...linkIF(...)...linkElse...
 */
#ifndef linkElse
#define linkElse linkElse
#endif
/**
 根据引用型布尔值判断是否中断其后语句，如果当前语句已中断则由当前条件决定其后是否执行
 用法与linkIf相似
 ...objIsEqual_n(...).linkIf_YES...LinkElse....
 */
#ifndef linkIf_YES
#define linkIf_YES linkIf_YES
#endif
/**
 根据引用型布尔值判断是否中断其后语句，如果当前语句已中断则由当前条件决定其后是否执行
 用法与linkIf相似
 ...objIsEqual_n(...).linkIf_NO...LinkElse...
 */
#ifndef linkIf_NO
#define linkIf_NO linkIf_NO
#endif
/**
 <^()>使其后语句跳空;可与分支配合
 ...[aNewLink:^(NSObject* fromObj){
 if(...){
 ...linkReturn;
 }
 }]...
 */
#ifndef linkReturn
#define linkReturn linkReturn
#endif

//////////////////////////////////////////////////////////////////////
//MARK:多链条语法
//////////////////////////////////////////////////////////////////////

/**
 包装多个对象为多链条起始对象
 */
#ifndef linkObjs
#define linkObjs(object,args...) _LB_MakeObjs(object,##args,nil)
#endif

/**
 使数组内对象执行多个链式编程，使用ends()可获取结果集合，
 如果结尾返回值为值型则该结果为第一个对象的链式执行结果，效果同使用end
 NSArray.makeLinkObjs....
 */
#ifndef makeLinkObjs
#define makeLinkObjs makeLinkObjs
#endif
/**
 <^(id obj)>使新对象加入链条
 ...linkAnd(aObj)...linkAnd(bObj)...
 ... = ...linkAnd(aObj)...linkAnd(bObj)...ends();
 */
#ifndef linkAnd
#define linkAnd linkAnd
#endif
/**
 <^(NSUInteger idx)>使多链条中移除一个
 linkObjs(,,,)...linkOut(index)...
 */
#ifndef linkOut
#define linkOut linkOut
#endif
/**
 <^(NSUInteger idx)>取出多链条中一个
 linkObjs(,,,)...linkAt(index)...
 */
#ifndef linkAt
#define linkAt linkAt
#endif
/**
 <^()>取出多链条中第一个
 linkObjs(,,,)...linkFirstObj()...
 */
#ifndef linkFirstObj
#define linkFirstObj linkFirstObj
#endif
/**
 <^()>取出多链条中最后一个
 linkObjs(,,,)...linkLastObj()...
 */
#ifndef linkLastObj
#define linkLastObj linkLastObj
#endif
/**
 <^(NSUInteger count)>使其后的链条执行多次
 ...linkLoop(count)...
 */
#ifndef linkLoop
#define linkLoop linkLoop
#endif
/**
 <- ends>多对象链式编程获取多个链条返回值，并将错误转nil
 ... = linkObj(...)...linkLoop(...)...linkEnds();
 */
#ifndef linkEnds
#define linkEnds linkEnds
#endif
/**
 <^(NSUInteger idx)>多对象链式编程获取某一链条返回值，并将错误转nil
 ... = linkObj(...)...linkLoop(...)...linkEndsAt(index);
 */
#ifndef linkEndsAt
#define linkEndsAt linkEndsAt
#endif



//////////////////////////////////////////////////////////////////////
//MARK:其他方法
//////////////////////////////////////////////////////////////////////
/** 如果对象为空使用默认值替代 */
#ifndef linkObjDefault
#define linkObjDefault(object,default) ((typeof(object))_LB_DefaultObj(object,default))
#endif

/** 非空对象 */
#ifndef linkObjNotNil
#define linkObjNotNil(object) ((typeof(object))_LB_NotNilObj(object))
#endif

#ifndef objIsEqualToEach
#define objIsEqualToEach(obj, args...) objIsEqualToEach(obj,##args,nil)
#endif
#ifndef objIsEqualToEach_n
#define objIsEqualToEach_n(obj, args...) objIsEqualToEach_n(obj,##args,nil)
#endif

#ifndef objIsEqualToSomeone
#define objIsEqualToSomeone(obj, args...) objIsEqualToSomeone(obj,##args,nil)
#endif

#ifndef objIsEqualToSomeone_n
#define objIsEqualToSomeone_n(obj, args...) objIsEqualToSomeone_n(obj,##args,nil)
#endif

#ifndef strAppendFormat
#define strAppendFormat(formatStr, args...) strAppendFormat(formatStr,##args,nil)
#endif

#ifndef numIsEqualToNum
#define numIsEqualToNum(...) numIsEqualToNum(LBBoxValue((__VA_ARGS__)))
#endif
#ifndef numIsEqualToNum_n
#define numIsEqualToNum_n(...) numIsEqualToNum_n(LBBoxValue((__VA_ARGS__)))
#endif

#ifndef numIsGreatThanNum
#define numIsGreatThan(...) numIsGreatThanNum(LBBoxValue((__VA_ARGS__)))
#endif
#ifndef numIsGreatThanNum_n
#define numIsGreatThanNum_n(...) numIsGreatThanNum_n(LBBoxValue((__VA_ARGS__)))
#endif

#ifndef numIsGreatEqualNum
#define numIsGreatEqualNum(...) numIsGreatEqualNum(LBBoxValue((__VA_ARGS__)))
#endif
#ifndef numIsGreatEqualNum_n
#define numIsGreatEqualNum_n(...) numIsGreatEqualNum_n(LBBoxValue((__VA_ARGS__)))
#endif

#ifndef numIsGreatEqualNum
#define numIsGreatEqualNum(...) numIsGreatEqualNum(__VA_ARGS__);
#endif
#ifndef numIsGreatEqualNum_n
#define numIsGreatEqualNum_n(...) numIsGreatEqualNum_n(__VA_ARGS__);
#endif

#ifndef numIsLessThanNum
#define numIsLessThanNum(...) numIsLessThanNum(LBBoxValue((__VA_ARGS__)))
#endif
#ifndef numIsLessThanNum_n
#define numIsLessThanNum_n(...) numIsLessThanNum_n(LBBoxValue((__VA_ARGS__)))
#endif

#ifndef numIsLessEqualNum
#define numIsLessEqualNum(...) numIsLessEqualNum(LBBoxValue((__VA_ARGS__)))
#endif

#ifndef numIsLessEqualNum_n
#define numIsLessEqualNum_n(...) numIsLessEqualNum_n(LBBoxValue((__VA_ARGS__)))
#endif

/** <^(SEL sel0 , ...)>宏定义下该方法无需手工以nil结尾； */
#ifndef objPerformSelectors
#define objPerformSelectors(sel , args...) objPerformSelectors(sel, ##args , nil)
#endif

/** <^(SEL sel0 , ...)>该方法会返回调用结果，调用void返回方法时返回结果为NSNull，所有nil的返回值也都装箱为NSNull；宏定义下该方法无需手工以nil结尾； */
#ifndef objPerformSelectors_linkToReturnValues
#define objPerformSelectors_linkToReturnValues(sel,args...) objPerformSelectors_linkToReturnValues(sel,##args,nil)
#endif

/**
 <^(SEL sel0 , NSArray* args0 , ...)> 在参数数组中使用NSNull来代替nil。不要在参数中间传递nil，若想调用无参方法或者想给全部参数传递nil可以使用空数组。方法内会自动适配参数个数；宏定义下该方法无需手工以nil结尾；
 */
#ifndef objPerformSelectorsWithArgs
#define objPerformSelectorsWithArgs(sel0,args0,args...) objPerformSelectorsWithArgs(sel0,args0,##args,nil)
#endif

/**
 <^(SEL sel0 , NSArray* args0 , ...)>该方法会返回调用结果，调用void返回方法时返回结果为NSNull，所有nil的返回值也都装箱为NSNull；方法内会自动适配参数个数；在参数数组中使用NSNull来代替nil。不应在参数中间位置传递nil，若想调用无参方法或者想给全部参数传递nil可以使用空数组；宏定义下该方法无需手工以nil结尾；
 */
#ifndef objPerformSelectorsWithArgs_linkToReturnValues
#define objPerformSelectorsWithArgs_linkToReturnValues(sel0,arg0,args...) objPerformSelectorsWithArgs_linkToReturnValues(sel0,arg0,##args,nil)
#endif

/** <^(UIView view0 , ...)>宏定义下该方法无需手工以nil结尾 */
#ifndef viewAddSubviews
#define viewAddSubviews(view0,args...) viewAddSubviews(view0,args...,nil)
#endif

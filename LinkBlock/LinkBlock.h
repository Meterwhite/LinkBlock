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
#import "NSDate+LinkBlock.h"
#import "NSURL+LinkBlock.h"
#import "NSValue+LinkBlock.h"
#import "NSIndexPath+LinkBlock.h"
#import "NSError+LinkBlock.h"
#import "NSPredicate+LinkBlock.h"

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
//MARK:Basic
//////////////////////////////////////////////////////////////////////

/**
 *  安全的链条
 *  make a safe object for link,check if nil
 */
#ifndef linkObj
#define linkObj(object) ((typeof(object))_LB_MakeObj(object))
#endif

///for type id
#ifndef linkObj_id
#define linkObj_id(object) ((NSObject*)_LB_MakeObj(object))
#endif

/**
 *  ~ = linkObj...linkEnd;
 *  1.Used to get return value when needed.
 *  2.convert <LinkError||NSNull> to nil.
 */
#ifndef linkEnd
#define linkEnd linkEnd
#endif


//////////////////////////////////////////////////////////////////////
//MARK:link objects/多对象链条
//////////////////////////////////////////////////////////////////////

/**
 * linkObjs(obj0,obj1,...)
 *  安全的多对象的链条
 *  make a safe link objects.anyone should not be nil
 */
#ifndef linkObjs
#define linkObjs(object,args...) _LB_MakeObjs(object,##args,nil)
#endif

/**
 <NSArray>.makeLinkObjs = linkObjs(...)
 as well as linkObjs/等同于linkObjs
 */
#ifndef makeLinkObjs
#define makeLinkObjs makeLinkObjs
#endif
/**
 add a new into link objects
 ...linkAdd(object)
 */
#ifndef linkAdd
#define linkAdd linkAdd
#endif
/**
 remove an object at specified index from link objects
 ...linkRemoveAt(index)
 */
#ifndef linkRemoveAt
#define linkRemoveAt linkRemoveAt
#endif
/**
 get an object at specified index from link objects
 ...linkAt(index)
 */
#ifndef linkAt
#define linkAt linkAt
#endif
/**
 get first object from link objects
 ...linkFirstObj
 */
#ifndef linkFirstObj
#define linkFirstObj linkFirstObj
#endif
/**
 get last object from link objects
 linkObjs...linkLastObj...
 */
#ifndef linkLastObj
#define linkLastObj linkLastObj
#endif
/**
 *  重复执行
 *  repeat the following link code by copy link objects
 *  ...linkLoop(count)...
 */
#ifndef linkLoop
#define linkLoop linkLoop
#endif
/**
 *  ~ = linkObjs......linkEnds;
 *  1.used to get return values of links when needed.
 *  2.convert <LinkError||NSNull> to nil.
 */
#ifndef linkEnds
#define linkEnds linkEnds
#endif
/**
 *  1.used to get a return value of link objects at specified index.
 *  2.convert <LinkError||NSNull> to nil.
 *  ~ = linkObjs...linkEndsAt(index);
 */
#ifndef linkEndsAt
#define linkEndsAt linkEndsAt
#endif


//////////////////////////////////////////////////////////////////////
//MARK:Link Condition/条件
//////////////////////////////////////////////////////////////////////
/**
 change link object to others
 ...linkTo(~)...
 */
#ifndef linkTo
#define linkTo linkTo
#endif
/**
 *  if-else in link
 *  <NSNumber>.linkIf...CodeYES...LinkElse...CodeNO
 */
#ifndef linkIf
#define linkIf linkIf
#endif
/**
 *  if-else in link
 *  <NSNumber>.linkIf...CodeYES...LinkElse...CodeNO
 */
#ifndef linkElse
#define linkElse linkElse
#endif
/**
 *  if-else in link
 *  <NSNumber>.linkIf_YES...CodeYES...LinkElse...CodeNO
 */
#ifndef linkIf_YES
#define linkIf_YES linkIf_YES
#endif
/**
 *  if-else in link
 *  <NSNumber>.linkIf_NO...CodeNO...LinkElse...CodeYES
 */
#ifndef linkIf_NO
#define linkIf_NO linkIf_NO
#endif
/**
 break and return value.
 use linkEnd to get the special type value
 ...linkReturn...linkEnd;
 */
#ifndef linkReturn
#define linkReturn linkReturn
#endif



//////////////////////////////////////////////////////////////////////
//MARK:Experimental DynamicLink/脚本解析（实验性）
//////////////////////////////////////////////////////////////////////
/*
 *  DynamicLink/脚本解析:
 *  script.linkCodeEval(targetObject,argumentList....);
 *
 *
 *  DynamicLink used like linkBlock
 *  1."...actionName()..."The actionName wiil called as linkBlock
 *  2."...actionName...".The actionName will called as property > non-argument method > LinkBlock command
 
 *  LinkBlock command/命令:
 *  1.CreateCommand:"ClassName+New";
 *  2.LinkBlock macros,like 'NSNil','AttrDictNew'
 *
 *  note:DynamicLink did not suport the function that use argument list.If do it,system will recive only one agument,This will cause potential differences./不支持不定参数方法，否则只接收一个参数
 *
 *
 *  direct value/直接量：
 *  direct value used in '()'.Like:"actionName(3.1415926)"
 *  suport types:number||HexNumber,String,Boolean,c string,char,NSNumber,SEL,struct in NSValue,Class;
 *  Reference:DynamicLinkArgument.h
 *
 *  note:1.If set actionName or func as direct value,it must be non-argument func/方法的直接量必须是无惨的
 *  2.cannot have double quotes in a string/字符串中不再用双引号
 *
 *
 *  Entry order/入参顺序:
 *  One-to-one correspondence/一一对应关系
 *  script:"actionName($0 , 3.14 , $1)" => argument list:($0 , $1)
 *  Only suport set arguments to outer layer,to inner layer func should use direct value.
 *  In argument list use NSNil instead nil,or use direct value nil or NULL in script
 *
 *  return type:In dynamicLink all return type has been boxed./所有返回值都是装箱的
 */


/**
 *  execute script from any object and return value.
 *  anyObject.linkEvalCode(code , arg0 , arg1 , ...)
 *  note:any return value has been boxed
 */
#ifndef linkEvalCode
#define linkEvalCode(code , args...) linkEvalCode(code , ##args, nil, NSNotFound)
#endif

/**
 *  execute script with an object and return value.
 *  code.linkCodeEval( target , arg0 , arg1 , ...)
 *  note:any return value has been boxed
 */
#ifndef linkCodeEval
#define linkCodeEval(obj , args...) linkCodeEval(obj, ##args, nil, NSNotFound)
#endif

/**
 *  only execute script and return value.
 *  EvalLinkBlock(script)
 *  note:any return value has been boxed
 */
#ifndef EvalLinkBlock
#define EvalLinkBlock(code) linkObj_id(code).linkCodeEval(NSNil, nil)
#endif
/**
 *  only execute script by a target object and return value.
 *  EvalLinkBlockWithTarget(target ,script)
 *  note:any return value has been boxed
 */
#ifndef EvalLinkBlockWithTarget
#define EvalLinkBlockWithTarget(target,code) linkObj_id(code).linkCodeEval(linkObj(target), nil)
#endif




//////////////////////////////////////////////////////////////////////
//MARK:Configuration/配置
//////////////////////////////////////////////////////////////////////
/** Close the warning */
#ifndef LinkBlockWarningClose
#define LinkBlockWarningClose ([LinkInfo linkBlockWarningClose])
#endif
/** Allow warning (default) */
#ifndef LinkBlockWarningOpen
#define LinkBlockWarningOpen ([LinkInfo linkBlockWarningOpen])
#endif

//////////////////////////////////////////////////////////////////////
//MARK:Other function
//////////////////////////////////////////////////////////////////////
/** Default value for object */
#ifndef linkObjDefault
#define linkObjDefault(object,default) ((typeof(object))_LB_DefaultObj(object,default))
#endif

#ifndef linkObjNotNil
#define linkObjNotNil(object) ((typeof(object))_LB_NotNilObj(object))
#endif

#ifndef objIsEqualToEach
#define objIsEqualToEach(obj, args...) objIsEqualToEach(obj,##args,nil)
#endif
#ifndef objIsEqualToEachAs
#define objIsEqualToEachAs(obj, args...) objIsEqualToEachAs(obj,##args,nil)
#endif

#ifndef objIsEqualToSomeone
#define objIsEqualToSomeone(obj, args...) objIsEqualToSomeone(obj,##args,nil)
#endif

#ifndef objIsEqualToSomeoneAs
#define objIsEqualToSomeoneAs(obj, args...) objIsEqualToSomeoneAs(obj,##args,nil)
#endif

#ifndef strAppendFormat
#define strAppendFormat(formatStr, args...) strAppendFormat(formatStr,##args,nil)
#endif

#ifndef numIsEqualToNum
#define numIsEqualToNum(...) numIsEqualToNum(LBBoxValue((__VA_ARGS__)))
#endif
#ifndef numIsEqualToNumAs
#define numIsEqualToNumAs(...) numIsEqualToNumAs(LBBoxValue((__VA_ARGS__)))
#endif

#ifndef numIsGreatThanNum
#define numIsGreatThan(...) numIsGreatThanNum(LBBoxValue((__VA_ARGS__)))
#endif
#ifndef numIsGreatThanNumAs
#define numIsGreatThanNumAs(...) numIsGreatThanNumAs(LBBoxValue((__VA_ARGS__)))
#endif

#ifndef numIsGreatEqualNum
#define numIsGreatEqualNum(...) numIsGreatEqualNum(LBBoxValue((__VA_ARGS__)))
#endif
#ifndef numIsGreatEqualNumAs
#define numIsGreatEqualNumAs(...) numIsGreatEqualNumAs(LBBoxValue((__VA_ARGS__)))
#endif

#ifndef numIsGreatEqualNum
#define numIsGreatEqualNum(...) numIsGreatEqualNum(__VA_ARGS__);
#endif
#ifndef numIsGreatEqualNumAs
#define numIsGreatEqualNumAs(...) numIsGreatEqualNumAs(__VA_ARGS__);
#endif

#ifndef numIsLessThanNum
#define numIsLessThanNum(...) numIsLessThanNum(LBBoxValue((__VA_ARGS__)))
#endif
#ifndef numIsLessThanNumAs
#define numIsLessThanNumAs(...) numIsLessThanNumAs(LBBoxValue((__VA_ARGS__)))
#endif

#ifndef numIsLessEqualNum
#define numIsLessEqualNum(...) numIsLessEqualNum(LBBoxValue((__VA_ARGS__)))
#endif

#ifndef numIsLessEqualNumAs
#define numIsLessEqualNumAs(...) numIsLessEqualNumAs(LBBoxValue((__VA_ARGS__)))
#endif

#ifndef objPerformSelectors
#define objPerformSelectors(sel , args...) objPerformSelectors(sel, ##args , nil)
#endif

#ifndef objPerformsSelectorArguments
#define objPerformsSelectorArguments(sel0,args0,args...) objPerformsSelectorArguments(sel0,args0,##args,nil)
#endif

#ifndef objPerformSelectorsAsWhatReturns
#define objPerformSelectorsAsWhatReturns(sel,args...) objPerformSelectorsAsWhatReturns(sel,##args,nil)
#endif

#ifndef objPerformsSelectorArgumentsAsWhatReturns
#define objPerformsSelectorArgumentsAsWhatReturns(sel0,arg0,args...) objPerformsSelectorArgumentsAsWhatReturns(sel0,arg0,##args,nil)
#endif

#ifndef viewAddSubviews
#define viewAddSubviews(view0,args...) viewAddSubviews(view0,args...,nil)
#endif



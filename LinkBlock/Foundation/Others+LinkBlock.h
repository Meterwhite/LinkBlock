//
//  Others+LinkBlock.h
//  LinkBlockProgram
//
//  Created by NOVO on 16/10/1.
//  Copyright © 2016年 NOVO. All rights reserved.
//

#import "LinkBlockDefine.h"


@interface NSObject(OtherLinkBlock)
LBDeclare BOOL (^arrIsContainer)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "使用arrContain替代");

LBDeclare BOOL (^strIsContain)(NSString* str)
NS_DEPRECATED_IOS(2_0, 2_0, "使用strContain替代");

LBDeclare NSArray* (^arrValuesOfType)(Class typeClass)
NS_DEPRECATED_IOS(2_0, 2_0, "使用arrObjsOfType替代");

LBDeclare BOOL     (^strIsContainEmoji)()
NS_DEPRECATED_IOS(2_0, 2_0, "使用strContainEmoji替代");

LBDeclare NSNumber* (^strIsContainEmoji_n)()
NS_DEPRECATED_IOS(2_0, 2_0, "使用strContainEmoji_n替代");

LBDeclare UIImage* (^attr_strDrawImgRect)(UIImage* image, CGRect rect)
NS_DEPRECATED_IOS(2_0, 2_0, "使用attr_strDrawToImg_linkTo替代");

- (NSObject*)newLink:(void(^)(NSObject* fromObj))aNewLink
NS_DEPRECATED_IOS(2_0, 2_0, "使用- linkInBlock替代- newLink");

LBDeclare NSMutableArray*      (^arrAddTo)(NSMutableArray* arr)
NS_DEPRECATED_IOS(2_0, 2_0, "使用arrAddToArr替代");

LBDeclare id           (^valueForKey)(NSString* key)
NS_DEPRECATED_IOS(2_0, 2_0, "使用objValueForKey代替");

LBDeclare NSObject*    (^setValueForKey)(id value,NSString* key)
NS_DEPRECATED_IOS(2_0, 2_0, "使用objSetValueForKey代替");

LBDeclare id           (^valueForKeyPath)(NSString* key)
NS_DEPRECATED_IOS(2_0, 2_0, "使用objValueForKeyPath代替");

LBDeclare NSObject*    (^setValueForKeyPath)(id value,NSString* key)
NS_DEPRECATED_IOS(2_0, 2_0, "使用objSetValueForKeyPath代替");

LBDeclare id           (^valueForKeySafe)(NSString* key)
NS_DEPRECATED_IOS(2_0, 2_0, "使用objValueForKey代替");

LBDeclare NSObject*    (^setValueForKeySafe)(id value,NSString* key)
NS_DEPRECATED_IOS(2_0, 2_0, "使用objSetValueForKey代替");

LBDeclare id           (^valueForKeyPathSafe)(NSString* key)
NS_DEPRECATED_IOS(2_0, 2_0, "使用objValueForKeyPath代替");

LBDeclare NSObject*    (^setValueForKeyPathSafe)(id value,NSString* key)
NS_DEPRECATED_IOS(2_0, 2_0, "使用objSetValueForKeyPath代替");

LBDeclare BOOL         (^isKindOf)( __unsafe_unretained Class classKind)
NS_DEPRECATED_IOS(2_0, 2_0, "使用objIsKindOf代替");

LBDeclare NSNumber*    (^isKindOf_n)( __unsafe_unretained Class classKind)
NS_DEPRECATED_IOS(2_0, 2_0, "使用objIsKindOf_n代替");

LBDeclare BOOL         (^isSubClassOf)( __unsafe_unretained Class classKind)
NS_DEPRECATED_IOS(2_0, 2_0, "使用objIsSubClassOf代替");

LBDeclare NSNumber*    (^isSubClassOf_n)( __unsafe_unretained Class classKind)
NS_DEPRECATED_IOS(2_0, 2_0, "使用objIsSubClassOf_n代替");

LBDeclare BOOL         (^isRespondsSEL)(SEL theSEL)
NS_DEPRECATED_IOS(2_0, 2_0, "使用objIsRespondsSEL代替");

LBDeclare NSNumber*    (^isRespondsSEL_n)(SEL theSEL)
NS_DEPRECATED_IOS(2_0, 2_0, "使用objIsRespondsSEL_n代替");

LBDeclare NSString*    (^className)()
NS_DEPRECATED_IOS(2_0, 2_0, "使用objClassName代替");

LBDeclare NSString*    (^superclassName)()
NS_DEPRECATED_IOS(2_0, 2_0, "使用objSuperclassName代替");

LBDeclare NSObject*    (^setTo)(id* toObject)
NS_DEPRECATED_IOS(2_0, 2_0, "使用objSetTo代替");

LBDeclare NSObject*    (^objValueRandom)()
NS_DEPRECATED_IOS(2_0, 2_0, "使用objValuesRandom代替");

LBDeclare NSObject*    (^objSetDelegate)(id delegate)
NS_DEPRECATED_IOS(2_0, 2_0, "使用objSetValueForKey_delegate代替");

LBDeclare NSObject*    (^objRemove)(id obj)
NS_DEPRECATED_IOS(2_0, 2_0, "使用objRemoveAll代替");

LBDeclare NSObject*    (^objBoolReverseForKey)(NSString * key)
NS_DEPRECATED_IOS(2_0, 2_0, "使用objBOOLNegationForKey代替");

LBDeclare UIImage*         (^imgBlur)(float percent)
NS_DEPRECATED_IOS(2_0, 2_0, "使用imgBlurXXX代替");

LBDeclare UILabel*         (^labAlignTop)()
NS_DEPRECATED_IOS(2_0, 2_0, "放弃的方法");
LBDeclare UILabel*         (^labAlignBottom)()
NS_DEPRECATED_IOS(2_0, 2_0, "放弃的方法");

LBDeclare NSMutableArray*  (^arrInsertBehind)(id obj, id behindObj)
NS_DEPRECATED_IOS(2_0, 2_0, "重命名方法为arrInsertNext");

LBDeclare NSMutableArray*  (^m_arrInsertBehind)(id obj, id behindObj)
NS_DEPRECATED_IOS(2_0, 2_0, "重命名方法为m_arrInsertNext");

LBDeclare UIView*      (^viewMasksToBounds)(BOOL b)
NS_DEPRECATED_IOS(2_0, 2_0, "使用viewClipsToBounds代替");

-(NSString*)ofNSString NS_DEPRECATED_IOS(2_0, 2_0, "使用as开头的方法代替");
-(NSMutableString*)ofNSMutableString NS_DEPRECATED_IOS(2_0, 2_0, "使用as开头的方法代替");
-(NSArray*)ofNSArray NS_DEPRECATED_IOS(2_0, 2_0, "使用as开头的方法代替");
-(NSMutableArray*)ofNSMutableArray NS_DEPRECATED_IOS(2_0, 2_0, "使用as开头的方法代替");
-(NSDictionary*)ofNSDictionary NS_DEPRECATED_IOS(2_0, 2_0, "使用as开头的方法代替");
-(NSMutableDictionary*)ofNSMutableDictionary NS_DEPRECATED_IOS(2_0, 2_0, "使用as开头的方法代替");
-(NSAttributedString*)ofNSAttributedString NS_DEPRECATED_IOS(2_0, 2_0, "使用as开头的方法代替");
-(NSMutableAttributedString*)ofNSMutableAttributedString NS_DEPRECATED_IOS(2_0, 2_0, "使用as开头的方法代替");
-(NSURL*)ofNSURL NS_DEPRECATED_IOS(2_0, 2_0, "使用as开头的方法代替");
-(NSUserDefaults*)ofNSUserDefaults NS_DEPRECATED_IOS(2_0, 2_0, "使用as开头的方法代替");
-(NSNumber*)ofNSNumber NS_DEPRECATED_IOS(2_0, 2_0, "使用as开头的方法代替");
-(NSValue*)ofNSValue NS_DEPRECATED_IOS(2_0, 2_0, "使用as开头的方法代替");
-(NSDate*)ofNSDate NS_DEPRECATED_IOS(2_0, 2_0, "使用as开头的方法代替");
-(NSData*)ofNSData NS_DEPRECATED_IOS(2_0, 2_0, "使用as开头的方法代替");
-(NSSet*)ofNSSet NS_DEPRECATED_IOS(2_0, 2_0, "使用as开头的方法代替");
-(NSMutableSet*)ofNSMutableSet NS_DEPRECATED_IOS(2_0, 2_0, "使用as开头的方法代替");
-(NSCalendar*)ofNSCalendar NS_DEPRECATED_IOS(2_0, 2_0, "使用as开头的方法代替");
-(UIView*)ofUIView NS_DEPRECATED_IOS(2_0, 2_0, "使用as开头的方法代替");
-(UIImage*)ofUIImage NS_DEPRECATED_IOS(2_0, 2_0, "使用as开头的方法代替");
-(UILabel*)ofUILabel NS_DEPRECATED_IOS(2_0, 2_0, "使用as开头的方法代替");
-(UIControl*)ofUIControl NS_DEPRECATED_IOS(2_0, 2_0, "使用as开头的方法代替");
-(UIButton*)ofUIButton NS_DEPRECATED_IOS(2_0, 2_0, "使用as开头的方法代替");
-(UIScrollView*)ofUIScrollView NS_DEPRECATED_IOS(2_0, 2_0, "使用as开头的方法代替");
-(UIImageView*)ofUIImageView NS_DEPRECATED_IOS(2_0, 2_0, "使用as开头的方法代替");
-(UITableView*)ofUITableView NS_DEPRECATED_IOS(2_0, 2_0, "使用as开头的方法代替");
-(UIColor*)ofUIColor NS_DEPRECATED_IOS(2_0, 2_0, "使用as开头的方法代替");
-(UIViewController*)ofUIViewController NS_DEPRECATED_IOS(2_0, 2_0, "使用as开头的方法代替");
-(UITextField*)ofUITextField NS_DEPRECATED_IOS(2_0, 2_0, "使用as开头的方法代替");
-(UITextView*)ofUITextView NS_DEPRECATED_IOS(2_0, 2_0, "使用as开头的方法代替");
-(UIWebView*)ofUIWebView NS_DEPRECATED_IOS(2_0, 2_0, "使用as开头的方法代替");
@end



#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperation.h"
#import "AFNetworkReachabilityManager.h"
#import "AFHTTPRequestOperationManager.h"
#import "BaseOperator.h"
#import "BaseModel.h"
#import "ParseJson.h"
//#import "MBProgressHUD.h"

@interface NetworkingManager : NSObject

@property(nonatomic, strong) BaseOperator* baseOperator;
@property(nonatomic, strong) id<ParseJson> jsonDelegate;
//@property(nonatomic, strong) MBProgressHUD* hud;

+(NetworkingManager*) sharedInstance;

-(void) asyncTaskWithOperator:(BaseOperator*) operate withSuccessCallBack:(void (^)(BaseModel* model))successCallback andFaildCallBack:(void(^)(id response))faildCallback;
-(void) asyncPostTaskWithOperator:(BaseOperator*) operate withSuccessCallBack:(void (^)(BaseModel* model))successCallback andFaildCallBack:(void(^)(id response))faildCallback;

@end
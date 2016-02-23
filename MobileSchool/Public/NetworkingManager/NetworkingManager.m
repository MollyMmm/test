

#import "NetworkingManager.h"
#import "UIActivityIndicatorView+AFNetworking.h"
static NetworkingManager* manager = nil;

@implementation NetworkingManager

+(NetworkingManager*) sharedInstance{
    static NetworkingManager *sharedSingleton = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{

        sharedSingleton = [self alloc];
    });
    return sharedSingleton;
}
/**
 *  get请求 Molly 16/02/21 更改方法名
 *
 *  @param operate         当前执行的操作
 *  @param successCallback 成功返回参数
 *  @param faildCallback   失败返回参数
 */
-(void) asyncTaskWithOperator:(BaseOperator*) operate withSuccessCallBack:(void (^)(BaseModel* model))successCallback andFaildCallBack:(void(^)(id response))faildCallback{
  
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];

    _jsonDelegate = operate;
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 30;
    
    [manager GET:operate.url parameters:operate.paramsDic success:^void(AFHTTPRequestOperation * __nonnull operation, id __nonnull responseObject) {
        
        NSLog(@"url -- %@",operate.url);
        BaseModel* baseModel = [[BaseModel alloc] init];
       // baseModel.retDataStr = requestTmp;
        
        NSString *requestTmp = [NSString stringWithString:operation.responseString];
        
        NSData *resData = [[NSData alloc] initWithData:[requestTmp dataUsingEncoding:NSUTF8StringEncoding]];
        NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:resData options:NSJSONReadingMutableLeaves error:nil];
        //判断json转化后是否为字典
        if (resultDic && [resultDic isKindOfClass:[NSDictionary class]]) {
            
            baseModel.data = resultDic;

        }else{
            baseModel.data = @{@"ret":operation.responseString};
            baseModel.retArr = [NSJSONSerialization JSONObjectWithData:resData options:NSJSONReadingMutableLeaves error:nil];
        }
      
        [_jsonDelegate parseJson:baseModel];

        successCallback(baseModel);
    } failure:^void(AFHTTPRequestOperation * __nonnull operation, NSError * __nonnull error) {
        NSLog(@"Error: %@", error);
        faildCallback(error);
    }];
}
/**
 *  post请求 Molly 16/02/21 更改方法名
 *
 *  @param operate         当前执行的操作
 *  @param successCallback 成功返回参数
 *  @param faildCallback   失败返回参数
 */

-(void) asyncPostTaskWithOperator:(BaseOperator*) operate withSuccessCallBack:(void (^)(BaseModel* model))successCallback andFaildCallBack:(void(^)(id response))faildCallback{
    
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    _jsonDelegate = operate;
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = 30;
    
    [manager POST:operate.url parameters:operate.paramsDic success:^void(AFHTTPRequestOperation * __nonnull operation, id __nonnull responseObject) {
        
        NSLog(@"url -- %@",operate.url);
        BaseModel* baseModel = [[BaseModel alloc] init];
        
        NSString *requestTmp = [NSString stringWithString:operation.responseString];
        
        NSData *resData = [[NSData alloc] initWithData:[requestTmp dataUsingEncoding:NSUTF8StringEncoding]];
        NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:resData options:NSJSONReadingMutableLeaves error:nil];
        //判断json转化后是否为字典
        if (resultDic && [resultDic isKindOfClass:[NSDictionary class]]) {
            
            baseModel.data = resultDic;
            
        }else{
            baseModel.data = @{@"ret":operation.responseString};
            baseModel.retArr = [NSJSONSerialization JSONObjectWithData:resData options:NSJSONReadingMutableLeaves error:nil];
        }
        
        [_jsonDelegate parseJson:baseModel];
        
        successCallback(baseModel);
    } failure:^void(AFHTTPRequestOperation * __nonnull operation, NSError * __nonnull error) {
        NSLog(@"Error: %@", error);
        faildCallback(error);
    }];
}
@end

#include <UIKit/UIKit.h>
#include <Cephei/HBPreferences.h>
#include "SparkAppList.h"

#include "NSTask.h"

@interface SBIcon : NSObject
@end

@interface SBLeafIcon : SBIcon <NSCopying> {
	NSString* _applicationBundleID;
}
@property (nonatomic,copy,readonly) NSString * applicationBundleID; 
-(NSString *)applicationBundleID;
@end

@interface LSApplicationProxy : NSObject
+ (LSApplicationProxy *)applicationProxyForIdentifier:(id)appIdentifier;
@property(readonly) NSString * applicationIdentifier;
@property(readonly) NSString * bundleVersion;
@property(readonly) NSString * bundleExecutable;
@property(readonly) NSArray * deviceFamily;
@property(readonly) NSURL * bundleContainerURL;
@property(readonly) NSString * bundleIdentifier;
@property(readonly) NSURL * bundleURL;
@property(readonly) NSURL * containerURL;
@property(readonly) NSURL * dataContainerURL;
@property(readonly) NSString * localizedShortName;
@property(readonly) NSString * localizedName;
@property(readonly) NSString * shortVersionString;
@property (readonly) BOOL isStickerProvider;
@end

%hook SBLeafIcon
-(void)launchFromLocation:(id)arg1 context:(id)arg2 {
    NSLog(@"Crashia An app has been launched!");
    NSLog(@"Crashia App that has been launched: %@",[self applicationBundleID]);
    if([SparkAppList doesIdentifier:@"com.zachary7829.crashiaprefs" andKey:@"excludedApps" containBundleIdentifier:[self applicationBundleID]]) {
        NSLog(@"Crashia This app is selected in preferences!");
        NSString *appName = [LSApplicationProxy applicationProxyForIdentifier:[self applicationBundleID]].localizedName;
        const char *appNameNormal = [appName UTF8String];
        NSLog(@"Crashia App that has been launched: %s",appNameNormal);
        NSTask *task = [[NSTask alloc] init];
        task.launchPath = @"/usr/bin/killall";
        task.arguments = @[appName];
        [task launch];
    }
    %orig;
}
%end
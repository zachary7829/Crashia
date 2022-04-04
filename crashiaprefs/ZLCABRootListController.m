#import <Foundation/Foundation.h>
#import "ZLCABRootListController.h"

#import "SparkAppListTableViewController.h"

@implementation ZLCABRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

-(void)selectExcludeApps
{
    // Replace "com.spark.notchlessprefs" and "excludedApps" with your strings
    SparkAppListTableViewController* s = [[SparkAppListTableViewController alloc] initWithIdentifier:@"com.zachary7829.crashiaprefs" andKey:@"excludedApps"];

    [self.navigationController pushViewController:s animated:YES];
    self.navigationItem.hidesBackButton = FALSE;
}
- (void)openGitHub {
	[[UIApplication sharedApplication]
	openURL:[NSURL URLWithString:@"https://github.com/zachary7829"]
	options:@{}
	completionHandler:nil];
}

- (void)openTwitter {
	[[UIApplication sharedApplication]
	openURL:[NSURL URLWithString:@"https://twitter.com/QuickUpdate5"]
	options:@{}
	completionHandler:nil];
}

-(void)openReddit {
	[[UIApplication sharedApplication]
	openURL:[NSURL URLWithString:@"https://reddit.com/u/zachary7829"]
	options:@{}
	completionHandler:nil];
}
@end

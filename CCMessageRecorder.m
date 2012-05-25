#import "CCMessageRecorder.h"

@interface CCMessageRecorder ()
@property(strong) NSMutableArray *invocations;
@end

@implementation CCMessageRecorder
@synthesize invocations;

- (id) init
{
    self = [super init];
    [self setInvocations:[NSMutableArray array]];
    return self;
}

- (void) replayMessagesOnTarget: (id) target
{
    for (NSInvocation *op in invocations)
        [op invokeWithTarget:target];
}

- (void) forwardInvocation: (NSInvocation*) invocation
{
    [invocations addObject:invocation];
}

- (NSMethodSignature*) methodSignatureForSelector: (SEL) selector
{
    NSMethodSignature *ours = [super methodSignatureForSelector:selector];
    return ours ? ours : [super methodSignatureForSelector:@selector(forwardInvocation:)];
}

@end

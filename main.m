#import "CCMessageRecorder.h"

int main(int argc, const char * argv[])
{
    @autoreleasepool
    {
        id proxy = [[CCMessageRecorder alloc] init];
        [proxy appendString:@"Hello,"];
        [proxy appendString:@" "];
        [proxy appendString:@"world!"];

        NSMutableString *str = [NSMutableString string];
        [proxy replayMessagesOnTarget:str];
        NSLog(@"%@", str);
    }

    return 0;
}


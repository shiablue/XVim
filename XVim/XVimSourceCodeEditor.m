//
//  XVimSourceCodeEditor.m
//  XVim
//
//  Created by Tomas Lundell on 31/03/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "XVimSourceCodeEditor.h"
#import "IDESourceCodeEditor.h"
#import "Hooker.h"

@implementation XVimSourceCodeEditor

+ (void) hook
{
    Class delegate = NSClassFromString(@"IDESourceCodeEditor");
	[Hooker hookMethod:@selector(textView:willChangeSelectionFromCharacterRanges:toCharacterRanges:) 
			   ofClass:delegate 
			withMethod:class_getInstanceMethod([self class], @selector(textView:willChangeSelectionFromCharacterRanges:toCharacterRanges:)) 
   keepingOriginalWith:@selector(textView_:willChangeSelectionFromCharacterRanges:toCharacterRanges:)];
}

- (NSArray*) textView:(NSTextView *)textView willChangeSelectionFromCharacterRanges:(NSArray *)oldSelectedCharRanges toCharacterRanges:(NSArray *)newSelectedCharRanges
{
    return newSelectedCharRanges;
}

@end

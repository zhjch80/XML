//
//  SMXMLDocument.h
//
//  Created by 润华联动 on 14-11-19.
//  Copyright (c) 2014年 润华联动. All rights reserved.
//

#import <Foundation/Foundation.h>

/*
 
 SMXMLDocument
 -------------
 Created by Nick Farina (nfarina@gmail.com)
 Version 1.1
 
 */

// SMXMLDocument is a very handy lightweight XML parser for iOS.

extern NSString *const RMXMLDocumentErrorDomain;

@class RMXMLDocument, RMXMLElementChildren, RMXMLElementValueFinder;

//
// XMLElement class; the workhorse.
//

@interface RMXMLElement : NSObject<NSXMLParserDelegate>

@property (nonatomic, weak) RMXMLDocument *document;
@property (nonatomic, weak) RMXMLElement *parent;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, retain) NSString *value;
@property (nonatomic, retain) NSArray *children;
@property (nonatomic, retain) NSDictionary *attributes;
@property (nonatomic, readonly) RMXMLElement *firstChild, *lastChild;
@property (nonatomic, readonly) RMXMLElementChildren *all;
@property (nonatomic, readonly) RMXMLElementValueFinder *values;

- (id)initWithDocument:(RMXMLDocument *)document;

//
// Method-based document traversing
//

- (RMXMLElement *)childNamed:(NSString *)name;
- (NSArray *)childrenNamed:(NSString *)name;
- (RMXMLElement *)childWithAttribute:(NSString *)attributeName value:(NSString *)attributeValue;
- (NSString *)attributeNamed:(NSString *)name;
- (RMXMLElement *)descendantWithPath:(NSString *)path;
- (NSString *)valueWithPath:(NSString *)path;

- (NSString *)fullDescription; // like -description, this writes the document out to an XML string, but doesn't truncate the node values.
- (NSString *)encodedDescription; // like -fullDescription, but this does HTML encoding of element content

@end

//
// XMLDocument class; simply adds methods to parse an XML document and remember any errors.
//

@interface RMXMLDocument : RMXMLElement

@property (nonatomic, retain) NSError *error;

- (id)initWithData:(NSData *)data error:(NSError **)outError;

+ (RMXMLDocument *)documentWithData:(NSData *)data error:(NSError **)outError;

@end
